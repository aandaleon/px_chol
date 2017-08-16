#makes phenotype files for input into GCTA
"%&%" = function(a,b) paste(a,b,sep="")
library(data.table)
library(dplyr)
pheno <- c("CHOL_rank", "HDL_rank", "TRIG_rank", "LDL_rank")

YRI_fam <- fread("/home/angela/compare/GCTA/Cebu2.fam", header = F)
Cebu_fam <- fread("/home/angela/compare/GCTA/YRI2.fam", header = F)
fam <- rbind(YRI_fam, Cebu_fam)
fam <- fam[,c("V1", "V2")]
fam$V2 <- as.character(fam$V2)
YRI_pheno <- fread("/home/angela/px_yri_chol/GEMMA/phenoYRIwIID2.txt", header = T)
Cebu_pheno <- fread("/home/angela/px_cebu_chol/GEMMAphenowIID.txt", header = T)

for(i in pheno){
  YRI_CHOL <- YRI_pheno %>% select(IID, i)
  Cebu_CHOL <- Cebu_pheno %>% select(IID, i)
  colnames(YRI_CHOL) <- c("V2", paste("YRI_", i, sep = ""))
  colnames(Cebu_CHOL) <- c("V2", paste("Cebu_", i, sep = ""))
  Cebu_CHOL$V2 <- as.character(Cebu_CHOL$V2)
  pheno <- left_join(fam, YRI_CHOL, by = "V2")
  pheno <- left_join(pheno, Cebu_CHOL, by = "V2")
  fwrite(pheno, "/home/angela/compare/GCTA/" %&% i %&% ".txt", na = "NA", col.names = F, row.names = F, quote = F, sep = " ")
}
