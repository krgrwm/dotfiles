import xte

x = xte.xte()
x.mclick(x.MLEFT)
x.mclick(x.MLEFT)
x.keydown('Control_L')
x.key('C')
x.keyup('Control_L')

x.keydown('Control_L')
x.keydown('Alt_R')
x.keydown('Shift_L')
x.key('C')
x.keyup('Control_L')
x.keyup('Alt_R')
x.keyup('Shift_L')
