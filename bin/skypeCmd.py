import codecs

cmdvar = {}

def norm(usrs, valid=['ONLINE']):
    f = usrs if 'ALL' in valid else filter(lambda x: x.OnlineStatus in valid, usrs)
    return sorted(f, key=lambda x:x.OnlineStatus)

def cmdLog(msg):
    f = open('/home/krgr/bin/log', 'a')
    f = codecs.lookup('utf_8')[-1](f)
    f.write(msg.FromHandle + ": " + msg.Body.encode('utf_8') + '\n')
    
def setvote(msg):
    global cmdvar
    if 'vote' not in cmdvar: cmdvar['vote']={}
    if msg.Chat not in cmdvar['vote']: cmdvar['vote'][msg.Chat] = {}
    cmdvar['vote'][msg.Chat].update({msg.Body.split(" ")[1]:{}})
    print cmdvar

def vote(msg):
    global cmdvar
    title = msg.Body.split(' ')[1]
    select = msg.Body.split(' ')[2]
    cmdvar['vote'][msg.Chat][title].update({msg.FromHandle:select})
    
def showvote(msg):
    global cmdvar
    title =  msg.Body.split(' ')[1]
    m = msg.Chat.Members
    voted = cmdvar['vote'][msg.Chat][title]
    unvoted = map(lambda x:x.Handle, filter(lambda x: x.Handle not in voted.keys(), m))
    
    str = '\n[voted]\n'
    for v in voted.iteritems():
        str += v[0] + ": " + v[1] + "\n"
    str += '\n[unvoted]\n'
    for v in unvoted:
        str += v + '\n'
    return str
    
def infoVote(msg, vote):
    unvoted = len(msg.Chat.Members) - len(vote[1])
    return (vote[0], (unvoted==0), unvoted)

def showvotes(msg):
    global cmdvar
    tmp = map(lambda x: infoVote(msg, x), cmdvar['vote'][msg.Chat].iteritems())
    st = '\n'
    for i in tmp:
        st += str(i[0]) + ': ' + 'Finished==' + str(i[1]) + ', notvoted==' + str(i[2]) + '\n'
    return st
    

def deletevotes(chat):
    global cmdvar
    cmdvar['vote'][chat].clear()
    

def memo(msg, num):
    global cmdvar
    lines = open('/home/krgr/bin/memo'+str(num)).read()
    return lines


def skypeCmd(skype, msg):
    prefix = ':'
    cmds = {'hello': lambda x: 'hello ' + msg.FromDisplayName,
            'setvote': setvote,
            'vote': vote,
            'showvote': showvote,
            'showvotes': showvotes,
            'memo': lambda x: memo(x, 1),
            'memo2': lambda x: memo(x, 2),
            }
    
    if msg.Body[0]==prefix:
        cmdLog(msg)
        return cmds.get(msg.Body[1:].split(' ')[0], lambda x: None)(msg)
