#!/bin/bash

for src in $(find .bash_functions.d/ -type f)
do  
        source $src
done