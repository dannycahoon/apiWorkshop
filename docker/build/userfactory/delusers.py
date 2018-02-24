DOMAIN_NAME='drt'
ADMIN_URL='t3://slc05agx:7001'
ADMIN_USER='weblogic'
ADMIN_PWD='welcome1'
REALM='myrealm'


count=int(sys.argv[1])
prefix=sys.argv[2]


connect(ADMIN_USER, ADMIN_PWD, ADMIN_URL)
serverConfig()
authenticatorPath= '/SecurityConfiguration/' + DOMAIN_NAME + '/Realms/' + REALM + '/AuthenticationProviders/DefaultAuthenticator'
print authenticatorPath
cd(authenticatorPath)
print ''
print ''


print 'Creating Users...'
i=1
while(i <= count) :
    username = prefix + str(i)
    try:
        cmo.removeUser(username)
        print '--- user removed: ', username
    except Exception, e:
        print '--- error removing user: ', username
        print e
    i = i+1
print 'done'
print ''

