import os
import pandas as pd
from llm_calls import call_LLM, normalize_data

# Cargar excel original a un json
df = pd.read_csv('CSVs\Alumnes BdD 2024 - Hoja 1.csv')
json_data = df.to_json(orient="index", force_ascii=False)

# Llamar a los modelos
new_json_data_ = call_LLM(json_data)
normalize_json_data = normalize_data(new_json_data_)

# Cargar el nuevo json a un archivo data.json
file_path = os.path.join(os.getcwd(), "data.json")
with open(file_path, "w", encoding="utf-8") as file:
    file.write(normalize_json_data)

print(f"JSON exportado exitosamente en {file_path}")

# Eportar el JSON a un CSV
df = pd.read_json('data.json', orient='index')

# Reemplazar NaN con 0 (o un valor que consideres adecuado)
df[['DNI', 'Numero_Grupo']] = df[['DNI', 'Numero_Grupo']].fillna(0)

# Convertir las columnas a enteros
df[['DNI', 'Numero_Grupo']] = df[['DNI', 'Numero_Grupo']].astype(int)
df['Mascotas'] = df['Mascotas'].astype(bool)

# Exportar a CSV
df.to_csv('CSVs\datos_alumnes.csv', encoding='utf-8', index=False)