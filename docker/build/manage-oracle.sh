#!/bin/bash

export ORACLE_BASE=/u01/app/oracle
export ORACLE_HOME=${ORACLE_BASE}/product/12.1.0/dbhome_1
export ORACLE_SID=ORCL

stop_database() {
	$ORACLE_HOME/bin/sqlplus / as sysdba << EOF
	shutdown abort
	exit
EOF
	exit
}
start_database() {
	$ORACLE_HOME/bin/sqlplus / as sysdba << EOF
	startup
        alter pluggable database all open read write
	exit
EOF
}
create_pfile() {
	$ORACLE_HOME/bin/sqlplus -S / as sysdba << EOF
	set echo off pages 0 lines 200 feed off head off sqlblanklines off trimspool on trimout on
	spool ${ORACLE_HOME}/init_${ORACLE_SID}.ora
	select 'spfile="'||value||'"' from v\$parameter where name = 'spfile';
	spool off
	exit
EOF
}

trap stop_database SIGTERM

printf "LISTENER=(DESCRIPTION_LIST=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=$(hostname))(PORT=1521))(ADDRESS=(PROTOCOL=IPC)(KEY=EXTPROC1521))))\n" > $ORACLE_HOME/network/admin/listener.ora
$ORACLE_HOME/bin/lsnrctl start

if [ ! -f ${ORACLE_HOME}/DATABASE_IS_SETUP ]; then
	
	$ORACLE_HOME/bin/dbca -silent -responseFile /home/oracle/orclDb.rsp
	create_pfile
	if [ $? -eq 0 ]; then
		touch ${ORACLE_HOME}/DATABASE_IS_SETUP
	fi
else
	mkdir -p ${ORACLE_HOME}/app/oracle/admin/$(hostname)/adump
	$ORACLE_HOME/bin/sqlplus / as sysdba << EOF
	startup pfile=${ORACLE_HOME}/init_${ORACLE_SID}.ora
        alter pluggable database pdborcl open;
	exit
EOF
fi

tail -f /u01/app/oracle/diag/rdbms/orcl/ORCL/trace/alert_ORCL.log &
wait
