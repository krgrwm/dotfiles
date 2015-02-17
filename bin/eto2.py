import xte

x = xte.xte()
time = 400000

x.mmove([824, 490]) #baikyaku
x.usleep(time)
x.mclick(x.MLEFT)

x.mmove([505, 498]) #ok
x.usleep(time)
x.mclick(x.MLEFT)
