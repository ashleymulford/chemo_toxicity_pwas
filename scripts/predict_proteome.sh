#do for all pops and models:

#to use prot models data must be in build 38, ids must be chr#:pos
#see liftover.sh for liftover info

python3 /home/wheelerlab3/MetaXcan/software/Predict.py \
--model_db_path /home/ryan/topmed/proteome/dapg_net_CORRECT_WINDOWS/current_dbs/PAV_filteredALL_WG_baseline_rho0.1_zpval0.05.db \
--text_genotypes /home/ashley/LCL_chemotherapy/ALL/ALL_predixcan_dosages/build_38/chr*.txt.gz \
--text_sample_ids /home/ashley/LCL_chemotherapy/ALL/samples.txt \
--prediction_output /home/ashley/LCL_chemotherapy/ALL/ALL_pwas_results/predicted_levels/ALL_PAV_filteredALL_WG_baseline_rho0.1_zpval0.05.txt
