#creates QQ and Manhattan plot results for GEMMA output
"%&%" = function(a,b) paste(a,b,sep="")
source("/home/angela/px_yri_chol/GWAS/qqman.r")
phenos <- c('CHOL', 'HDL', 'TRIG', 'LDL')

for(i in phenos){
  GWAS <- read.table('/home/angela/px_yri_chol/GEMMA/output/' %&% i %&% '_rank/YRI_' %&% i %&%'_rank.assoc.txt', header = T)
  colnames(GWAS) <- c("CHR", "SNP", "BP", "n_miss", "A1", "A0", "FRQ", "BETA", "SE", "l_remle", "l_mle", "P", "p_lrt", "p_score")
  GWAS$CHR <- as.integer(GWAS$CHR)
  GWAS$BP <- as.numeric(GWAS$BP)
  GWAS <- data.frame(GWAS)
  
  jpeg(file = '/home/angela/px_yri_chol/GEMMA/output/' %&% i %&% '_rank/qq_' %&% i %&%'.jpeg')
  qq(GWAS$P, main = "YRI, " %&% i %&% "")
  dev.off()

  jpeg(file = '/home/angela/px_yri_chol/GEMMA/output/' %&% i %&% '_rank/man_' %&% i %&%'.jpeg')
  manhattan(GWAS, main = "YRI, " %&% i %&% "")
  dev.off()
}