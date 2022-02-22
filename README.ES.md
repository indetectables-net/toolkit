# Indetectables Toolkit

Esta compilación de herramientas está pensada para que sea útil al que se inicia y a los más avanzados, al que quiere entrar en el análisis de malware y también para los que quieren probar suerte en el mundo del cracking.

Es el complemento ideal para ser usado con para empezar con los [manuales](https://github.com/indetectables-net/manuals) del sitio y para jugar con el mirror de las [teorias numeradas]( https://github.com/indetectables-net/teorias-numeradas).

![](assets/demo.gif)


## Ventajas

El pack está pensado para ser el más completo y robusto existente.
Algunas de sus ventajas son:

1. Contiene todas las herramientas básicas y no tan básicas que se puedan llegar a necesitar.

2. El pack está integrado con el actualizador universal que hicimos, gracias a ello logramos mantener de manera automática todas las herramientas.

3. Es fácilmente ampliable y modificable. Solo tienes que actualizar el `bin\updater\tools.ini` para integrar las herramientas que usas al [actualizador](https://github.com/xchwarze/universal-tool-updater) y agregar los links de las mismas a `bin\sendto\sendto` para que aparezcan en los menús.

4. El instalador configura todo lo que podemos necesitar de manera automática. Desde las dependencias, variables de entorno y hasta nos puede agregar una tarea programada para que actualice automáticamente las herramientas semanalmente.


## Instalación

1. Puede clonar el repositorio con [git](https://git-scm.com/download/win), bajarlo desde [descargar](https://github.com/indetectables-net/toolkit/archive/refs/heads/master.zip) o simplemente bajar las versiones estables desde la seccion de [release](https://github.com/indetectables-net/toolkit/releases) donde también podemos encontrar el instalador.

2. Una vez descargado puedes actualizar las herramientas con el actualizador que [desarrollamos para esto](https://github.com/xchwarze/universal-tool-updater). <br/>
El mismo está en la carpeta `bin\updater\updater.exe`.


## Herramientas

El toolkit está compuesto por 75 herramientas que cubren todo lo que podemos necesitar para la reversa y el análisis. <br/>
Las herramientas están todas descargadas de sus páginas oficiales pero de todas formas se recomienda usarlas con cautela, en especial las que las paginas oficiales son hilos en foros y ese tipo de cosas. <br/>
Para ver la lista completa de herramientas puedes [hacerlo aqui](TOOLS.md).


## Contribuciones

Los pull requests son bienvenidos. Para cambios importantes cree primero un issue para analizarlo entre todos.

Las herramientas están comprimidas con 7zip y el formato usado para los nombres es `{nombre} - {version}.7z`
