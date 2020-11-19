#do for all pops and models:

#to use prot models data must be in build 38, ids must be chr#:pos
#see liftover.sh for liftover info

python3 /home/wheelerlab3/MetaXcan/software/Predict.py \
--model_db_path /home/ryan/TOPMed_Proteome/dbs_out/AFA_PCAIR_baseline_models_PAV_filtered_rho0.1_zpval0.05.db \
--text_genotypes /home/ashley/LCL_chemotherapy/ALL/ALL_predixcan_dosages/build_38/chr*.txt.gz \
--text_sample_ids /home/ashley/LCL_chemotherapy/ALL/samples.txt \
--prediction_output /home/ashley/LCL_chemotherapy/ALL/ALL_pwas_results/predicted_levels/ALL_PCAIR_PAV_filtered_AFA_baseline_rho0.1_zpval0.05.txt

python3 /home/wheelerlab3/MetaXcan/software/Predict.py \
--model_db_path /home/ryan/TOPMed_Proteome/dbs_out/AFA_PCAIR_baseline_models_PAV_filtered_rho0.1_zpval0.05.db \
--text_genotypes /home/ashley/LCL_chemotherapy/YRI/YRI_predixcan_dosages/build_38/chr*.txt.gz \
--text_sample_ids /home/ashley/LCL_chemotherapy/YRI/samples.txt \
--prediction_output /home/ashley/LCL_chemotherapy/YRI/YRI_pwas_results/predicted_levels/YRI_PCAIR_PAV_filtered_AFA_baseline_rho0.1_zpval0.05.txt

python3 /home/wheelerlab3/MetaXcan/software/Predict.py \
--model_db_path /home/ryan/TOPMed_Proteome/dbs_out/AFA_PCAIR_baseline_models_PAV_filtered_rho0.1_zpval0.05.db \
--text_genotypes /home/ashley/LCL_chemotherapy/CEU/CEU_predixcan_dosages/build_38/chr*.txt.gz \
--text_sample_ids /home/ashley/LCL_chemotherapy/CEU/samples.txt \
--prediction_output /home/ashley/LCL_chemotherapy/CEU/CEU_pwas_results/predicted_levels/CEU_PCAIR_PAV_filtered_AFA_baseline_rho0.1_zpval0.05.txt

python3 /home/wheelerlab3/MetaXcan/software/Predict.py \
--model_db_path /home/ryan/TOPMed_Proteome/dbs_out/AFA_PCAIR_baseline_models_PAV_filtered_rho0.1_zpval0.05.db \
--text_genotypes /home/ashley/LCL_chemotherapy/ASN/ASN_predixcan_dosages/build_38/chr*.txt.gz \
--text_sample_ids /home/ashley/LCL_chemotherapy/ASN/samples.txt \
--prediction_output /home/ashley/LCL_chemotherapy/ASN/ASN_pwas_results/predicted_levels/ASN_PCAIR_PAV_filtered_AFA_baseline_rho0.1_zpval0.05.txt
