from cascade_base import *
import re

groupid = cascade.factory.create("identifier")
groupid.id = "ALL_USERS"
groupid.type = "group"

gresponse = cascade.service.read(auth, groupid)

userlist = re.split(";", gresponse.asset.group.users)
userlist = [ 'vraut001',
      'hmira001',
      'aadam007',
      'omato001',
      'syoub001',
      'rleon'];

userid = cascade.factory.create("identifier")
userid.type = "user"
e = cascade.factory.create("asset")
for i in userlist:
   userid.id = i
   ures = cascade.service.read(auth, userid)
   e.user = ures.asset.user
   if(e.user.authType == "ldap" or True):
      e.user.authType = "custom"
      cascade.service.edit(auth, e)
   else:
      print i + " was not changed"
