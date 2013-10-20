s = 0

import signal, os
import sys
import resource
import traceback
import json

from HCGuards import hc_builtins
from HCGuards import hc_globals
from HCUtility import hc_splitcode
from RestrictedPython import compile_restricted

judge_result = {}
from Test import passed
from Test import total
import Test
from Test import funcname

def handler(signum, frame):
    judge_result["result"] = "Timeout"
    judge_result["passed"] = passed
    judge_result["total"] = total;
    judge_result["details"] = "Timeout"
    print json.dumps(judge_result)
    sys.exit(0)

resource.setrlimit(resource.RLIMIT_STACK,(1000000,1000000))
resource.setrlimit(resource.RLIMIT_DATA,(1000000,1000000))
# read test code

# read user submitted code
with open('usercode','r') as f:
    usercode_text = f.read()

usercodes = hc_splitcode(usercode_text)
hc_globals_copy = hc_globals.copy()


signal.signal(signal.SIGALRM, handler)
signal.alarm(5)

# compile and exec each piece of user code
for usrcode in usercodes:
    local_env = {}
    code = compile_restricted(usrcode,'<string>','exec')
    try:
        exec(code ,hc_globals_copy, local_env)
    except Exception, e:
        #traceback.print_exc(file = sys.stdout)
        judge_result["result"] = "Runtime Error"
        judge_result["passed"] = passed
        judge_result["total"] = total;
        judge_result["details"] = str(e)
        print json.dumps(judge_result)
        sys.exit(0)
        
    #add local_env to hc_globals
    for s in local_env:
        locals()[s] = local_env[s]
        hc_globals_copy[s] = local_env[s]
       
    #print locals()
    #print hc_globals[addtwo]
    locals()["hc_entry_func"] = locals().get(funcname)
    #print locals()
try:
    result = json.dumps(Test.test(hc_entry_func))
except Exception, e:
    judge_result["result"] = "Runtime Error"
    judge_result["passed"] = passed
    judge_result["total"] = total;
    judge_result["details"] = str(e)
    print json.dumps(judge_result)
    sys.exit(0)

signal.alarm(0);
print result
sys.exit(0)

