#Import necessasry libraries
library(data.table)
library(tibble)

#Create function to paste in tissue name
"%&%" = function(a,b) paste(a,b,sep="")

#Create list of tissues for file input
model_list <- c("ALL", "AFA", "CAU", "CHN", "HIS")
drug_list <- c("arac", "cape", "carbo", "cis", "dauno", "etop", "pacl", "peme")


#Make a data frame with all results from each tissue per drug per pop
  #Read in file
  #Add column containing tissue name
  #Compile significant subsets into single data frame
for(drug in drug_list){
  for(model in model_list){
    output <- fread("/home/ashley/LCL_chemotherapy/YRI/YRI_pwas_results/adj_assoc_output/YRI_" %&% drug %&% "_PAV_filtered" %&% model %&% "_WG_baseline_rho0.1_zpval0.05.adj.txt")
    output <- add_column(output, model = model, .before = "chr")
    output <- add_column(output, drug = drug, .before = "chr")
    if(exists("all_assoc")){
      all_assoc<-merge(x = all_assoc, y = output, all = TRUE)
    }
    else{
      all_assoc<-output
    }
  }
}

all_sig<-subset(all_assoc, pvalues_adjusted_BH < .75)

#Output data frames into directory
fwrite(all_assoc, "/home/ashley/LCL_chemotherapy/YRI/YRI_pwas_results/adj_assoc_output/YRI_allassoc_PAV_filtered_WG_baseline_rho0.1_zpval0.05.adj.txt", na = "NA", quote = F, sep = "\t", col.names = T) 
fwrite(all_sig, "/home/ashley/LCL_chemotherapy/YRI/YRI_pwas_results/adj_assoc_output/YRI_sig_PAV_filtered_WG_baseline_rho0.1_zpval0.05.adj.txt", na = "NA", quote = F, sep = "\t", col.names = T) 








