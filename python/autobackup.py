import os
import subprocess
from datetime import date

cascade_folder      = "/usr/local/Cascade\ Server"
cascade_database    = "cascade"
cascade_db_user     = "CASCADE_USER"
cascade_db_passwd   = "CASCADE_PASSWORD"
today               = date.today()

os.chdir(cascade_folder)

cascade_shutdown    = subprocess.Popen("./cascade.sh stop", shell=True)
cascade_shutdown.wait()
print "Cascade has shut down"

dump_output         = open("cascade_backup_" + str(today.year) + str(today.month) +
        str(day) + ".bkp.gz", "wb")

cascade_startup     = subprocess.Popen("./cascade.sh start")
print "Cascade has restarted"
