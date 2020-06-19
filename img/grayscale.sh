#!/usr/bin/bash
for img in *.jpg
do
	name=`basename $img`
	convert "$img" -colorspace gray "${name%.jpg}-gray.jpg"
done
