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
    init = [0, 1, 2, 3, 4, 5, 6, 7]
    pop = [ random.sample(init, len(init)) for i in range(n) ]
    return pop

def evaluate(pop):
    ev = [ eval_indie(i) for i in pop ]
    return ev

def evaluate_test(a):
    print(evaluate([a]))

def eval_indie(indie):
    pena = 0
    seen = []
    for (idx, val) in enumerate(indie):
        for s in seen:
            if val == s[1]:
                pena += 1
        else:
            seen.append((idx, val))
        if not set(seen).isdisjoint(diagonal_hits((idx, val))):
            pena += 1
    return pena

def diagonal_hits(line_column):
    line,column = line_column
    ret = []
    for i in range(1,8):
        if line+i < 8:
            if column+i < 8:
                ret.append((line+i, column+i))
            if column-i >= 0:
                ret.append((line+i, column-i))
        if line-i >= 0:
            if column-i >= 0:
                ret.append((line-i, column-i))
            if column+i < 8:
                ret.append((line-i, column+i))
    return ret

def diagonal_hits_test():
    print('diagonal_hits_tests...')
    assert diagonal_hits((0,0)) == [(1,1), (2,2), (3,3), (4,4), (5,5), (6,6), (7,7)], ('erro: ', diagonal_hits((1,1)))
    print('OK')

def eval_indie_test():
    chosen = [2, 7, 0, 6, 1, 3, 4, 5]
    pprint_gen(chosen)
    print('-> %d' % (eval_indie(chosen)))

def select_parents(pop):
    r5 = random.choices(pop, k=5)
    ev5 = evaluate(r5)
    b2,_ = zip(*sorted(zip(r5, ev5), key=lambda x: x[1]))
    return list(b2[:2])

def select_parents_test():
    for i in select_parents(initialise(10)):
        pprint_gen(i)

def recombine(parents):
    # my recombine function will choose a random number to cut,
    # and then find where they appear on each other's chromosome,
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

def binary_sum(arr):
    total = 0
    for i in arr:
        total += int(i,2)
    return total

def recombine_test():
    for i in range(1):
        p = initialise(10)[:2]
        pprint_gen(p[0])
        pprint_gen(p[1])
        p = recombine(p)
        pprint_gen(p[0])
        pprint_gen(p[1])

def mutate(offspring):
    # i'll mutate an individual by permutating random indexes.
    offs_ret = offspring.copy()
    for off_ret in offs_ret:
        for (idx,_) in enumerate(off_ret):
            if random.random() < 0.3:
                other_idx=random.randrange(8)
                off_ret[idx],off_ret[other_idx]=off_ret[other_idx],off_ret[idx]

    return offspring # off_ret

def mutate_test():
    indie = [initialise(10)[1]]
    for i in indie:
        pprint_gen(i)
    mutated = mutate(indie)
    for i in mutated:
        pprint_gen(i)

def select_survivors(pop):
    ev = evaluate(pop)
    # print('pre-select:', len(pop))
    l,_ = zip(*sorted(zip(pop, ev), key=lambda x:x[1]))
    survivors = list(l[:-2])
    # print('post-select:', len(survivors))
    return survivors

def pprint_gen(g):
    print(g)

def visualize_chrom(g):
    for i in g:
        for j in range(8):
            if j==i:
                print('o',end='')
            else:
                print('.',end='')
            if j < 7:
                print(' ', end='')
        print()

def solve_it(pop_init_size=2,pop_limit=20):
    pop = initialise(pop_init_size)
    ev = evaluate(pop)
    i = 0
    while min(ev) != 0:
        parents = select_parents(pop)
        offspring = mutate(recombine(parents))
        if len(pop) < pop_limit: # controle populacional
            # print('i=',i,len(pop))
            pop = pop + offspring
            # print('p',len(pop))
        if i % 10 == 0: # morte por idade
            pop = pop[2:]
            # print('morte por idade', len(pop))
        pop = select_survivors(pop) + offspring
        # print('pos-selecao',len(pop))
        ev = evaluate(pop)
        if i % 500 == 0:
            print('i:',i)
            print(ev)
            print(pop)
        i += 1
    print('size of population =', len(pop))
    print('min(ev) =', min(ev))
    print('i =', i)
    solution = pop[ev.index(min(ev))]
    print('eval_indie(solution) =', eval_indie(solution))
    pprint_gen(solution)#  pop[0])
    visualize_chrom(solution)

solve_it()
"""
chromosomes_found = [
    [5, 7, 1, 3, 0, 6, 4, 2],
    [6, 4, 3, 0, 1, 5, 7, 2],
    [7, 1, 6, 3, 0, 4, 2, 5]
]

evaluate_test()
"""
