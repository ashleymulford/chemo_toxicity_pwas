#converts from BIMBAM format (comma delimited) to PrediXcan dosage format
#In BIMBAM format: A1 is minor, A2 is major, dosages are of A1/minor
#For predixcan dosages: A1 and A2 can be whatever, but freq and dosages must be for A2
#For this script, A1 from BIMBAM will become A2 for predixcan dosages, as the BIMBAM have the dose of A1
#will output as A2 A1 freq(A1) dose(A1), so that A1 becomes A2 (the second allele in the file)
#this script makes two output files, one with rsids and one with chr:pos ids - split by chr afterwards
    #use awk command: awk '$1 == #' dosages.txt > chr#.txt, where # is 1 through 22, run 22 times

from __future__ import division #because python 2 doesn't like real numbers
import argparse #allows for input of command line arguments
parser = argparse.ArgumentParser() #open the parser
parser.add_argument("--anno", type = str, action = "store", dest = "anno", required = True, help = "Input annotation file")
parser.add_argument("--BIMBAM", type = str, action = "store", dest = "BIMBAM", required = True, help = "Input BIMBAM file")
parser.add_argument("--output1", type = str, action = "store", dest = "output1", required = False, default = "dosages1.txt", help = "Output dosage file")
parser.add_argument("--output2", type = str, action = "store", dest = "output2", required = False, default = "dosages2.txt", help = "Output dosage file")
args = parser.parse_args() #parse given arguments

anno = open(args.anno, "r") #open anno file
BIMBAM = open(args.BIMBAM, "r") #open BIMBAM file
output1 = open(args.output1, "w") #open first output file (rsids)
output2 = open(args.output2, "w") #open second output file (chr:pos ids)


for anno_line, BIMBAM_line in zip(anno, BIMBAM): #go through each line in anno and BIMBAM (should be the same)
    a_line = anno_line.strip().split(",") #split anno line into list
    (rs_anno, bp, chr) = a_line[0:3] #assign each part of anno line to a variable
    B_line = BIMBAM_line.strip().split(",") #split BIMBAM line into list
    (rs_BIMBAM, A1, A2) = B_line[0:3] #assign first part of BIMBAM into variable
    dosages = B_line[3:] #assign last part of BIMBAM to a list, dosages of A1
    float_dosages = [float(dosage) for dosage in dosages] #convert each dosage into float
    AF = sum(float_dosages)/(len(dosages) * 2) #calculate frequency of A1
    AF = str(AF) #convert to string b/c Python doesn't like when you concatenate strings and numbers later
    dosages_str = "\t".join(dosages) #create string of dosages separate by tabs
    if rs_anno == rs_BIMBAM: #if the rs in anno and the rs in BIMBAM match, which they always should
        #A1 becomes A2 and A2 becomes A1 in output (pred dosages must be of second allele listed)
        dosage_format1 = (chr + "\t" + rs_anno + "\t" + bp + "\t" + A2 + "\t" + A1 + "\t" + AF + "\t" + dosages_str + "\n") #make all variables into PrediXcan dosage format (rsids)
        output1.write(dosage_format1) #write to output1 file
        dosage_format2 = ("chr" + chr + "\t" + "chr" + chr + ":" + bp + "\t" + bp + "\t" + A2 + "\t" + A1 + "\t" + AF + "\t" + dosages_str + "\n") #make all variables into PrediXcan dosage format (chr:pos ids)
        output2.write(dosage_format2) #write to output2 file

anno.close() #close anno file
BIMBAM.close() #close BIMBAM file
output1.close() #close output1 file
output2.close() #close output2 file
