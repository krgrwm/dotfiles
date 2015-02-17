def progress(n, r):
    return '|' + '*' * (int)(n/10.0)*r + '  ' * (int)((100-n)/10)*r + '|'

