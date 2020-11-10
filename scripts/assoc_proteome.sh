#convert predicted expression into gemma input with script: 03_pred_exp_to_GEMMA_input.R (found in px_his_chol, forked from WheelerLab)

#run association tests with gemma:


gemma -g /home/ashley/LCL_chemotherapy/YRI/YRI_assoc_gemma_input/Adipose_Subcutaneous -notsnp -p /home/ashley/LCL_chemotherapy/YRI/YRI_phenotypes/YRI_carbo_bestpheno_noids.txt -k YRI_relationship_matrix_maf.cXX.txt -lmm 4 -o YRI_assoc_carbo_[tissue]
