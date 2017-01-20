#!/bin/bash
#

if [ $# -lt 2 ]
then
  echo "usage: <file-to-compile> <nPases> <run bibtex> <bibtex command> <run makeglossaries> <run makeindex> <clean aux> <clean before>"
  exit
fi

# Process inputs.
# TeXnicle passes the file to be processed as the first input to this 
# script and the working directory as the second input. Other options follow.
mainfile=$1
nCompile=$2
doBibtex=$3
bibtexCommand=$4
doGlossaries=$5
doIndex=$6
cleanAux=$7
cleanBefore=$8
outputDir=.
runNumber=1

# Executable values
PATH=/Library/TeX/texbin:/usr/local/bin:$PATH
TEXBIN=/Library/TeX/texbin
ENGINE=${TEXBIN}/pdflatex
BIB=${TEXBIN}/${bibtexCommand}
GLS=${TEXBIN}/makeglossaries
IDX=${TEXBIN}/makeindex
IDY=${TEXBIN}/texindy

# Check if pdf file exists
if [ $cleanBefore -eq 1 ]; then
  . clean.sh ${mainfile}
fi

echo "****************************"
echo "*** Typsetting: $mainfile"
echo "***  N typeset: $nCompile"
echo "****************************"

# Go to the working directory

while [ $runNumber -le $nCompile ]; do
  echo " "
  echo "***------------------------------------------------------------"
  echo "*** Run $runNumber of $nCompile..."
  echo "***------------------------------------------------------------"
  $ENGINE -synctex=1 -file-line-error -interaction=nonstopmode --output-directory="$outputDir" "$mainfile"
  
  # if this is after the first run, run bibtex, makeglossaries and makeindex
  if [ $runNumber -eq 1 ]; then
    if [ $doBibtex -eq 1 ]; then
      echo "***------------------------------------------------------------"
      echo "*** Running ${BIB} on $mainfile ..."
      echo "***------------------------------------------------------------"
      $BIB "$mainfile"
    fi
    if [ $doGlossaries -eq 1 ]; then
      echo "***------------------------------------------------------------"
      echo "*** Running $GLS on $mainfile ..."
      echo "***------------------------------------------------------------"
      $GLS "$mainfile"
      $ENGINE -synctex=1 -file-line-error -interaction=nonstopmode --output-directory="$outputDir" "$mainfile"
      $GLS "$mainfile"
      $ENGINE -synctex=1 -file-line-error -interaction=nonstopmode --output-directory="$outputDir" "$mainfile"
    fi
    if [ $doIndex -eq 1 ]; then
      echo "***------------------------------------------------------------"
      echo "*** Running $IDX on $mainfile ..."
      echo "***------------------------------------------------------------"
      $IDX "$mainfile"
      $IDY "$mainfile.idx"
    fi
  fi
  let runNumber=runNumber+1
done

if [ $cleanAux -eq 1 ]; then
  rm -rf *.aux
fi

echo "*** pdflatex.engine has completed."

