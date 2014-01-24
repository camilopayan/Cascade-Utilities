import os
import subprocess

cascade_folder = "/usr/local/Cascade\ Server"

os.chdir(cascade_folder)

cascade_shutdown    = subprocess.Popen("./cascade.sh stop", shell=True)
cascade_shutdown.wait()
print "Cascade shut down with return status " + cascade_shutdown.return_code
cascade_startup     = subprocess.Popen("./cascade.sh start")
