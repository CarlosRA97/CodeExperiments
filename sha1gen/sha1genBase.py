#!/usr/bin/env python

import hashlib
import subprocess
from sys import *
from os import system

#   Encripta lo el usuario introduce y luego
#   copia en el portapapeles el resultado
def sha1_digest(key):
    
    h = hashlib.sha1(key).hexdigest()
    
    if platform.startswith('darwin') or platform.startswith('linux'):
        cp2clipb(h)
    elif platform.startswith('win32'):
        copy2clip(h)

def copy2clip(txt):
    
    cmd='echo '+txt.strip()+'|clip'
    
    return subprocess.check_call(cmd, shell=True)

def cp2clipb(txt):
    
    return system("echo '%s' | pbcopy" % txt)

#Llamamos a la funcion para hacer el hash
sha1_digest(raw_input("Introducee un texto: "))