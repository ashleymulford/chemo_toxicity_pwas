#!/usr/bin/python

import gzip
import re
import sys
import argparse
import os

def check_arg(args=None):
    parser = argparse.ArgumentParser(description='Script to filter imputed VCF')
    parser.add_argument('-i', '--inputdir',
                        help='directory containing VCF file',
                        required='True'
                        )
    parser.add_argument('-c', '--chr',
                        help='chromosome',
			type=str,
                        required='True'
                        )
    return parser.parse_args(args)

#retrieve command line arguments
args = check_arg(sys.argv[1:])
chrpath = args.inputdir
c = args.chr
chrfile = chrpath + "chr" + c + ".txt.gz"


outdosage = open(chrpath + "chr" + c + "_protmodel_ids.txt","w")
for line in gzip.open(chrfile):
    arr = line.strip().split()
    (chr, id, pos) = arr[0:3]
    rest = arr[3:]
    #reformat ids for proteome models (chr:pos)
    id_formatted = "chr" + str(chr) + ":" + str(pos)
    output = str(chr) + ' ' + str(id_formatted) + ' ' + str(pos) + ' ' + str(rest) + '\n'
    output = output.replace("b", "")
    output = output.replace("'", "")
    output = output.replace(",", "")
    output = output.replace("[", "")
    output = output.replace("]", "")
    outdosage.write(output)

outdosage.close()
