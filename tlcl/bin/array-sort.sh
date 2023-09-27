#!/bin/bash
# array-sort: Sort an array
a=(f e d c b a)
echo "Original array: ${a[@]}"
a_sorted=("$(for i in "${a[@]}"; do echo $i; done | sort)")
echo -e "Sorted array:\n${a_sorted[@]}"