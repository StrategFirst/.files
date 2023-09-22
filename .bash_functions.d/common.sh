#!/bin/bash

# Handy repeat char
function repeatc() {
        for i in $(seq 1 $2); do
                echo -n "$1"
        done
}