#!/bin/bash

cd mac
for i in *; do
	install_name_tool -id "$i" "$i"
	for j in *; do
		test "$i" == "$j" && continue
		install_name_tool -change "/usr/local/lib/$j" "@loader_path/$j" "$i"
	done
done

