#!/usr/bin/python3

'''
This program's intention is to search for the best parameters in rainhas.py, through
the use of genetic algorithms.
'''

from rainhas import RainhasGeneticas

rainhas = RainhasGeneticas(pop_init_size=10, mutation_chance=0.3, grow_population=False, population_limit=20,
                            die_by_age=False, converge_all=True, verbose=True)
rainhas.solve_it()
print(rainhas.evaluate(rainhas.population))
