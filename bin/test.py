import xte

x = xte.xte()
x.str('python')
x.key('Return')
x.str('import xte')
x.key('Return')
x.key('Return')
x.str('x=xte.xte')
x.key('Return')

x.sleep(1)
x.keydown('Control_L')
x.key('l')
x.keyup('Control_L')
