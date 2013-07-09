#!/bin/bash
BASE_EXEC=cat
FILES=test_data/*

# rm the whole output folder, so we have diff error if we fail to gen output
rm -rf output
mkdir output

echo "--------------Generating output----------------"
for f in $FILES
do
	filename=$(basename "$f")
	echo "Processing $f file..."
	$BASE_EXEC $f > "output/$filename"
done

echo "--------------Diff result----------------------"
for f in $FILES
do
	filename=$(basename "$f")
	echo "Diff result of $filename file..."
	diff "expected_output/$filename" "output/$filename"
done
