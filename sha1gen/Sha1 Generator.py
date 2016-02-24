######################## FUNCIONES DE LA APLICACION ####################################

# Importa paquetes necesarios
from sys import *
from os import system
from Tkinter import *
import hashlib
import subprocess

#   Encripta lo que el usuario introduce y luego
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

def hacer_click():
    _valor = str(entrada_txt.get())
    sha1_digest(_valor)
    tag.config(text="Texto copiado!")

############################ GUI DE LA APLICACION #######################################

#Crea la ventana
raiz = Tk()

#Modifica la ventana y lo que hay dentro
raiz.title('Sha1 Generator')
raiz.geometry('205x108')

    #Ventana
ventana = Frame(raiz)
ventana.grid(column=0, row=0, padx=(10,50), pady=(10,10))
ventana.columnconfigure(0,weight=1)
ventana.rowconfigure(0,weight=1)

    #Etiquetas de texto
tag = Label(ventana, text="Texto a encriptar")
tag.grid(column=2, row=1, pady=(5,5))

    #Botones
button = Button(ventana, text="Hash it!", command=hacer_click)
button.grid(column=2, row=3, padx=(5,5), pady=(5,5))

    #Campo de entrada de texto
entrada_txt = Entry(ventana, width=20, textvariable="", show='*')
entrada_txt.grid(column=2, row=2)

#Poner en marcha el ciclo de eventos
raiz.mainloop()
