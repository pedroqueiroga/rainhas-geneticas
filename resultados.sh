#!/bin/bash

#generate results and append to resultados.csv

# POPULATION SIZE = 10, K = 30
# False False False False
OUTPUT="$(./finetune.py -p 10 -k 30 | tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv
# False False False True
OUTPUT="$(./finetune.py -c| tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv
# False False True False
OUTPUT="$(./finetune.py -r -p 10 -k 30 | tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv
# False False True True
OUTPUT="$(./finetune.py -r -c -p 10 -k 30 | tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv
# False True False False
OUTPUT="$(./finetune.py -sm -p 10 -k 30 | tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv
# False True False True
OUTPUT="$(./finetune.py -sm -c -p 10 -k 30 | tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv
# False True True False
OUTPUT="$(./finetune.py -sm -r -p 10 -k 30 | tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv
# False True True True
OUTPUT="$(./finetune.py -sm -r -c -p 10 -k 30 | tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv
# True False False False
OUTPUT="$(./finetune.py -sr -p 10 -k 30 | tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv
# True False False True
OUTPUT="$(./finetune.py -sr -c -p 10 -k 30 | tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv
# True False True False
OUTPUT="$(./finetune.py -sr -r -p 10 -k 30 | tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv
# True False True True
OUTPUT="$(./finetune.py -sr -r -c -p 10 -k 30 | tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv
# True True False False
OUTPUT="$(./finetune.py -sr -sm -p 10 -k 30 | tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv
# True True False True
OUTPUT="$(./finetune.py -sr -sm -c -p 10 -k 30 | tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv
# True True True False
OUTPUT="$(./finetune.py -sr -sm -r -p 10 -k 30 | tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv
# True True True True
OUTPUT="$(./finetune.py -sr -sm -r -c -p 10 -k 30 | tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv


# POPULATION SIZE = 50, K = 30
# False False False False
OUTPUT="$(./finetune.py -p 50 -k 30 | tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv
# False False False True
OUTPUT="$(./finetune.py -c| tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv
# False False True False
OUTPUT="$(./finetune.py -r -p 50 -k 30 | tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv
# False False True True
OUTPUT="$(./finetune.py -r -c -p 50 -k 30 | tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv
# False True False False
OUTPUT="$(./finetune.py -sm -p 50 -k 30 | tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv
# False True False True
OUTPUT="$(./finetune.py -sm -c -p 50 -k 30 | tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv
# False True True False
OUTPUT="$(./finetune.py -sm -r -p 50 -k 30 | tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv
# False True True True
OUTPUT="$(./finetune.py -sm -r -c -p 50 -k 30 | tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv
# True False False False
OUTPUT="$(./finetune.py -sr -p 50 -k 30 | tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv
# True False False True
OUTPUT="$(./finetune.py -sr -c -p 50 -k 30 | tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv
# True False True False
OUTPUT="$(./finetune.py -sr -r -p 50 -k 30 | tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv
# True False True True
OUTPUT="$(./finetune.py -sr -r -c -p 50 -k 30 | tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv
# True True False False
OUTPUT="$(./finetune.py -sr -sm -p 50 -k 30 | tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv
# True True False True
OUTPUT="$(./finetune.py -sr -sm -c -p 50 -k 30 | tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv
# True True True False
OUTPUT="$(./finetune.py -sr -sm -r -p 50 -k 30 | tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv
# True True True True
OUTPUT="$(./finetune.py -sr -sm -r -c -p 50 -k 30 | tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv

# POPULATION SIZE = 100, K = 30
# False False False False
OUTPUT="$(./finetune.py -p 100 -k 30 | tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv
# False False False True
OUTPUT="$(./finetune.py -c| tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv
# False False True False
OUTPUT="$(./finetune.py -r -p 100 -k 30 | tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv
# False False True True
OUTPUT="$(./finetune.py -r -c -p 100 -k 30 | tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv
# False True False False
OUTPUT="$(./finetune.py -sm -p 100 -k 30 | tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv
# False True False True
OUTPUT="$(./finetune.py -sm -c -p 100 -k 30 | tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv
# False True True False
OUTPUT="$(./finetune.py -sm -r -p 100 -k 30 | tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv
# False True True True
OUTPUT="$(./finetune.py -sm -r -c -p 100 -k 30 | tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv
# True False False False
OUTPUT="$(./finetune.py -sr -p 100 -k 30 | tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv
# True False False True
OUTPUT="$(./finetune.py -sr -c -p 100 -k 30 | tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv
# True False True False
OUTPUT="$(./finetune.py -sr -r -p 100 -k 30 | tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv
# True False True True
OUTPUT="$(./finetune.py -sr -r -c -p 100 -k 30 | tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv
# True True False False
OUTPUT="$(./finetune.py -sr -sm -p 100 -k 30 | tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv
# True True False True
OUTPUT="$(./finetune.py -sr -sm -c -p 100 -k 30 | tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv
# True True True False
OUTPUT="$(./finetune.py -sr -sm -r -p 100 -k 30 | tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv
# True True True True
OUTPUT="$(./finetune.py -sr -sm -r -c -p 100 -k 30 | tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv





# POPULATION SIZE = 10, K = 100
# False False False False
OUTPUT="$(./finetune.py -p 10 -k 100 | tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv
# False False False True
OUTPUT="$(./finetune.py -c| tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv
# False False True False
OUTPUT="$(./finetune.py -r -p 10 -k 100 | tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv
# False False True True
OUTPUT="$(./finetune.py -r -c -p 10 -k 100 | tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv
# False True False False
OUTPUT="$(./finetune.py -sm -p 10 -k 100 | tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv
# False True False True
OUTPUT="$(./finetune.py -sm -c -p 10 -k 100 | tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv
# False True True False
OUTPUT="$(./finetune.py -sm -r -p 10 -k 100 | tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv
# False True True True
OUTPUT="$(./finetune.py -sm -r -c -p 10 -k 100 | tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv
# True False False False
OUTPUT="$(./finetune.py -sr -p 10 -k 100 | tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv
# True False False True
OUTPUT="$(./finetune.py -sr -c -p 10 -k 100 | tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv
# True False True False
OUTPUT="$(./finetune.py -sr -r -p 10 -k 100 | tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv
# True False True True
OUTPUT="$(./finetune.py -sr -r -c -p 10 -k 100 | tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv
# True True False False
OUTPUT="$(./finetune.py -sr -sm -p 10 -k 100 | tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv
# True True False True
OUTPUT="$(./finetune.py -sr -sm -c -p 10 -k 100 | tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv
# True True True False
OUTPUT="$(./finetune.py -sr -sm -r -p 10 -k 100 | tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv
# True True True True
OUTPUT="$(./finetune.py -sr -sm -r -c -p 10 -k 100 | tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv


# POPULATION SIZE = 50, K = 100
# False False False False
OUTPUT="$(./finetune.py -p 50 -k 100 | tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv
# False False False True
OUTPUT="$(./finetune.py -c| tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv
# False False True False
OUTPUT="$(./finetune.py -r -p 50 -k 100 | tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv
# False False True True
OUTPUT="$(./finetune.py -r -c -p 50 -k 100 | tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv
# False True False False
OUTPUT="$(./finetune.py -sm -p 50 -k 100 | tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv
# False True False True
OUTPUT="$(./finetune.py -sm -c -p 50 -k 100 | tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv
# False True True False
OUTPUT="$(./finetune.py -sm -r -p 50 -k 100 | tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv
# False True True True
OUTPUT="$(./finetune.py -sm -r -c -p 50 -k 100 | tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv
# True False False False
OUTPUT="$(./finetune.py -sr -p 50 -k 100 | tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv
# True False False True
OUTPUT="$(./finetune.py -sr -c -p 50 -k 100 | tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv
# True False True False
OUTPUT="$(./finetune.py -sr -r -p 50 -k 100 | tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv
# True False True True
OUTPUT="$(./finetune.py -sr -r -c -p 50 -k 100 | tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv
# True True False False
OUTPUT="$(./finetune.py -sr -sm -p 50 -k 100 | tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv
# True True False True
OUTPUT="$(./finetune.py -sr -sm -c -p 50 -k 100 | tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv
# True True True False
OUTPUT="$(./finetune.py -sr -sm -r -p 50 -k 100 | tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv
# True True True True
OUTPUT="$(./finetune.py -sr -sm -r -c -p 50 -k 100 | tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv

# POPULATION SIZE = 100, K = 100
# False False False False
OUTPUT="$(./finetune.py -p 100 -k 100 | tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv
# False False False True
OUTPUT="$(./finetune.py -c| tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv
# False False True False
OUTPUT="$(./finetune.py -r -p 100 -k 100 | tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv
# False False True True
OUTPUT="$(./finetune.py -r -c -p 100 -k 100 | tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv
# False True False False
OUTPUT="$(./finetune.py -sm -p 100 -k 100 | tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv
# False True False True
OUTPUT="$(./finetune.py -sm -c -p 100 -k 100 | tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv
# False True True False
OUTPUT="$(./finetune.py -sm -r -p 100 -k 100 | tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv
# False True True True
OUTPUT="$(./finetune.py -sm -r -c -p 100 -k 100 | tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv
# True False False False
OUTPUT="$(./finetune.py -sr -p 100 -k 100 | tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv
# True False False True
OUTPUT="$(./finetune.py -sr -c -p 100 -k 100 | tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv
# True False True False
OUTPUT="$(./finetune.py -sr -r -p 100 -k 100 | tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv
# True False True True
OUTPUT="$(./finetune.py -sr -r -c -p 100 -k 100 | tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv
# True True False False
OUTPUT="$(./finetune.py -sr -sm -p 100 -k 100 | tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv
# True True False True
OUTPUT="$(./finetune.py -sr -sm -c -p 100 -k 100 | tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv
# True True True False
OUTPUT="$(./finetune.py -sr -sm -r -p 100 -k 100 | tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv
# True True True True
OUTPUT="$(./finetune.py -sr -sm -r -c -p 100 -k 100 | tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv





# anchor
# POPULATION SIZE = 10, K = 1000
# False False False False
OUTPUT="$(./finetune.py -p 10 -k 1000 | tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv
# False False False True
OUTPUT="$(./finetune.py -c| tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv
# False False True False
OUTPUT="$(./finetune.py -r -p 10 -k 1000 | tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv
# False False True True
OUTPUT="$(./finetune.py -r -c -p 10 -k 1000 | tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv
# False True False False
OUTPUT="$(./finetune.py -sm -p 10 -k 1000 | tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv
# False True False True
OUTPUT="$(./finetune.py -sm -c -p 10 -k 1000 | tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv
# False True True False
OUTPUT="$(./finetune.py -sm -r -p 10 -k 1000 | tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv
# False True True True
OUTPUT="$(./finetune.py -sm -r -c -p 10 -k 1000 | tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv
# True False False False
OUTPUT="$(./finetune.py -sr -p 10 -k 1000 | tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv
# True False False True
OUTPUT="$(./finetune.py -sr -c -p 10 -k 1000 | tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv
# True False True False
OUTPUT="$(./finetune.py -sr -r -p 10 -k 1000 | tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv
# True False True True
OUTPUT="$(./finetune.py -sr -r -c -p 10 -k 1000 | tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv
# True True False False
OUTPUT="$(./finetune.py -sr -sm -p 10 -k 1000 | tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv
# True True False True
OUTPUT="$(./finetune.py -sr -sm -c -p 10 -k 1000 | tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv
# True True True False
OUTPUT="$(./finetune.py -sr -sm -r -p 10 -k 1000 | tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv
# True True True True
OUTPUT="$(./finetune.py -sr -sm -r -c -p 10 -k 1000 | tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv


# POPULATION SIZE = 50, K = 1000
# False False False False
OUTPUT="$(./finetune.py -p 50 -k 1000 | tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv
# False False False True
OUTPUT="$(./finetune.py -c| tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv
# False False True False
OUTPUT="$(./finetune.py -r -p 50 -k 1000 | tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv
# False False True True
OUTPUT="$(./finetune.py -r -c -p 50 -k 1000 | tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv
# False True False False
OUTPUT="$(./finetune.py -sm -p 50 -k 1000 | tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv
# False True False True
OUTPUT="$(./finetune.py -sm -c -p 50 -k 1000 | tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv
# False True True False
OUTPUT="$(./finetune.py -sm -r -p 50 -k 1000 | tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv
# False True True True
OUTPUT="$(./finetune.py -sm -r -c -p 50 -k 1000 | tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv
# True False False False
OUTPUT="$(./finetune.py -sr -p 50 -k 1000 | tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv
# True False False True
OUTPUT="$(./finetune.py -sr -c -p 50 -k 1000 | tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv
# True False True False
OUTPUT="$(./finetune.py -sr -r -p 50 -k 1000 | tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv
# True False True True
OUTPUT="$(./finetune.py -sr -r -c -p 50 -k 1000 | tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv
# True True False False
OUTPUT="$(./finetune.py -sr -sm -p 50 -k 1000 | tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv
# True True False True
OUTPUT="$(./finetune.py -sr -sm -c -p 50 -k 1000 | tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv
# True True True False
OUTPUT="$(./finetune.py -sr -sm -r -p 50 -k 1000 | tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv
# True True True True
OUTPUT="$(./finetune.py -sr -sm -r -c -p 50 -k 1000 | tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv

# POPULATION SIZE = 100, K = 1000
# False False False False
OUTPUT="$(./finetune.py -p 100 -k 1000 | tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv
# False False False True
OUTPUT="$(./finetune.py -c| tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv
# False False True False
OUTPUT="$(./finetune.py -r -p 100 -k 1000 | tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv
# False False True True
OUTPUT="$(./finetune.py -r -c -p 100 -k 1000 | tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv
# False True False False
OUTPUT="$(./finetune.py -sm -p 100 -k 1000 | tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv
# False True False True
OUTPUT="$(./finetune.py -sm -c -p 100 -k 1000 | tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv
# False True True False
OUTPUT="$(./finetune.py -sm -r -p 100 -k 1000 | tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv
# False True True True
OUTPUT="$(./finetune.py -sm -r -c -p 100 -k 1000 | tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv
# True False False False
OUTPUT="$(./finetune.py -sr -p 100 -k 1000 | tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv
# True False False True
OUTPUT="$(./finetune.py -sr -c -p 100 -k 1000 | tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv
# True False True False
OUTPUT="$(./finetune.py -sr -r -p 100 -k 1000 | tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv
# True False True True
OUTPUT="$(./finetune.py -sr -r -c -p 100 -k 1000 | tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv
# True True False False
OUTPUT="$(./finetune.py -sr -sm -p 100 -k 1000 | tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv
# True True False True
OUTPUT="$(./finetune.py -sr -sm -c -p 100 -k 1000 | tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv
# True True True False
OUTPUT="$(./finetune.py -sr -sm -r -p 100 -k 1000 | tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv
# True True True True
OUTPUT="$(./finetune.py -sr -sm -r -c -p 100 -k 1000 | tail -n 1)"
echo "${OUTPUT}"
echo "${OUTPUT}" >> resultados.csv
