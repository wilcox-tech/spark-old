Settings.defaults[:instance_name] = 'Wilcox Technologies Spark Portal'
Settings.defaults[:org_name] = 'Wilcox Technologies, LLC'

# Obviously this part only work internally to W-T :)
Settings.defaults[:ldap_servers] = ['ind-auth002.wilcox-tech.com','ind-auth001.wilcox-tech.com']
Settings.defaults[:ldap_base] = 'ou=User Accounts,dc=wilcox-tech,dc=com'

# You usually want this.  Enable simple_tls encryption and change port to 636.
Settings.defaults[:ldap_ssl] = true

# This is the anonymous user to bind with.  DO NOT GIVE IT ADMIN CREDENTIALS!
# If you have nss_ldap or bugzilla or anything else in your env using LDAP, it will usually have an
# anonymous user account to use.  If you don't, make one!
Settings.defaults[:ldap_bind_dn] = 'cn=LDAP Bind,ou=Services,ou=User Accounts,dc=wilcox-tech,dc=com'
Settings.defaults[:ldap_bind_pw] = 'Change this to suit your environment!!!!'

# Change this on old Active Directory (2000/2003) if SFU is not installed
Settings.defaults[:ldap_uid_attr] = 'uid'
