FROM    dbinstaller
MAINTAINER robert.wunderlich@oracle.com

USER oracle

COPY resources/ /home/oracle/

RUN /home/oracle/database/runInstaller -silent -force -waitforcompletion -responsefile /home/oracle/orclSw.rsp -ignoresysprereqs -ignoreprereq -showProgress

USER    root
RUN /u01/app/oraInventory/orainstRoot.sh && /u01/app/oracle/product/12.1.0/dbhome_1/root.sh -silent


RUN  chown -R oracle:dba /home/oracle &&  chown -R oracle:dba /u01 &&  chmod 700 /home/oracle/manage-oracle.sh && chmod 700 /home/oracle/dbenv.sh

RUN rm -Rf /tmp/* && rm -Rf /oracle/database

USER oracle

EXPOSE  1521
CMD /home/oracle/manage-oracle.sh
