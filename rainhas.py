#!/usr/bin/python3

'''
Solution for the eight queens puzzle, searching the solution space
with a genetic algorithm.
Pedro Queiroga, 2019.
Tópicos Avançados em Inteligência Artificial com Paulo Salgado,
Computação Bioinspirada.
'''

import random

def initialise(n):
    # population is represented as an array where each index is the column,
    # and the elements are the lines. 
    # ex: [0, 1, 2, 3, 4, 5, 6, 7] is a diagonal composed of queens.
    initial_gene = [0, 1, 2, 3, 4, 5, 6, 7]
    population = [ random.sample(initial_gene, len(initial_gene)) for i in range(n) ]
    return population

def evaluate(population):
    evaluation = [ eval_indie(i) for i in population ]
    return evaluation

def eval_indie(indie):
    penalty = 0
    seen = []
    for (idx, val) in enumerate(indie):
        for s in seen:
            if val == s[1]:
                penalty += 1
        else:
            seen.append((idx, val))
        if not set(seen).isdisjoint(diagonal_hits((idx, val))):
            penalty += 1
    return penalty

def diagonal_hits(line_column):
    line,column = line_column
    positions_hit = []
    for i in range(1,8):
        if line+i < 8:
            if column+i < 8:
                positions_hit.append((line+i, column+i))
            if column-i >= 0:
                positions_hit.append((line+i, column-i))
        if line-i >= 0:
            if column-i >= 0:
                positions_hit.append((line-i, column-i))
            if column+i < 8:
                positions_hit.append((line-i, column+i))
    return positions_hit

def select_parents(population):
    # choose 5 random individuals, and then get the best 2 of those.
    random_five_parents = random.choices(population, k=5)
    parents_evaluation = evaluate(random_five_parents)
    best_two_parents,_ = zip(*sorted(zip(random_five_parents, parents_evaluation), key=lambda x: x[1]))
    return list(best_two_parents[:2])

def recombine(parents):
    # my recombine function will choose a random number to cut,
    # and then find where they appear on each other's genes,
    # so i'll keep it always a permutation.
    p1,p2 = parents[0].copy(),parents[1].copy()
    max_cuttings = int(len(p1) / 4) # p1 and p2 are the same length
    to_cut = random.choices(range(8),k=max_cuttings)
    for v in to_cut:
        for (idx,j) in enumerate(p2):
            if p1[v] == j:
                # i'll exchange the indexes
                p1[v],p1[idx]=p1[idx],p1[v]
                p2[v],p2[idx]=p2[idx],p2[v]
            else:
                continue
    return [p1,p2]

def mutate(offspring):
    # i'll mutate an individual by permutating random indexes.
    for o in offspring:
        for (idx,_) in enumerate(o):
            if random.random() < 0.3:
                other_idx=random.randrange(8)
                o[idx],o[other_idx]=o[other_idx],o[idx]

    return offspring # off_ret

def select_survivors(population):
    # two worst individuals won't be considered for the next generation.
    evaluation = evaluate(population)
    # print('pre-select:', len(population))
    minney = evaluation.index(min(evaluation))
    del population[minney]
    del evaluation[minney]
    minney = evaluation.index(min(evaluation))
    del population[minney]
    
    # print('post-select:', len(population))
    return population

def visualize_gene(g):
    for i in g:
        for j in range(8):
            if j==i:
                print('q',end='')
            else:
                print('.',end='')
            if j < 7:
                print(' ', end='')
        print()

def solve_it(pop_init_size=2,pop_limit=20):
    population = initialise(pop_init_size)
    evaluation = evaluate(population)
    i = 0
    while min(evaluation) != 0:
        parents = select_parents(population)
        offspring = mutate(recombine(parents))
        if len(population) < pop_limit: # controle populacional
            # print('i=',i,len(pop))
            population = population + offspring
            # print('p',len(pop))
        if i % 10 == 0: # morte por idade
            population = population[2:]
            # print('morte por idade', len(pop))
        population = select_survivors(population) + offspring
        # print('pos-selecao',len(pop))
        evaluation = evaluate(population)
        if i % 500 == 0:
            print('i:',i)
            print(evaluation)
            print(population)
        i += 1
    print('size of population =', len(population))
    print('min(evaluation) =', min(evaluation))
    print('i =', i)
    solution = population[evaluation.index(min(evaluation))]
    print('eval_indie(solution) =', eval_indie(solution))
    print(solution)#  population[0])
    visualize_gene(solution)

solve_it()


def evaluate_test(a):
    print(evaluate([a]))

def diagonal_hits_test():
    print('diagonal_hits_tests...')
    assert diagonal_hits((0,0)) == [(1,1), (2,2), (3,3), (4,4), (5,5), (6,6), (7,7)], ('erro: ', diagonal_hits((1,1)))
    print('OK')

def eval_indie_test():
    chosen = [2, 7, 0, 6, 1, 3, 4, 5]
    print(chosen)
    print('-> %d' % (eval_indie(chosen)))

def select_parents_test():
    for i in select_parents(initialise(10)):
        print(i)

def recombine_test():
    for i in range(1):
        p = initialise(10)[:2]
        print(p[0])
        print(p[1])
        p = recombine(p)
        print(p[0])
        print(p[1])

def mutate_test():
    indie = [initialise(10)[1]]
    for i in indie:
        print(i)
    mutated = mutate(indie)
    for i in mutated:
        print(i)

