#!/bin/sh
rm -f react-beautiful-dnd.zip
zip -r react-beautiful-dnd.zip src haxelib.json README.md changes.md doc extraParams.hxml
# haxelib submit react-beautiful-dnd.zip $1 $2 --always
haxelib submit react-beautiful-dnd.zip
