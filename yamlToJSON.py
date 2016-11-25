#!/usr/bin/env python
 
import simplejson
import sys
import yaml
  
print simplejson.dumps(yaml.load(str(sys.stdin.read())), sort_keys=True)
#python -c 'import simplejson,sys,yaml;print simplejson.dumps(yaml.load(str(sys.stdin.read())), sort_keys=True)'
