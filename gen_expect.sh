#!/bin/bash
BASE_EXEC=cat
FILES=test_data/*

echo "--------------Generating expected output----------------"
for f in $FILES
do
	filename=$(basename "$f")
	echo "Processing $f file..."
	$BASE_EXEC $f > "expected_output/$filename"
done
