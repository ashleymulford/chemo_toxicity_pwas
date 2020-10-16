#make new dosage file (build 38) from lifted.txt and dosage2.txt (build 37)

#Import necessary libraries
library(data.table)
library(dplyr)

#Input files
lifted<-fread("/home/ashley/LCL_chemotherapy/YRI/YRI_predixcan_dosages/build_38/lifted.txt", header = F)
dosages_37<-fread("/home/ashley/LCL_chemotherapy/YRI/YRI_predixcan_dosages/build_38/dosages2.txt", header = F)

#Join by snp_id, keep only lifted snps
dosages_38<-left_join(lifted, dosages_37, by = c("V4" = "V2", "V1" = "V1"))

#remove uneeded pos columns
dosages_38$V3.x<-NULL
dosages_38$V3.y<-NULL

#remove build 37 id column (need ids with pos from build 38)
dosages_38$V4<-NULL

#dosage file has no ids, will add with python 
fwrite(dosages_38, "/home/ashley/LCL_chemotherapy/YRI/YRI_predixcan_dosages/build_38/dosages_b38_no_ids.txt", sep = "\t", col.names >

