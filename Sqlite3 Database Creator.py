import sqlite3

#Conectar a la base de datos
base_de_dato = sqlite3.connect("database.sqllite3")

#seleccionar el cursor para realizar la consulta a la base de datos
consulta = conexion.cursor()

sql = """
    CREATE TABLE IF NOT EXISTS database(
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    cadena_texto VARCHAR(50) NOT NULL,
    entero INTEGER NOT NULL,
    decimal FLOAT NOT NULL,
    fecha DATE NOT NULL)"""

#Ejecutar la consulta
if consulta.execute(sql):
    print "Tabla creada exitosamente!"
else:
    print "Ha ocurrido un error al crear la tabla"

#Terminamos la consulta
consulta.close()