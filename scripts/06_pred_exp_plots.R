#Import necessary libraries
library(data.table)
library(dplyr)
library(ggplot2)

#PrediXcan PWAS Results:

#Plot Predicted Expression for STARD5, for Brain_Cortex tissue, ALL pop, and Etop drug:
#Pheno file:
x_ALL_etop_pheno<-fread("/home/ashley/LCL_chemotherapy/ALL/ALL_multixcan_phenos/ALL_etop.txt")
#Predicted Expression file:
y_ALL_Pred_Brain_Cortex<-fread("/home/ashley/LCL_chemotherapy/ALL/ALL_predixcan_predict_output/ALL_results_Brain_Cortex_predicted_expression.txt")
#Association file with top hits (to look up gene ID):
ALL_Pred_top_hits<-fread("/home/ashley/LCL_chemotherapy/ALL/ALL_assoc_gemma_output_combined/ALL_predixcan_top_hits")
#Data file:
xy_ALL_Pred_etop_Brain_Cortex<-inner_join(x_ALL_etop_pheno, y_ALL_Pred_Brain_Cortex, by = c("FID", "IID"))

#Make Plot:
pdf("/home/ashley/LCL_chemotherapy/ALL/ALL_predicted_expression_plots/ALL_Etoposide_STARD5.pdf")
ggplot(xy_ALL_Pred_etop_Brain_Cortex, aes(x = xy_ALL_Pred_etop_Brain_Cortex$ENSG00000172345.9, y = xy_ALL_Pred_etop_Brain_Cortex$Pheno)) +
  geom_jitter(size = 0.75, color = "#ec328c") + 
  geom_density_2d(color = "#ffbf24") + 
  stat_smooth(method="lm", se = TRUE, fullrange = TRUE, color = "#8c1788") + 
  scale_x_continuous(name = "Predicted gene expression") + 
  scale_y_continuous(name = "Etop IC50 (rank normalized)") + 
  theme_bw() + 
  theme(text = element_text(size = 12), plot.title = element_text(hjust = 0.5)) +
  ggtitle("ALL Etoposide Brain Cortex STARD5")
dev.off()

