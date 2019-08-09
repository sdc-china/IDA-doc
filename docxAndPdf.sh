#!/bin/bash

rm -rf ./docx/**
mkdir docx
cd _posts/
pandoc *.md -o ../docx/readme.docx
pandoc *.md -o ../docx/readme.pdf --pdf-engine=wkhtmltopdf
echo "End! Find the doc in folder docx"