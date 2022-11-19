#!/bin/sh

# Delete all printers.

for printer in `lpstat -p | awk '{print $2}'`
do
lpadmin -x "$printer"
done