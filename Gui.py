from Tkinter import *


############################ GUI DE LA APLICACION #######################################

#Crea la ventana
raiz = Tk()

#Modifica la ventana y lo que hay dentro
raiz.title('')
raiz.geometry('300x400')

    #Ventana
ventana = Frame(raiz)
ventana.grid(column=0, row=0, padx=(10,50), pady=(10,10))
ventana.columnconfigure(0,weight=1)
ventana.rowconfigure(0,weight=1)

    #Etiquetas de texto
tag = Label(ventana, text="Nombre")
tag.grid(column=1, row=1, padx=(5,5), pady=(5,5))
tag2 = Label(ventana, text="Apellidos")
tag2.grid(column=1, row=2, padx=(5,5), pady=(5,5))
tag3 = Label(ventana, text="E-Mail")
tag3.grid(column=1, row=3, padx=(5,5), pady=(5,5))

    #Botones
button = Button(ventana, text="Hash it!", command=hacer_click)
button.grid(column=2, row=3, padx=(5,5), pady=(5,5))

    #Campo de entrada de texto
entrada_nombre = Entry(ventana, width=20, textvariable="")
entrada_nombre.grid(column=2, row=1)
entrada_apellido = Entry(ventana, width=20, textvariable="")
entrada_apellido.grid(column=2, row=2)
entrada_email = Entry(ventana, width=20, textvariable="")
entrada_email.grid(column=2, row=3)

#Poner en marcha el ciclo de eventos
raiz.mainloop()