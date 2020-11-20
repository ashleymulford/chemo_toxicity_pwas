#Import necessary libraries
library(data.table)
library(dplyr)
library(ggplot2)

#PrediXcan PWAS Results:

#Pheno files:
x_ALL_arac_pheno<-fread("/home/ashley/LCL_chemotherapy/ALL/ALL_multixcan_phenos/ALL_arac.txt")
x_ALL_dauno_pheno<-fread("/home/ashley/LCL_chemotherapy/ALL/ALL_multixcan_phenos/ALL_dauno.txt")
x_ALL_peme_pheno<-fread("/home/ashley/LCL_chemotherapy/ALL/ALL_multixcan_phenos/ALL_peme.txt")
x_ASN_cis_pheno<-fread("/home/ashley/LCL_chemotherapy/ASN/ASN_multixcan_phenos/ASN_cis.txt")
x_YRI_peme_pheno<-fread("/home/ashley/LCL_chemotherapy/YRI/YRI_multixcan_phenos/YRI_peme.txt")

#Predicted Expression files:
y_ALL_Pred_AFA<-fread("/home/ashley/LCL_chemotherapy/ALL/ALL_pwas_results/predicted_levels/ALL_PCAIR_PAV_filtered_AFA_baseline_rho0.1_zpval0.05.txt")
y_ALL_Pred_ALL<-fread("/home/ashley/LCL_chemotherapy/ALL/ALL_pwas_results/predicted_levels/ALL_PCAIR_PAV_filtered_ALL_baseline_rho0.1_zpval0.05.txt")
y_ALL_Pred_CAU<-fread("/home/ashley/LCL_chemotherapy/ALL/ALL_pwas_results/predicted_levels/ALL_PCAIR_PAV_filtered_CAU_baseline_rho0.1_zpval0.05.txt")
y_ALL_Pred_CHN<-fread("/home/ashley/LCL_chemotherapy/ALL/ALL_pwas_results/predicted_levels/ALL_PCAIR_PAV_filtered_CHN_baseline_rho0.1_zpval0.05.txt")
y_ASN_Pred_CAU<-fread("/home/ashley/LCL_chemotherapy/ASN/ASN_pwas_results/predicted_levels/ASN_PCAIR_PAV_filtered_CAU_baseline_rho0.1_zpval0.05.txt")
y_YRI_Pred_CHN<-fread("/home/ashley/LCL_chemotherapy/YRI/YRI_pwas_results/predicted_levels/YRI_PCAIR_PAV_filtered_CHN_baseline_rho0.1_zpval0.05.txt")
y_YRI_Pred_HIS<-fread("/home/ashley/LCL_chemotherapy/YRI/YRI_pwas_results/predicted_levels/YRI_PCAIR_PAV_filtered_HIS_baseline_rho0.1_zpval0.05.txt")


#Plot Predicted Expression for IL5RA, for AFA Model, ALL pop, and Ara-C drug:
#Data file:
xy_ALL_Pred_arac_AFA<-inner_join(x_ALL_arac_pheno, y_ALL_Pred_AFA, by = c("FID", "IID"))

pdf("/home/ashley/LCL_chemotherapy/ALL/ALL_pwas_results/pred_exp_plots/ALL_arac_IL5RA.pdf")
ggplot(xy_ALL_Pred_arac_AFA, aes(x = xy_ALL_Pred_arac_AFA$SL005188_ENSG00000091181.19, y = xy_ALL_Pred_arac_AFA$Pheno)) +
  geom_jitter(size = 0.75, color = "#ec328c") + 
  geom_density_2d(color = "#ffbf24") + 
  stat_smooth(method="lm", se = TRUE, fullrange = TRUE, color = "#8c1788") + 
  scale_x_continuous(name = "Predicted protein levels") + 
  scale_y_continuous(name = "Ara-C AUC (rank normalized)") + 
  theme_bw() + 
  theme(text = element_text(size = 12), plot.title = element_text(hjust = 0.5)) +
  ggtitle("ALL Ara-C Baseline AFA IL5RA")
dev.off()


#Plot Predicted Expression for EGF and HK2, for ALL Model, ALL pop, and Daunorubicin drug:
#Data file:
xy_ALL_Pred_dauno_ALL<-inner_join(x_ALL_dauno_pheno, y_ALL_Pred_ALL, by = c("FID", "IID"))

pdf("/home/ashley/LCL_chemotherapy/ALL/ALL_pwas_results/pred_exp_plots/ALL_dauno_EGF.pdf")
ggplot(xy_ALL_Pred_dauno_ALL, aes(x = xy_ALL_Pred_dauno_ALL$SL000084_ENSG00000138798.13 , y = xy_ALL_Pred_dauno_ALL$Pheno)) +
  geom_jitter(size = 0.75, color = "#ec328c") + 
  geom_density_2d(color = "#ffbf24") + 
  stat_smooth(method="lm", se = TRUE, fullrange = TRUE, color = "#8c1788") + 
  scale_x_continuous(name = "Predicted protein levels") + 
  scale_y_continuous(name = "Daunorubicin IC50 (rank normalized)") + 
  theme_bw() + 
  theme(text = element_text(size = 12), plot.title = element_text(hjust = 0.5)) +
  ggtitle("ALL Daunorubicin Baseline ALL EGF")
dev.off()

pdf("/home/ashley/LCL_chemotherapy/ALL/ALL_pwas_results/pred_exp_plots/ALL_dauno_HK2.pdf")
ggplot(xy_ALL_Pred_dauno_ALL, aes(x = xy_ALL_Pred_dauno_ALL$SL007272_ENSG00000159399.9  , y = xy_ALL_Pred_dauno_ALL$Pheno)) +
  geom_jitter(size = 0.75, color = "#ec328c") + 
  geom_density_2d(color = "#ffbf24") + 
  stat_smooth(method="lm", se = TRUE, fullrange = TRUE, color = "#8c1788") + 
  scale_x_continuous(name = "Predicted protein levels") + 
  scale_y_continuous(name = "Daunorubicin IC50 (rank normalized)") + 
  theme_bw() + 
  theme(text = element_text(size = 12), plot.title = element_text(hjust = 0.5)) +
  ggtitle("ALL Daunorubicin Baseline ALL HK2")
dev.off()


#Plot Predicted Expression for DPT, for CAU Model, ALL pop, and Ara-C drug:
#Data file:
xy_ALL_Pred_arac_CAU<-inner_join(x_ALL_arac_pheno, y_ALL_Pred_CAU, by = c("FID", "IID"))

pdf("/home/ashley/LCL_chemotherapy/ALL/ALL_pwas_results/pred_exp_plots/ALL_arac_DPT.pdf")
ggplot(xy_ALL_Pred_arac_CAU, aes(x = xy_ALL_Pred_arac_CAU$SL008178_ENSG00000143196.5, y = xy_ALL_Pred_arac_CAU$Pheno)) +
  geom_jitter(size = 0.75, color = "#ec328c") + 
  geom_density_2d(color = "#ffbf24") + 
  stat_smooth(method="lm", se = TRUE, fullrange = TRUE, color = "#8c1788") + 
  scale_x_continuous(name = "Predicted protein levels") + 
  scale_y_continuous(name = "Ara-C AUC (rank normalized)") + 
  theme_bw() + 
  theme(text = element_text(size = 12), plot.title = element_text(hjust = 0.5)) +
  ggtitle("ALL Ara-C Baseline CAU DPT")
dev.off()


#Plot Predicted Expression for IL17RD, for CHN Model, ALL pop, and Pemetrexed drug:
#Data file:
xy_ALL_Pred_peme_CHN<-inner_join(x_ALL_peme_pheno, y_ALL_Pred_CHN, by = c("FID", "IID"))

pdf("/home/ashley/LCL_chemotherapy/ALL/ALL_pwas_results/pred_exp_plots/ALL_peme_IL17RD.pdf")
ggplot(xy_ALL_Pred_peme_CHN, aes(x = xy_ALL_Pred_peme_CHN$SL010613_ENSG00000144730.18, y = xy_ALL_Pred_peme_CHN$Pheno)) +
  geom_jitter(size = 0.75, color = "#ec328c") + 
  geom_density_2d(color = "#ffbf24") + 
  stat_smooth(method="lm", se = TRUE, fullrange = TRUE, color = "#8c1788") + 
  scale_x_continuous(name = "Predicted protein levels") + 
  scale_y_continuous(name = "Pemetrexed AUC (rank normalized)") + 
  theme_bw() + 
  theme(text = element_text(size = 12), plot.title = element_text(hjust = 0.5)) +
  ggtitle("ALL Pemetrexed Baseline CHN IL17RD")
dev.off()



#Plot Predicted Expression for NAGK, for CAU Model, ASN pop, and Cisplatin drug:
#Data file:
xy_ASN_Pred_cis_CAU<-inner_join(x_ASN_cis_pheno, y_ASN_Pred_CAU, by = c("FID", "IID"))

pdf("/home/ashley/LCL_chemotherapy/ASN/ASN_pwas_results/pred_exp_plots/ASN_cis_NAGK.pdf")
ggplot(xy_ASN_Pred_cis_CAU, aes(x = xy_ASN_Pred_cis_CAU$SL005629_ENSG00000124357.13, y = xy_ASN_Pred_cis_CAU$Pheno)) +
  geom_jitter(size = 0.75, color = "#ec328c") + 
  geom_density_2d(color = "#ffbf24") + 
  stat_smooth(method="lm", se = TRUE, fullrange = TRUE, color = "#8c1788") + 
  scale_x_continuous(name = "Predicted protein levels") + 
  scale_y_continuous(name = "Cisplatin IC50 (rank normalized)") + 
  theme_bw() + 
  theme(text = element_text(size = 12), plot.title = element_text(hjust = 0.5)) +
  ggtitle("ASN Cisplatin Baseline CAU NAGK")
dev.off()




#Plot Predicted Expression for IL17RD, for CHN Model, YRI pop, and Pemetrexed drug:
#Data file:
xy_YRI_Pred_peme_CHN<-inner_join(x_YRI_peme_pheno, y_YRI_Pred_CHN, by = c("FID", "IID"))

pdf("/home/ashley/LCL_chemotherapy/YRI/YRI_pwas_results/pred_exp_plots/YRI_peme_IL17RD.pdf")
ggplot(xy_YRI_Pred_peme_CHN, aes(x = xy_YRI_Pred_peme_CHN$SL010613_ENSG00000144730.18, y = xy_YRI_Pred_peme_CHN$Pheno)) +
  geom_jitter(size = 0.75, color = "#ec328c") + 
  geom_density_2d(color = "#ffbf24") + 
  stat_smooth(method="lm", se = TRUE, fullrange = TRUE, color = "#8c1788") + 
  scale_x_continuous(name = "Predicted protein levels") + 
  scale_y_continuous(name = "Pemetrexed AUC (rank normalized)") + 
  theme_bw() + 
  theme(text = element_text(size = 12), plot.title = element_text(hjust = 0.5)) +
  ggtitle("YRI Pemetrexed Baseline CHN IL17RD")
dev.off()



#Plot Predicted Expression for PDE5A, for HIS Model, YRI pop, and Pemetrexed drug:
#Data file:
xy_YRI_Pred_peme_HIS<-inner_join(x_YRI_peme_pheno, y_YRI_Pred_HIS, by = c("FID", "IID"))

pdf("/home/ashley/LCL_chemotherapy/YRI/YRI_pwas_results/pred_exp_plots/YRI_peme_PDE5A.pdf")
ggplot(xy_YRI_Pred_peme_HIS, aes(x = xy_YRI_Pred_peme_HIS$SL011405_ENSG00000138735.16, y = xy_YRI_Pred_peme_HIS$Pheno)) +
  geom_jitter(size = 0.75, color = "#ec328c") + 
  geom_density_2d(color = "#ffbf24") + 
  stat_smooth(method="lm", se = TRUE, fullrange = TRUE, color = "#8c1788") + 
  scale_x_continuous(name = "Predicted protein levels") + 
  scale_y_continuous(name = "Pemetrexed AUC (rank normalized)") + 
  theme_bw() + 
  theme(text = element_text(size = 12), plot.title = element_text(hjust = 0.5)) +
  ggtitle("YRI Pemetrexed Baseline HIS PDE5A")
dev.off()



