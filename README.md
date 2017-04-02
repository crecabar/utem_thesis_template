# README #
Cuando comencé a escribir mi trabajo de titulación para la Universidad Tecnológica Metropolitana (UTEM), pregunté inmediatamente si exista alguna plantilla en LaTeX para realizarla, la respuesta fue un gran no. Mis opciones entonces, eran trabajar en Ms Word o hacer la plantilla yo mismo. Ms Word me parece una entretenida herramienta para cosas pequeñas, pero un informe de tesis debe ser escrito en forma seria, y LaTeX es esa forma.

### Qué hay en este repositorio ###
Este repositorio contiene la plantilla que utilicé para mi trabajo de titulación y fue aprobada por la Escuela de Informática de la Facultad de Ingeniería, y ahora está a libre disposición en este repositorio.
La plantilla con todos sus ficheros tex y bib necesarios para construir un documento de tesis UTEM, adicionalmente contiene una serie de scripts para compaginar el proyecto.

### Cómo empezar ###
Primero que todo, debes editar el fichero typeset.sh para que refleje la configuración de tu instalación de LaTeX:
```bash
# Executable values
PATH=/Library/TeX/texbin:/usr/local/bin:$PATH
TEXBIN=/Library/TeX/texbin
ENGINE=${TEXBIN}/pdflatex
BIB=${TEXBIN}/${bibtexCommand}
GLS=${TEXBIN}/makeglossaries
IDX=${TEXBIN}/makeindex
IDY=${TEXBIN}/texindy
```
Esta configuración funciona bien para la instalación de MacTeX, pero podría no funcionar en Linux. Una vez que tienes todos los paquetes de LaTeX necesarios instalados en tu sistema debes ejecutar el siguiente comando (el $ es el promtp del sistema, no lo debes escribir):
```bash
$ ./compile.sh
```
Si la salida fuera incorrecta, latex termina con un error señalando que falta algún paquete por instalar, para solucionarlo, debes referirte a la documentación de tu instalación de latex para averiguar cómo instalarlo.

### Who do I talk to? ###
Si quieres ponerte en contacto conmigo, pues aquí en github.
