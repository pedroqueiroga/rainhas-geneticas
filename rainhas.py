#!/usr/bin/python3

'''
Solution for the eight queens puzzle, searching the solution space
with a genetic algorithm.
Pedro Queiroga, 2019.
Tópicos Avançados em Inteligência Artificial com Paulo Salgado,
Computação Bioinspirada.
'''

import random

class RainhasGeneticas:
    """A class that represents a set of tunable parameters"""

    def __init__(self, pop_init_size=10, mutation_chance=0.3, grow_population=False, population_limit=0, die_by_age=False, converge_all=False, verbose=True):
        self.pop_init_size = pop_init_size
        self.mutation_chance = mutation_chance
        self.grow_population = grow_population
        self.population_limit = population_limit
        self.die_by_age = die_by_age
        self.converge_all = converge_all
        self.verbose = verbose
        self.population = []
        self.current_generation = 0
        self.__initial_gene=list('000001010011100101110111')
        self.__element_len=3

    def initialise(self):
        # population is represented as a string of bits representing an array
        # where 3 bits make one element of that array.
        # each index is the column, and the elements are the lines.
        # ex:           [ 0 , 1 , 2 , 3 , 4 , 5 , 6 , 7 ] is a diagonal composed of queens.
        # alternatively: 000 001 010 011 100 101 110 111 -> '000001010011100101110111'
        self.population = [ self.__bs_fisher_yates(self.__initial_gene, self.__element_len) for i in range(self.pop_init_size) ]
        self.current_generation = 0

    def __bs_fisher_yates(self, s, element_len=3):
        """bs stands for bit string!"""
        i = int(len(s)/element_len) - 1
        while i > 0:
            j = random.randint(0,i)

            trans_i=i*element_len
            trans_j=j*element_len

            for k in range(element_len):
                s[trans_j+k],s[trans_i+k]=s[trans_i+k],s[trans_j+k]

            i -= 1
        return s

    def evaluate(self, population, element_len=None):
        if not element_len:
            element_len = self.__element_len
        evaluation = [ self.eval_indie(i, element_len) for i in population ]
        return evaluation

    def eval_indie(self, indie, element_len):
        penalty = 0
        seen = []
        idx = 0
        while idx < len(indie):
            parsed_num = '0b'
            for i in range(element_len):
                parsed_num += indie[idx]
                idx+=1
            val = int(parsed_num, 2)
            seen.append((int(idx/element_len), val))
            if not set(seen).isdisjoint(self.diagonal_hits((int(idx/element_len), val))):
                penalty += 1
        return penalty

    def diagonal_hits(self, line_column):
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

    def select_parents(self):
        # choose 5 random individuals, and then get the best 2 of those.
        random_five_parents = random.choices(self.population, k=5)
        parents_evaluation = self.evaluate(random_five_parents, self.__element_len)
        best_two_parents,_ = zip(*sorted(zip(random_five_parents, parents_evaluation), key=lambda x: x[1]))
        return list(best_two_parents[:2])

    def recombine(self, parents):
        # my recombine function will choose a random number to cut,
        # and then find where they appear on each other's genes,
        # so i'll keep it always a permutation.
        p1,p2 = parents[0].copy(),parents[1].copy()
        max_cuttings = int(len(p1) / 4) # p1 and p2 are the same length
        to_cut = random.choices(range(8),k=max_cuttings)
        for v in to_cut:
            for (idx,j) in enumerate(p2):
                parsed_parent = [p1[v*3 + i] for i in range(self.__element_len)]
                if p1[v*3] == j:
                    # i'll exchange the indexes
                    p1[v],p1[idx]=p1[idx],p1[v]
                    p2[v],p2[idx]=p2[idx],p2[v]
                else:
                    continue
        return [p1,p2]

    def mutate(self, offspring):
        # i'll mutate an individual by permutating random indexes.
        for o in offspring:
            for (idx,_) in enumerate(o):
                if random.random() < self.mutation_chance:
                    other_idx=random.randrange(8)
                    o[idx],o[other_idx]=o[other_idx],o[idx]

        return offspring # off_ret

    def select_survivors(self):
        # two worst individuals won't be considered for the next generation.
        evaluation = self.evaluate(self.population, self.__element_len)
        # print('pre-select:', len(population))
        minney = evaluation.index(max(evaluation))
        del self.population[minney]
        del evaluation[minney]
        minney = evaluation.index(max(evaluation))
        del self.population[minney]

        # print('post-select:', len(self.population))

    def visualize_gene(self, g):
        for i in g:
            for j in range(8):
                if j==i:
                    print('q',end='')
                else:
                    print('.',end='')
                if j < 7:
                    print(' ', end='')
            print()

    def solve_it(self):
        self.initialise()
        evaluation = self.evaluate(self.population, self.__element_len)
        func = min
        occ=0
        if self.converge_all:
            func = max
        while func(evaluation) != 0 and self.current_generation < 20000:
            if evaluation.count(0) > occ:
                occ += 1
                print('Found one!')
            parents = self.select_parents()
            offspring = self.mutate(self.recombine(parents))
            if self.grow_population:
                if len(self.population) < self.population_limit: # controle populacional
                    # print('i=',i,len(pop))
                    self.population = self.population + offspring
                    # print('p',len(pop))
            if self.die_by_age:
                if self.current_generation % 10 == 0: # morte por idade
                    self.population = self.population[2:]
                    # print('morte por idade', len(pop))'''
            self.select_survivors()
            self.population = self.population + offspring
            # print('pos-selecao',len(pop))
            evaluation = self.evaluate(self.population, self.__element_len)
            if self.verbose and self.current_generation % 500 == 0:
                print('current generation:',self.current_generation)
                print(evaluation)
                print(self.population)
            self.current_generation += 1
        '''
        print('size of population =', len(self.population))
        print('min(evaluation) =', min(evaluation))
        print('current generation =', self.current_generation)
        solution = self.population[evaluation.index(min(evaluation))]
        print('eval_indie(solution) =', self.eval_indie(solution))
        print(solution)#  population[0])
        self.visualize_gene(solution)
        '''
        end_result = {
            "success": min(evaluation)==0,
            "populationEndSize": len(self.population),
            "populationInitSize": self.pop_init_size,
            "evaluation": evaluation,
            "population": self.population,
            "numberOfGenerations": self.current_generation,
            "worstIndividual": max(evaluation),
            "averageIndividual": sum(evaluation)/len(evaluation)
        }
#        print('done in ', end_result["numberOfGenerations"], ' generations. worst individual: ', end_result["worstIndividual"], '. average: ', end_result["averageIndividual"], '.', sep='')
        return end_result


    def evaluate_test(self, a):
        print(self.evaluate([a]))

    def diagonal_hits_test(self):
        print('diagonal_hits_tests...')
        assert self.diagonal_hits((0,0)) == [(1,1), (2,2), (3,3), (4,4), (5,5), (6,6), (7,7)], ('erro: ', self.diagonal_hits((1,1)))
        print('OK')

    def eval_indie_test(self):
        chosen = [2, 7, 0, 6, 1, 3, 4, 5]
        print(chosen)
        print('-> %d' % (self.eval_indie(chosen)))

    def select_parents_test(self):
        self.pop_init_size=10
        self.initialise()
        for i in self.select_parents():
            print(i)

    def recombine_test(self):
        for _ in range(1):
            self.pop_init_size=10
            p = self.initialise()[:2]
            print(p[0])
            print(p[1])
            p = self.recombine(p)
            print(p[0])
            print(p[1])

    def mutate_test(self):
        self.pop_init_size=10
        indie = [self.initialise()[1]]
        for i in indie:
            print(i)
        mutated = self.mutate(indie)
        for i in mutated:
            print(i)


# rainhas = RainhasGeneticas(2, 0.3, True, 20, True)
# rainhas.solve_it()
