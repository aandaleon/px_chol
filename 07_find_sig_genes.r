##Write script that reads associations from MetaXcan and determines which are significant through independent testing threshold (line 16)

"%&%" = function(a,b) paste(a,b,sep="")
library(data.table)
database_tissues <- read.table("/home/angela/px_yri_chol/PrediXcan/database_tissues.txt")
database_tissues <- database_tissues$V1
pheno_name <- c("CHOL_rank", "HDL_rank", "TRIG_rank", "LDL_rank")
significant <- read.table("/home/angela/MetaXcan-master/GEMMA_Cebu/Mich/sig_genes.txt", header = T, sep = ",")
##sig_genes_Mich.txt consists of a single line, "gene gene_name zscore effect_size pvalue var_g pred_perf_r2 pred_perf_pval pred_perf_qval n_snps_used n_snps_in_cov n_snps_in_model tissue pheno"

for(i in database_tissues){
  for(j in pheno_name){
    tissue <- fread("/home/angela/MetaXcan-master/GEMMA_YRI/"%&% i %&%"/"%&% j %&%".csv", header = T, sep = ',')
    tissue$tissue <- i
    tissue$pheno <- j
    threshold <- 0.05/dim(tissue)[1]
    tissue <- subset(tissue, pvalue <= threshold)
    significant <- rbind(significant, tissue)
  }
}

write.csv(significant, "/home/angela/MetaXcan-master/GEMMA_YRI/sig_genes.csv", row.names = F, quote = F)
