from cascade_base import *
import re

groupid = cascade.factory.create("identifier")
groupid.id = "ALL_USERS"
groupid.type = "group"

gresponse = cascade.service.read(auth, groupid)

userlist = re.split(";", gresponse.asset.group.users)

userid = cascade.factory.create("identifier")
userid.type = "user"
for i in userlist:
   userid.id = i
   ures = cascade.service.read(auth, userid)
   print ures.asset.user.email

