import subprocess
import os

# p1 = subprocess.Popen("dmenu_path", stdout=subprocess.PIPE)
# p2 = subprocess.Popen("dmenu", stdin=p1.stdout)

# strip deletes leading and trailng spaces
com = subprocess.check_output("dmenu_path | dmenu", shell=True).decode("UTF-8").strip()
#print (com)

f = open("/home/chuck/.local/share/applications/nvim.desktop", "r")
# line = f.readline()
# while "Exec=" not in line:
#     print(line)
# f.close()

while True:
    line = f.readline()
    print(line)

    if not line:
        f.close()
        break
#dirs = [ "~/.local/share/applications/", "/usr/share/applications/" ]
#
#command = subprocess.run(menu)
#
#
#for path in dirs:
#    for file in os.walk(path):
#        print(file)
#
# try:
#     f = open("~/.local/share/applications/nvim.desktop", "r")
#     line = f.readline()
#     while "Exec=" not in line :
#         line = f.readline()
#     line = line[4:len(line)]
#     subprocess.run(line)
# except:
#     print ("Diocane")
