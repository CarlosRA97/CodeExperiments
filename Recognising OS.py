#   Recognise an special OS depending on the VMPython
import os, sys

if os.name == 'nt':
    pass # Windows
else:
    pass # other

#   Recognise an special OS depending on directly on the OS

if sys.platform.startswith('darwin'):

elif sys.platform.startswith('linux'):

elif sys.platform.startswith('win32'):
