#!/usr/bin/python3

'''
This program's intention is to search for the best parameters in rainhas.py, through
the use of genetic algorithms.
'''

from rainhas import RainhasGeneticas
import time
import argparse

def run_it(roulette=False, pop_init_size=10, k=30, simple_recombination=False, simple_mutation=False, converge_all=False):
    mutation_chance=0.3
    recombination_chance=0.9
    grow_population=False
    population_limit=20
    die_by_age=False
    verbose=False

    rainhas = RainhasGeneticas(pop_init_size, mutation_chance, recombination_chance, grow_population, population_limit, die_by_age, converge_all, simple_recombination, simple_mutation, roulette, verbose)

    runs = []
    t_0 = time.time()
    print("array of integers representation.")
    print("population size = ", pop_init_size, ". mutation chance = ", mutation_chance * 100, " %. recombination chance = ", recombination_chance*100, " %", sep='')
    newline_required = False
    if roulette:
        print("using roulette for selection.", end=' ')
        newline_required = True
    else:
        print("using tournament for selection.", end=' ')
        newline_required = True
    if simple_recombination:
        print("using simple recombination function.", end=' ')
        newline_required = True
    if simple_mutation:
        print("using simple mutation function.", end=' ')
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

    # csv:
    print("%d, %d, %s, %s, %s, %s, %d, %.2f, %d, %d, %.2f, %.2f, %.2f" % (pop_init_size, k, simple_recombination, simple_mutation, roulette, converge_all, sum(int(i["success"]) for i in runs), sum(i["numberOfGenerations"] for i in runs)/len(runs), min(i["numberOfGenerations"] for i in runs), max(i["numberOfGenerations"] for i in runs), sum(i["averageIndividual"] for i in runs)/len(runs), sum(i["worstIndividual"] for i in runs)/len(runs), t_f-t_0))

    return runs, rainhas


def manually_verify(runs,rainhas):
    print("-"*80)
    for r in runs:
        solution_index = r["evaluation"].index(0)
        rainhas.visualize_gene(r["population"][solution_index])
        print("-"*80)

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Genetic algorithm to search the solution space for the eight queens puzzle.")
    parser.add_argument("-sr", dest="sr", action="store_const", const=True, default=False, help="if present, use simple recombination functions.")
    parser.add_argument("-sm", dest="sm", action="store_const", const=True, default=False, help="if present, use simple mutation function.")
    parser.add_argument("-v", "--verify", dest='verify', action="store_const", const=True, default=False, help="if present, print solutions at the end.")
    parser.add_argument("-k", type=int, help="number of runs of the genetic search.", default=30)
    parser.add_argument("-p", type=int, help="population size", default=10)
    parser.add_argument("-r", "--roulette", dest='roulette', action="store_const", const=True, default=False, help="if present, select by roulette, otherwise by tournament")
    parser.add_argument("-c", "--converge_all", dest="converge", action="store_const", const=True, default=False, help="if present, converge all individuals")
    args = parser.parse_args()
    runs,rainhas = run_it(roulette=args.roulette, pop_init_size=args.p, k=args.k, simple_recombination=args.sr, simple_mutation=args.sm, converge_all=args.converge)
    if args.verify:
        manually_verify(runs,rainhas)
