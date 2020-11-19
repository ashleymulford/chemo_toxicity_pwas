#convert predicted expression into gemma input with script: 03_pred_exp_to_GEMMA_input.R (found in px_his_chol, forked from WheelerLab)

#run association tests with gemma:
#run command in desired output directory, must also make directory called "output" for gemma to put results into


#For YRI and CEU:
#Create lists, one of drugs and on of populations 
declare -a drugs=("arac" "cape" "carbo" "cis" "dauno" "etop" "pacl" "peme")
declare -a models=("CAU" "ALL" "AFA" "CHN" "HIS")

#Use loop to run PrediXcan step two through GEMMA (accounts for relatedness)
for drug in ${drugs[@]}
  do
  for model in ${models[@]}
    do
    /usr/local/bin/gemma -g /home/ashley/LCL_chemotherapy/CEU/CEU_pwas_results/association_input/CEU_PCAIR_PAV_filtered_${model}_baseline_rho0.1_zpval0.05_gemma.txt -notsnp -p /home/ashley/LCL_chemotherapy/CEU/CEU_phenotypes/CEU_${drug}_bestpheno_noids.txt -k /home/ashley/LCL_chemotherapy/CEU/CEU_relationship_matrix_maf.cXX.txt -lmm 4 -o CEU_${drug}_PCAIR_PAV_filtered_${model}_baseline_rho0.1_zpval0.05
  done
done



#For ASN:
#Create lists, one of drugs and on of populations 
declare -a drugs=("arac" "cape" "carbo" "cis")
declare -a models=("CAU" "ALL" "AFA" "CHN" "HIS")

#Use loop to run PrediXcan step two through GEMMA (accounts for relatedness)
for drug in ${drugs[@]}
  do
  for model in ${models[@]}
    do
    /usr/local/bin/gemma -g /home/ashley/LCL_chemotherapy/ASN/ASN_pwas_results/association_input/ASN_PCAIR_PAV_filtered_${model}_baseline_rho0.1_zpval0.05_gemma.txt -notsnp -p /home/ashley/LCL_chemotherapy/ASN/ASN_phenotypes/ASN_${drug}_bestpheno_noids.txt -k /home/ashley/LCL_chemotherapy/ASN/ASN_relationship_matrix_maf.cXX.txt -lmm 4 -o ASN_${drug}_PCAIR_PAV_filtered_${model}_baseline_rho0.1_zpval0.05
  done
done



#For ALL:
#Create lists, one of drugs and on of populations 
declare -a drugs=("arac" "cape" "carbo" "cis" "dauno" "etop" "pacl" "peme")
declare -a models=("CAU" "ALL" "AFA" "CHN" "HIS")

#Use loop to run PrediXcan step two through GEMMA (accounts for relatedness)
for drug in ${drugs[@]}
  do
  for model in ${models[@]}
    do
    /usr/local/bin/gemma -g /home/ashley/LCL_chemotherapy/ALL/ALL_pwas_results/association_input/ALL_PCAIR_PAV_filtered_${model}_baseline_rho0.1_zpval0.05_gemma.txt -notsnp -p /home/ashley/LCL_chemotherapy/ALL/ALL_phenotypes/ALL_${drug}_bestpheno_noids.txt -k /home/ashley/LCL_chemotherapy/ALL/ALL_relationship_matrix_maf.cXX.txt -c /home/ashley/LCL_chemotherapy/ALL/ALL_covariates.txt -lmm 4 -o ALL_${drug}_PCAIR_PAV_filtered_${model}_baseline_rho0.1_zpval0.05
  done
done


