#!/bin/bash
file_count () {
local COUNT=$(ls $1 | wc -l)
echo $COUNT
}
file_count $1
