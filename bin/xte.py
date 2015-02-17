import os
from subprocess import Popen, PIPE

class xdotool(object):
    cmd = "xdotool "

    def xdotoolcmd(self, _xtecmd, arg):
        run = self.cmd+_xtecmd+" "+arg
        #print(run)
        os.system(run)

class xte(object):
    cmd = "xte "
    MLEFT=1
    MMIDDLE=2
    MRIGHT=3

    def xtecmd(self, _xtecmd, arg):
        run = self.cmd+"'"+_xtecmd+" "+arg+"'"
#        print(run)
        os.system(run)
        
    def mousepos(self):
        cmdline = "ls"
        r = Popen("xmousepos", shell=True, stdin=PIPE, stdout=PIPE, close_fds=True).stdout
        pos = r.readline().rstrip().split()
        return [int(pos[0]), int(pos[1])]

    def key(self, _key):
        self.xtecmd("key", _key)

    def keydown(self, _key):
        self.xtecmd("keydown", _key)

    def keyup(self, _key):
        self.xtecmd("keyup", _key)

    def str(self, _str):
        self.xtecmd("str", _str)

    def mclick(self, i):
        self.xtecmd("mouseclick", str(i))

    def mdown(self, i):
        self.xtecmd("mousedown", str(i))

    def mup(self, i):
        self.xtecmd("mouseup", str(i))

    def mmove(self, pos):
        self.xtecmd("mousemove", str(pos[0])+" "+str(pos[1]))

    def mrmove(self, pos):
        self.xtecmd("mousermove", str(pos[0])+" "+str(pos[1]))

    def sleep(self, sec):
        self.xtecmd("sleep", str(sec))

    def usleep(self, usec):
        self.xtecmd("sleep", str(usec))

    def usleep(self, msec):
        self.xtecmd("usleep", str(msec))
