#! /bin/python

def lines_with_sequence(char):
    def with_char(length):
        sequence = char * length
        def find_in_doc(doc):
            line_sum = 0
            for line in doc:
                if sequence in line:
                    line_sum += 1
            return line_sum
        return find_in_doc
    return with_char

Input char: #
Input length: 3
Input doc:
###
@##
$$$
###
Expecting: 2
Actual: 0
Fail