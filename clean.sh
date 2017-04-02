#!/bin/bash

if [ $# -lt 1 ]
then
  echo "usage: <file-to-clean>"
  exit
fi

# Process inputs.
# TeXnicle passes the file to be processed as the first input to this 
# script and the working directory as the second input. Other options follow.
mainfile=$1

# Check if pdf file exists
if [ -f ${mainfile}.pdf ]; then
  rm -rf ${mainfile}.acn \
    ${mainfile}.acr \
    ${mainfile}.acn \
    ${mainfile}.alg \
    ${mainfile}.bbl \
    ${mainfile}.blg \
    ${mainfile}.glg \
    ${mainfile}.glo \
    ${mainfile}.gls \
    ${mainfile}.idx \
    ${mainfile}.ilg \
    ${mainfile}.ind \
    ${mainfile}.lof \
    ${mainfile}.log \
    ${mainfile}.lot \
    ${mainfile}.out \
    ${mainfile}.pdf \
    ${mainfile}.toc \
    ${mainfile}.xdy
fi

