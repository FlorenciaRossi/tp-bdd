import pandas as pd
import os
from dotenv import load_dotenv
from groq import Groq

load_dotenv()
api_key=os.getenv("GROQ_KEY")

client = Groq(api_key=api_key)
print("key,", api_key)

def call_LLM(json_data):
    response = client.chat.completions.create(
        messages=[{"role": "system", 
                "content": f"""Sos un asistente capaz de interpretar datos almacenados en estrucuras JSON.

                Vas a recibir un JSON que contiene información de estudiantes de programación. El JSON tiene los siguientes campos:
                - "Unnamed: 0": Es el DNI del estudiante.
                - "Nombre y Apellido": Es el nombre y el apellido del estudiante.
                - "Email": Es el email del estudiante.
                - "Grupo": Es número del grupo al que el estudiante pertenece.
                - "Rol": El rol que cumple el estudiante dentro del grupo.
                - "Descripción": Es una descripción que hizo el estudiante sobre si mismo. En esta descripción vas a encontrar la siguiente información: 
                                    - Materias que el alumno está cursando actualmente. Estas pueden ser: [Algoritmos 3, Bases de Datos (BDD), Seminario], si menciona que hace tres materias está haciendo referencia a esas tres.
                                    - Si el estudiante trabaja o no. Puede haber información de su trabajo.
                                    - Experiencia en bases de datos (relacional, no relacional)
                                    - Ubicacion: localidad
                                    - Hobbies
                                    - Mascotas
                                    - Musica o series que recomienda
                    Tu tarea es extraer información de los campos del JSON recibido para crear un nuevo JSON que contenga estos campos:
                    1. DNI (int)
                    2. Nombre (string)
                    3. Email (string)
                    4. Numero_Grupo (int)
                    5. Nombre_Grupo (string)
                    6. Rol (string)
                    7. Materias (string): Agrega en todos la materia 'Bases de Datos'. Ten en cuenta que es la primer información que aparece en la columna descripción, las materias pueden estar abreviadas pero siempre se hace referencia a estas tres materias [Algoritmos 3, Bases de Datos, Seminario]. Si se nombra una materia más adelante en el texto no la agregues.
                    8. Trabajo: (string): Agrega la actividad que realiza en el trabajo. Si no trabaja, vacío.
                    9. Experiencia_BDD_Relacional (boolean)
                    10. Experiencia_BDD_No_Relacional (boolean)
                    10. Ubicacion
                    11. Hobbies
                    12. Mascotas (boolean)
                    13. Recomendación_Multimedia

                    Por ejemplo:
                    {{ "0": {{
                            "DNI":37688075
                            "Nombre":"Jotallan Calvetti"
                            "Email":"gaabicarp@gmail.com"
                            "Numero_Grupo":1
                            "Nombre_Grupo":"DataMasters"
                            "Rol":"Organizador"
                            "Materias": "Bases de datos"
                            "Trabajo": "Front-end"
                            "Experiencia_BDD": true
                            "Ubicacion": "San Martin"
                            "Hobbies": "Musica, Viajar, Videojuegos"
                            "Mascotas": null
                            "Recomendación_Multimedia": "Rock Nacional"
                        }}
                    }}
                    JSON: {json_data}
                    Responde únicamente el JSON
                """}],
        model="llama-3.1-70b-versatile",
        temperature=0
    )
    return response.choices[0].message.content

def normalize_data(json_data):
    response = client.chat.completions.create(
            messages=[{"role": "system", 
                    "content": f"""Sos un asistente capaz de interpretar datos almacenados en estrucuras JSON y normalizarlos.

                    Vas a recibir un JSON que contiene información de estudiantes de programación. 
                    Tu tarea es normalizar el campo de HOBBIE únicamente. 
                    Por ejemoplo si están los hobbies: escuchar música, rock nacional, cachengue. Vas a poner en todos esos campos: Música.
                    Ten en cuenta que hay estudiantes que tienen varios hobbies.
                    JSON: {json_data}
                    Responde únicamente el JSON, no agregues texto ni antes ni despues.
                    """}],
            model="llama-3.1-70b-versatile",
            temperature=0
        )

    return response.choices[0].message.content
