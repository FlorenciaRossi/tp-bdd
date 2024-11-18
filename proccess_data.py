import os
import pandas as pd
from llm_calls import call_LLM, normalize_data

# CARGAR EL EXCEL ORIGINAL A UN JSON
df = pd.read_csv('CSVs\Alumnes BdD 2024 - Hoja 1.csv')
json_data = df.to_json(orient="index", force_ascii=False)

# LLAMAR A LOS MODELOS
new_json_data_ = call_LLM(json_data)
normalize_json_data = normalize_data(new_json_data_)

# CARGAR EL NUVO JSON A UN ARCHIVO
file_path = os.path.join(os.getcwd(), "data.json")
with open(file_path, "w", encoding="utf-8") as file:
    file.write(normalize_json_data)

# EXPORTAR EL DATA.JSON A CSV
df = pd.read_json('data.json', orient='index')

# Se modifican las columnas por problemas de compatibilidad
df[['DNI', 'Numero_Grupo']] = df[['DNI', 'Numero_Grupo']].fillna(0)
df[['DNI', 'Numero_Grupo']] = df[['DNI', 'Numero_Grupo']].astype(int)
df['Mascotas'] = df['Mascotas'].astype(bool)

df.to_csv('CSVs\pre_datos_alumnos.csv', encoding='utf-8', index=False)
# datos_alumnes.csv es el archivo procesado por el llm