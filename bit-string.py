class BitString:
    """Class that encapsulates raw patterns of manipulating bit string"""
    # IN PROGRESS
    def __init__(self, s):
        self.element_len=3
        self.bitstring=[]
        i=0
        while i < len(s):
            element=[]
            for j in range(self.element_len):
                element.append(s[i])
            self.bitstring.append(tuple(element))

    def __getitem__(self, key):
        return self.bitstring[key]

    def __setitem__(self, key, value):
        self.bitstring[key] = value

    
