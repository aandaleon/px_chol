#Plots a lipid trait against gene expression
library(data.table)
library(ggplot2)
library(dplyr)

#using relateds...?
x <- fread('/home/angela/px_cebu_chol/GEMMAphenowIID.txt', header = T)
yGTEx <- fread('/home/angela/px_cebu_chol/ESPMCS_predicted_expression.txt', header = T)
xyGTEx <- inner_join(x, yGTEx, by = "IID")

ggplot(xyGTEx, aes(x = xyGTEx$ENSG00000186318.1, y = TRIG_rank)) + 
  geom_jitter(size = 0.75, color = "blue") + 
  stat_smooth(method="lm", se = FALSE, color = "blue", fullrange = TRUE) + 
  scale_x_continuous(name = "Predicted gene expression") + 
  scale_y_continuous(name = "TRIG (rank normalized)") + 
  theme(plot.title = element_text(hjust = 0.5, size = 24), axis.text=element_text(size=20), axis.title=element_text(size=20))