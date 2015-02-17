class c:
    PURPLE = '\033[95m'
    BLUE = '\033[94m'
    GREEN = '\033[92m'
    ORANGE = '\033[93m'
    RED = '\033[91m'
    ENDC = '\033[0m'

class ca:
    Standard = '0'
    Bold = '1'
    Reverse = '7'
    
def cld(str, color, attr=ca.Standard):
    return '\033' + '[' + attr + ';' + (color+str+c.ENDC)[2:]

def p(x, c=c.ENDC, a=ca.Standard, e='\n'):
    print(cld(x, c, a), end=e)

p("a", c.PURPLE)
