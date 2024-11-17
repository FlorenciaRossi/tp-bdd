import pandas as pd

# Cargar los datos de los CSV
df_alumnos = pd.read_csv('CSVs/tabla_datos_alumnos.csv')  
df_hobbies = pd.read_csv('CSVs/hobbies.csv') 

# Diccionario que mapea cada hobbie a su id_hobbie
hobbies_dict = pd.Series(df_hobbies.id_hobbie.values, index=df_hobbies.nombre).to_dict()

# Lista que va a tener las relaciones alumno-hobbie
alumno_hobbie_relations = []
df_alumnos['hobbies'].fillna(" ", inplace=True) #sino se rompe

# Recorremos cada fila de datos_alumnos
for _, row in df_alumnos.iterrows():
    
    # Obtener los hobbies del alumno (separados por coma)
    hobbies = row['hobbies'].split(', ')
    id_alumno = row['id_alumno']
    
    # Para cada hobbie, agregamos la relación alumno-hobbie
    for hobbie in hobbies:
        if hobbie in hobbies_dict: 
            alumno_hobbie_relations.append({
                'alumno_id': id_alumno,
                'hobbie_id': hobbies_dict[hobbie]
            })

# Convertir la lista de relaciones en un DataFrame
df_alumno_hobbie = pd.DataFrame(alumno_hobbie_relations)

# Guardar el DataFrame de relaciones en un archivo CSV
df_alumno_hobbie.to_csv('CSVs/alumno_hobbie.csv', index=False)

print("La tabla intermedia 'alumno_hobbie.csv' ha sido creada exitosamente.")
