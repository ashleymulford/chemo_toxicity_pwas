#Import necessasry libraries
library(data.table)
library(tibble)

#Create function to paste in tissue name
"%&%" = function(a,b) paste(a,b,sep="")

#Create list of tissues for file input
model_list <- c("ALL", "AFA", "CAU", "CHN", "HIS")
drug_list <- c()







#Make a data frame with all results from each tissue per drug per pop
  #Read in file
  #Add column containing tissue name
  #Compile significant subsets into single data frame
for(model in model_list){
  arac_output <- fread("/home/ashley/LCL_chemotherapy/YRI/YRI_assoc_gemma_output/YRI_assoc_arac_" %&% tiss %&% ".assoc.txt")
  arac_output<-add_column(arac_output, tissue = tiss, .before = "chr")
  if(exists("YRI_assoc_arac")){
    YRI_assoc_arac<-merge(x = YRI_assoc_arac, y = arac_output, all = TRUE)
  }
  else{
    YRI_assoc_arac<-arac_output
  }
}

#Output data frames into directory
fwrite(YRI_assoc_arac, "/home/ashley/LCL_chemotherapy/YRI/YRI_assoc_gemma_output_combined/YRI_predixcan_arac", na = "NA", quote = F, sep = "\t", col.names = T) 
