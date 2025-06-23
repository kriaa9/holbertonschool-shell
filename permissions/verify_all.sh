#!/bin/bash

echo "=== VERIFYING ALL TASKS ==="
echo

# Check all files exist and have 2 lines
echo "1. Checking file structure:"
for i in {0..15}; do
    if [ $i -eq 0 ]; then
        file="0-iam_betty"
    elif [ $i -eq 1 ]; then
        file="1-who_am_i"
    elif [ $i -eq 2 ]; then
        file="2-groups"
    elif [ $i -eq 3 ]; then
        file="3-new_owner"
    elif [ $i -eq 4 ]; then
        file="4-empty"
    elif [ $i -eq 5 ]; then
        file="5-execute"
    elif [ $i -eq 6 ]; then
        file="6-multiple_permissions"
    elif [ $i -eq 7 ]; then
        file="7-everybody"
    elif [ $i -eq 8 ]; then
        file="8-James_Bond"
    elif [ $i -eq 9 ]; then
        file="9-John_Doe"
    elif [ $i -eq 10 ]; then
        file="10-mirror_permissions"
    elif [ $i -eq 11 ]; then
        file="11-directories_permissions"
    elif [ $i -eq 12 ]; then
        file="12-directory_permissions"
    elif [ $i -eq 13 ]; then
        file="13-change_group"
    elif [ $i -eq 14 ]; then
        file="14-change_owner_and_group"
    elif [ $i -eq 15 ]; then
        file="15-symbolic_link_permissions"
    fi
    
    if [ -f "$file" ]; then
        lines=$(wc -l < "$file")
        if [ "$lines" -eq 2 ]; then
            echo "✓ $file: $lines lines (correct)"
        else
            echo "✗ $file: $lines lines (should be 2)"
        fi
    else
        echo "✗ $file: missing"
    fi
done

echo
echo "2. Testing Task 0 (character count):"
if [ -f "0-iam_betty" ]; then
    chars=$(tail -1 0-iam_betty | wc -c)
    if [ "$chars" -eq 9 ]; then
        echo "✓ 0-iam_betty: $chars characters (correct)"
    else
        echo "✗ 0-iam_betty: $chars characters (should be 9)"
    fi
fi

echo
echo "3. Testing executable scripts:"
echo "Task 1 - whoami:"
./1-who_am_i

echo "Task 2 - groups:"
./2-groups

echo "Task 4 - creating empty file:"
rm -f hello
./4-empty
if [ -f hello ]; then
    echo "✓ hello file created"
    ls -l hello
else
    echo "✗ hello file not created"
fi

echo
echo "=== Manual tests needed (require sudo or specific setup) ==="
echo "Task 0: su betty (needs betty user)"
echo "Task 3: chown betty hello (needs sudo)"
echo "Task 13: chgrp school hello (needs sudo + school group)"
echo "Task 14: chown vincent:staff * (needs sudo)"
echo "Task 15: chown -h vincent:staff _hello (needs sudo)"

