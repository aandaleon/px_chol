"%&%" = function(a,b) paste(a,b,sep="")
pheno_name <- c("CHOL_rank", "HDL_rank", "LDL_rank", "TRIG_rank")
database_tissues <- read.table('/home/angela/px_yri_chol/PrediXcan/database_tissues2.txt')
database_tissues <- database_tissues$V1

for (i in pheno_name){
  for (j in database_tissues){
    MetaXcan <- 'python /home/angela/MetaXcan-master/software/MetaXcan.py --model_db_path /home/wheelerlab1/Data/PrediXcan_db/GTEx-V6p-HapMap-2016-09-08/' %&% j %&% '_0.5.db --gwas_folder /home/angela/px_cebu_chol/GEMMA/MichGEMMA/output/' %&% i %&% '/ --snp_column rs --effect_allele_column allele0 --non_effect_allele_column allele1 --chromosome_column chr --position_column ps --freq_column af --beta_column beta --se_column se --pvalue_column p_wald --covariance /home/wheelerlab1/Data/PrediXcan_db/GTEx-V6p-HapMap-2016-09-08/' %&% j %&% '.txt.gz --output_file /home/angela/MetaXcan-master/GEMMA_Cebu/Mich/' %&% j %&%'_0.5.db/' %&% i %&% '.csv'
    system(MetaXcan)
  }
}
