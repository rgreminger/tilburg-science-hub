#!/bin/bash
rm -r gen
mkdir gen
#mkdir gen/reveal-old
#cp -R reveal-old gen/reveal-old

# Declare an array of string with type
declare -a FileNames=("coursesetup" "theory" "practice" )
declare -a OutputNames=("01_coursesetup" "02_workflows" "03_exercises" )

# Iterate the string array using for loop
for i in "${!FileNames[@]}"; do
   echo ${FileNames[i]}

   pandoc -t revealjs -s -o ${OutputNames[i]}.html ${FileNames[i]}.md -V revealjs-url=./reveal-old -V theme=white-tsh
   sed '/::: notes/,/:::/d' ${FileNames[i]}.md > ${FileNames[i]}-nonotes.md
   sed '/\. \. \./d' ${FileNames[i]}-nonotes.md > ${FileNames[i]}-nonotes2.md
   pandoc ${FileNames[i]}-nonotes2.md --pdf-engine=xelatex -o "gen/${OutputNames[i]}.pdf"
   rm ${FileNames[i]}-nonotes.md
   rm ${FileNames[i]}-nonotes2.md
   #mv ${OutputNames[i]}.html gen/${OutputNames[i])}.html

done

#pandoc -t revealjs -s -o 01_course.html coursesetup.md -V revealjs-url=./reveal-old -V theme=white-tsh
#pandoc -t revealjs -s -o 02_theory.html theory.md -V revealjs-url=./reveal-old -V theme=white-tsh
#pandoc -t revealjs -s -o 03_practice.html practice.md -V revealjs-url=./reveal-old -V theme=white-tsh
#sed '/::: notes/,/:::/d' theory.md
