# README #

Esta plantilla esta diseñada en LaTeX para las especificaciones de trabajo de titulación de la Universidad Tecnológica Metropolitana, UTEM.

### What is this repository for? ###
Este repositorio contiene la plantilla con todos sus ficheros tex y bib necesarios para construir un documento de tesis UTEM, adicionalmente contiene una serie de scripts para compaginar el proyecto.

### How do I get set up? ###
Primero que todo, debes editar el fichero typeset.sh para que refleje la configuración de tú instalación de LaTeX
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
Esta configuración funciona bien para la instalación de MacTeX, pero podría no funcionar en Linux.

### Contribution guidelines ###


### Who do I talk to? ###

