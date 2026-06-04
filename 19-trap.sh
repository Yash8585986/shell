#!/bin/bash

set -e
trap 'echo "There is error in $LINENO , Command : $BASH_COMMAND"' ERR

echo "Hello World"
echo "This a trap example"
echoe "This is a typo of echo"

