#Import necessary libraries
library(data.table)
library(dplyr)
library(ggplot2)

#PrediXcan PWAS Results:

#Plot Predicted Expression for IL5RA, for AFA Model, ALL pop, and Ara-C drug:
#Pheno file:
x_ALL_arac_pheno<-fread("/home/ashley/LCL_chemotherapy/ALL/ALL_multixcan_phenos/ALL_arac.txt")
#Predicted Expression file:
y_ALL_Pred_AFA<-fread("/home/ashley/LCL_chemotherapy/ALL/ALL_pwas_results/predicted_levels/ALL_PCAIR_PAV_filtered_AFA_baseline_rho0.1_zpval0.05.txt")
#Data file:
xy_ALL_Pred_arac_AFA<-inner_join(x_ALL_etop_pheno, y_ALL_Pred_Brain_Cortex, by = c("FID", "IID"))

#Make Plot:
pdf("/home/ashley/LCL_chemotherapy/ALL/ALL_predicted_expression_plots/ALL_arac_IL5RA.pdf")
ggplot(xy_ALL_Pred_arac_AFA, aes(x = xy_ALL_Pred_arac_AFA$SL005188_ENSG00000091181.19, y = xy_ALL_Pred_arac_AFA$Pheno)) +
  geom_jitter(size = 0.75, color = "#ec328c") + 
  geom_density_2d(color = "#ffbf24") + 
  stat_smooth(method="lm", se = TRUE, fullrange = TRUE, color = "#8c1788") + 
  scale_x_continuous(name = "Predicted protein levels") + 
  scale_y_continuous(name = "Ara-C AUC (rank normalized)") + 
  theme_bw() + 
  theme(text = element_text(size = 12), plot.title = element_text(hjust = 0.5)) +
  ggtitle("ALL Ara-C AFA IL5RA")
dev.off()

