import re
def hc_splitcode(code):
    codes = code.split('\n');
    result = []
    currline = ""
    for line in codes:
        if line.startswith('def '):
            if(currline!="") :
                result.append(currline)
            currline = line+'\n'
        else:
            currline +=line+'\n'
    if(currline!=""):
        result.append(currline)
    return result
