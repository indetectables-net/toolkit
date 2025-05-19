Español | [English](README.md)

# Universal Tool Updater

Esta herramienta está pensada para remediar el tedioso proceso de mantener actualizadas las herramientas que usamos para trabajar a diario.

Es el complemento inevitable del [toolkit](https://github.com/indetectables-net/toolkit) del sitio.

![](assets/demo.gif)

## Instalación

Puede clonar el repo con [git](https://git-scm.com/download/win) o simplemente bajarlo desde descargar.

```bash
git clone https://github.com/xchwarze/universal-tool-updater
```

## Configuración

Para agregar herramientas hay que editar el archivo `tools.ini`.

Por defecto el mismo viene configurado a modo de ejemplo para que el usuario entienda rápidamente como se usa la herramienta.

```ini
[DIE]
folder = Analysis\DIE
url = horsicq/DIE-engine
from = github
re_download = die_win64_portable_(?:\S+).zip

[Portmon]
folder = Monitor\Portmon
url = https://raw.githubusercontent.com/MicrosoftDocs/sysinternals/main/sysinternals/downloads/portmon.md
update_url = https://download.sysinternals.com/files/PortMon.zip
from = web
re_version = # Portmon v(\d+\.\d+)
```

Los valores utilizados para la configuración son:

| Nombre             | Obligatorio | Descripción                                                                                         |
|--------------------|-------------|-----------------------------------------------------------------------------------------------------|
| `folder`           | SÍ          | Carpeta donde se guardará la herramienta. Se crea si no existe.                                     |
| `url`              | SÍ          | Página web principal para comprobar versión y/o hacer scraping con regex.                           |
| `from`             | NO          | Estrategia a emplear: `web`, `github` o `http`. Por defecto `web`.                                  |
| `local_version`    | NO          | Versión actualmente instalada. Se actualiza tras cada ejecución exitosa.                            |
| `re_version`       | NO          | Regex para extraer la nueva versión del HTML en `url`.                                              |
| `re_download`      | NO          | Regex para extraer el enlace de descarga del HTML; puede capturar URL completa o ruta relativa.     |
| `update_url`       | NO          | URL base o enlace directo de descarga. Se usa cuando `re_download` da ruta relativa o no hay regex. |
| `update_file_pass` | NO          | Contraseña para descomprimir el archivo descargado.                                                 |
| `merge`            | NO          | Si está definido, fusiona los archivos nuevos con los existentes.                                   |
| `pre_update`       | NO          | Comando o script a ejecutar antes de iniciar la actualización.                                      |
| `post_update`      | NO          | Comando o script a ejecutar inmediatamente tras completar la descarga.                              |
| `post_unpack`      | NO          | Comando o script a ejecutar tras descomprimir el archivo descargado.                                |


## Estrategia de descarga

1. **Si `re_download` está definido**  
   a. Extraer enlace del HTML de `url`.  
   b. Si el enlace es una URL absoluta válida → usarla.  
   c. Si es ruta relativa →  
      - Si `update_url` existe, anteponerla.  
      - Si no, construirla desde el esquema y host de `url`.  
   d. Si no hay match inicial y hay `update_url` → obtener HTML de `update_url`, reintentar regex.  
   e. Si sigue sin match → error.

2. **Si solo está `update_url`**  
   Usar `update_url` como enlace de descarga.

3. **Modo HTTP (`from = http`)**  
   - Envía una petición **HEAD** a `update_url`.  
   - Genera un identificador de versión hasheando el encabezado `Last-Modified` o `Content-Length`.  
   - Si difiere de `local_version` (o `force_download`), usa `update_url` para descargar.  
   - Si coincide y `force_download` es falso, no hay actualización.

4. **En otro caso**  
   Error: no hay ni `re_download` ni `update_url` para determinar el enlace. 


## Parámetros de Línea de Comandos

El actualizador ofrece un conjunto flexible de parámetros para controlar su comportamiento:

| Parámetro                                                          | Descripción                                                                                             |
|--------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------|
| `-h, --help`                                                       | Muestra este mensaje de ayuda y finaliza.                                                               |
| `-v, --version`                                                    | Muestra el número de versión del programa y finaliza.                                                   |
| `-u [UPDATE ...], --update [UPDATE ...]`                           | Especifica una lista de herramientas a actualizar. Si no se proporciona, se actualizarán todas.         |
| `-dsu, --disable-self-update`                                      | Desactiva la auto-actualización automática del script.                                                  |
| `-dfc, --disable-folder-clean`                                     | Evita limpiar la carpeta de herramientas durante las actualizaciones.                                   |
| `-dr, --disable-repack`                                            | Impide empaquetar nuevamente las herramientas después del proceso de actualización.                     |
| `-dic, --disable-install-check`                                    | Omite la verificación de si las herramientas están instaladas correctamente.                            |
| `-dpb, --disable-progress-bar`                                     | Desactiva la barra de progreso durante las descargas.                                                   |
| `-sft {full,version,name}, --save-format-type {full,version,name}` | Especifica el tipo de formato para guardar las actualizaciones comprimidas: `full`, `version` o `name`. |
| `-f, --force`                                                      | Fuerza la descarga de actualizaciones, incluso si ya están actualizadas.                                |
| `-uga USE_GITHUB_API, --use-github-api USE_GITHUB_API`             | Usa la API de GitHub para actualizaciones, especificando el token para autenticarse.                    |
| `-udp, --update-default-params`                                    | Actualiza los parámetros predeterminados almacenados en la configuración.                               |
| `-dmc, --disable-mutex-check`                                      | Permite ejecutar múltiples instancias del script desactivando la verificación de mutex.                 |
| `-d, --debug`                                                      | Activa la salida detallada de depuración para resolver problemas.                                       |


## Ejemplos

La herramienta soporta varios comandos y combinaciones. Estos son los mas usados.

* Actualizar una herramienta en particular

```bash
updater.exe --update "Process Hacker 3"
```

* Forzar Actualicion de una herramienta

```bash
updater.exe --force --update DIE
```

* Actualizar sin comprimir ni limpiar la carpeta

```bash
updater.exe --disable-folder-clean --disable-repack
```

## Use with GitHub Api

Las descargas de GitHub se realizan por defecto haciendo scrapeo de datos, pero para un funcionamiento mas robusto se aconseja hacerlo usando la api de GitHub.
Para ello hay que seguir los siguientes pasos:

1. Generar nuestro token desde https://github.com/settings/tokens haciendo clic en Generate new token. 
2. Ejecutar el updater con los siguientes comandos

```bash
updater.exe --update-default-params --use-github-api your_github_token
```

## Usar con tareas programadas

* Agregar la herramienta como tarea programada. Puede leer más aquí
"[Create scheduled tasks with CLI](https://www.windowscentral.com/how-create-task-using-task-scheduler-command-prompt)", 
"[How to create an automated task](https://www.windowscentral.com/how-create-automated-task-using-task-scheduler-windows-10)" and 
"[Prevent command window appearing](https://pureinfotech.com/prevent-command-window-appearing-scheduled-tasks-windows-10/)"

```bash
# execute in elevated command prompt
SCHTASKS /CREATE /SC DAILY /TN "ToolkitUpdater" /TR "D:\code\toolkit\Updater\custom-task.bat" /ST 14:00
```

* Eliminar tarea programada

```bash
# execute in elevated command prompt
SCHTASKS /DELETE /TN "ToolkitUpdater"
```

## Compilar a exe

```bash
pip install pyinstaller
pyinstaller --onefile UpdateManager.py --icon=../assets/appicon.ico
```
