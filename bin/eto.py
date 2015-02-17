import xte

x = xte.xte()
time = 400000

x.mmove([677, 610]) #hukubiki
x.usleep(time)
x.mclick(x.MLEFT)

x.mmove([505, 498]) #ok
x.usleep(time)
x.mclick(x.MLEFT)

x.mmove([814, 503]) #baikyaku

#x.mmove([505, 498]) #ok
#x.mclick(x.MLEFT)
