#!/bin/bash
# ul-declare-demonstrate: demonstrate case conversion via declare
if [[ $1 ]]; then
    echo ${1,,}
    echo ${1,}
    echo ${1^^}
    echo ${1^}
fi