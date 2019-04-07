#!/usr/bin/python3

'''
This program's intention is to search for the best parameters in rainhas.py, through
the use of genetic algorithms.
'''

from rainhas import RainhasGeneticas
import time

pop_init_size=10
mutation_chance=0.1
grow_population=False
population_limit=20
die_by_age=False
converge_all=True
verbose=False

rainhas = RainhasGeneticas(pop_init_size, mutation_chance, grow_population, population_limit, die_by_age, converge_all, verbose)

runs = []
t_0 = time.time()
k=100
print("array of integers representation.")
if grow_population:
    print("population growth activated. limit =", population_limit,end='. ')
if die_by_age:
    print("death by age activated.", end=' ')
if converge_all:
    print("converging all individuals.", end='')
if grow_population or die_by_age or converge_all:
    print()
print("-"*80)
print("number of runs:",k)
print("starting... ",end='', flush=True)
for i in range(k):
    runs.append(rainhas.solve_it())
    print("", i+1,"",end='', flush=True)
    # print(rainhas.evaluate(rainhas.population))
t_f = time.time()
print("done.")
print("ran for %.2f seconds." % (t_f-t_0))
print("successes:", sum(int(i["success"]) for i in runs))
print("average number of generations:", sum(i["numberOfGenerations"] for i in runs)/len(runs))
print("least number of generations needed:", min(i["numberOfGenerations"] for i in runs))
print("largest number of generations needed:", max(i["numberOfGenerations"] for i in runs))
print("average individual evaluation:", sum(i["averageIndividual"] for i in runs)/len(runs))
print("average worst individual:", sum(i["worstIndividual"] for i in runs)/len(runs))

"""
print("-"*80)
for r in runs:
    solution_index = r["evaluation"].index(0)
    rainhas.visualize_gene(r["population"][solution_index])
    print("-"*80)
"""
