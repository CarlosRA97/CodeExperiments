import sqlite3, datetime

print "***** Programa para insertar registros en la tabla database *****"

cadena_texto = raw_input("introduzca una cadena de texto: ")
entero = input("introduzca un numero entero: ")
decimal = input("introduzca un numero decimal: ")

try: entero = int(entero)
except ValueError:
    print entero, "no es un numero entero"
    exit()

try: decimal = float(decimal) or int(decimal)
except ValueError:
    print decimal, "no es un decimal"
    exit()

#Establecer la conexion
conexion = sqlite3.connect("database.sqlite3")

#Seleccionar el cursor para iniciar la consola
consulta = conexion.cursor()

#Valor de los argumentos
argumentos = (cadena_texto, entero, decimal, datetime.date.today())

sql = """
    INSERT INTO database(cadena_texto, entero, decimal, fecha)
    VALUES (?, ?, ?, ?)
    """

#Realizar la consulta
if consulta.execute(sql, argumentos):
    print "Registro guardado con exito"
else:
    print "Ha ocurrido un error al guardar el registro"

#Terminamos la consulta
consulta.close()

#Guardamos los cambios en la base de datos
conexion.commit()

#Cerramos la conexion
conexion.close()