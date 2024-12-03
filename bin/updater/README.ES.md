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

| Nombre               | Obligatorio | Descripción                                                                                            |
|----------------------|-------------|--------------------------------------------------------------------------------------------------------|
| `folder`             | `SI`        | Carpeta donde se guardara la herramienta. Si no existe la misma se creara.                             |
| `url`                | `SI`        | Web que se usara para realizar los chequeos con las regex.                                             |
| `from`               | `NO`        | Indica la estrategia usada para el update. Los valores admitidos por el momento son: `web`, `github` o `http`. |
| `local_version`      | `NO`        | Versión descargada actualmente. Este valor se actualizara con cada update.                             |
| `re_version`         | `NO`        | Regex usado para comprobar si hay nuevas versiones en la web de `url`.                                 |
| `re_download`        | `NO`        | Regex usado para obtener el link de descarga en la web de `url`.                                       |
| `update_url`         | `NO`        | URL de descarga del update. Ver estrategia usadas para la descarga.                                    |
| `update_file_pass`   | `NO`        | Usar esta contraseña para descomprimir el update.                                                      |
| `merge`              | `NO`        | Fusionar versión nueva con la local.                                                                   |
| `pre_update_script`  | `NO`        | El script ingresado se ejecutara antes del proceso de update.                                          |
| `post_update_script` | `NO`        | El script ingresado se ejecutara después del proceso de update.                                        |
| `pre_update`         | `NO`        | El script ingresado se ejecutara antes del proceso de update.                                          |
| `post_update`        | `NO`        | El script ingresado se ejecutara después del proceso de update.                                        |
| `post_unpack`        | `NO`        | El script ingresado se ejecutara después del proceso de unpack.                                        |

## Estrategia usadas para la descarga

Combinando el uso de `update_url` y `re_download` se consiguen las siguientes estrategias de descarga:

1. Usando solo `update_url` se descarga directamente sin ningún procesamiento extra.
2. Usando solo `re_download` se obtiene el link de descarga en la web de `url`.
3. Cuando se usan ambos parámetros se concatena el resultado de `re_download` con `update_url`.
Esto es útil para arreglar los links de descarga de GitHub o Sourceforge.
4. También se dispone de un método de detección de nuevas versiones que en lugar de regex usa las cabeceras http con las que responde el servidor.

## Parámetros de Línea de Comandos

El actualizador ofrece un conjunto flexible de parámetros para controlar su comportamiento:

| Parámetro                                                          | Descripción                                                                                       |
|--------------------------------------------------------------------|---------------------------------------------------------------------------------------------------|
| `-h, --help`                                                       | Muestra este mensaje de ayuda y finaliza.                                                        |
| `-v, --version`                                                    | Muestra el número de versión del programa y finaliza.                                            |
| `-u [UPDATE ...], --update [UPDATE ...]`                           | Especifica una lista de herramientas a actualizar. Si no se proporciona, se actualizarán todas. |
| `-dsu, --disable-self-update`                                      | Desactiva la auto-actualización automática del script.                                            |
| `-dfc, --disable-folder-clean`                                     | Evita limpiar la carpeta de herramientas durante las actualizaciones.                            |
| `-dr, --disable-repack`                                            | Impide empaquetar nuevamente las herramientas después del proceso de actualización.              |
| `-dic, --disable-install-check`                                    | Omite la verificación de si las herramientas están instaladas correctamente.                   |
| `-dpb, --disable-progress-bar`                                     | Desactiva la barra de progreso durante las descargas.                                             |
| `-sft {full,version,name}, --save-format-type {full,version,name}` | Especifica el tipo de formato para guardar las actualizaciones comprimidas: `full`, `version` o `name`. |
| `-f, --force`                                                      | Fuerza la descarga de actualizaciones, incluso si ya están actualizadas.                         |
| `-uga USE_GITHUB_API, --use-github-api USE_GITHUB_API`             | Usa la API de GitHub para actualizaciones, especificando el token para autenticarse.      |
| `-udp, --update-default-params`                                    | Actualiza los parámetros predeterminados almacenados en la configuración.                      |
| `-dmc, --disable-mutex-check`                                      | Permite ejecutar múltiples instancias del script desactivando la verificación de mutex.          |
| `-d, --debug`                                                      | Activa la salida detallada de depuración para resolver problemas.                                |

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
