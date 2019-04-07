#!/usr/bin/python3

'''
This program's intention is to search for the best parameters in rainhas.py, through
the use of genetic algorithms.
'''

from rainhas import RainhasGeneticas
import time
import sys

def run_it(oldrecmut=False):
    pop_init_size=10
    mutation_chance=0.1
    recombination_chance=0.9
    grow_population=False
    population_limit=20
    die_by_age=False
    converge_all=False
    verbose=False

    rainhas = RainhasGeneticas(pop_init_size, mutation_chance, recombination_chance, grow_population, population_limit, die_by_age, converge_all, oldrecmut, verbose)

    runs = []
    t_0 = time.time()
    k=30
    print("array of integers representation.")
    print("population size =", pop_init_size)
    newline_required = False
    if oldrecmut:
        print("using old recombination and mutation functions.", end=' ')
        newline_required = True
    if grow_population:
        print("population growth activated. limit =", population_limit,end='. ')
        newline_required = True
    if die_by_age:
        print("death by age activated.", end=' ')
        newline_required = True
    if converge_all:
        print("converging all individuals.", end='')
        newline_required = True
    if newline_required:
        print()
    print("-"*80)
    print("number of runs:",k)
    print("starting... ")
    for i in range(k):
        runs.append(rainhas.solve_it())
        print("\r", i+1, " of ", k, " (%.2f" % ((i+1)/k * 100), " %)", sep='', end='', flush=True)
    t_f = time.time()
    print(" done.")
    print("ran for %.2f seconds." % (t_f-t_0))
    print("successes:", sum(int(i["success"]) for i in runs))
    print("average number of generations:", sum(i["numberOfGenerations"] for i in runs)/len(runs))
    print("least number of generations needed:", min(i["numberOfGenerations"] for i in runs))
    print("largest number of generations needed:", max(i["numberOfGenerations"] for i in runs))
    print("average individual evaluation:", sum(i["averageIndividual"] for i in runs)/len(runs))
    print("average worst individual:", sum(i["worstIndividual"] for i in runs)/len(runs))

    return runs, rainhas


def manually_verify(runs,rainhas):
    print("-"*80)
    for r in runs:
        solution_index = r["evaluation"].index(0)
        rainhas.visualize_gene(r["population"][solution_index])
        print("-"*80)

if __name__ == "__main__":
    runs,rainhas = run_it()
    if len(sys.argv) == 2:
        manually_verify(runs,rainhas)
