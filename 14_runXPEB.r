"%&%" = function(a,b) paste(a,b,sep="")
library(XPEB2)
library(data.table)
anno <- fread('/home/angela/px_glgc_chol/anno.txt') #used to convert chr:bp to rs
colnames(anno) <- c("rs", "BP", "CHR", "x")
pheno <- c("CHOL", "HDL", "TRIG", "LDL")

for(i in pheno){
  gwas <- fread("/home/angela/px_yri_chol/GEMMA/output/" %&% i %&% "_rank/YRI_" %&% i %&% "_rank.assoc.txt", header = T)
  gwas2 <- left_join(gwas, anno)
  gwas2 <- gwas2[complete.cases(gwas2),]
  gwas2 <- gwas2[!rev(duplicated(rev(gwas2$rs))),]
  gwas2 <- gwas2[,c("rs", "CHR", "BP", "p_wald")]
  colnames(gwas2) <- c("SNP", "CHR", "BP", "P")
  fwrite(gwas2, "/home/angela/XPEB/" %&% i %&% "/YRI.txt", sep = " ", quote = F, row.names = F)
}

for(k in pheno){
  gwas <- fread("/home/angela/px_cebu_chol/GEMMA/MichGEMMA/output/" %&% k %&% "_rank/Cebu_" %&% k %&% "_rank.assoc.txt", header = T)
  gwas2 <- left_join(gwas, anno)
  gwas2 <- gwas2[complete.cases(gwas2),]
  gwas2 <- gwas2[!rev(duplicated(rev(gwas2$rs))),]
  gwas2 <- gwas2[,c("rs", "CHR", "BP", "p_wald")]
  colnames(gwas2) <- c("SNP", "CHR", "BP", "P")
  fwrite(gwas2, "/home/angela/XPEB/" %&% k %&% "/Cebu.txt", sep = ' ', quote = F, row.names = F)
}

for(j in pheno){
  GLGC <- fread("/home/angela/px_glgc_chol/" %&% j %&% "/jointGwasMc_" %&% j %&%".txt")
  GLGC <- GLGC[,c("rsid", "P-value")]
  GLGC <- GLGC[!rev(duplicated(rev(GLGC$rsid))),]
  colnames(GLGC) <- c("SNP", "P")
  fwrite(GLGC, "/home/angela/XPEB/" %&% j %&% "/GLGC.txt", sep = " ", quote = F, row.names = F)
}

for(j in pheno){
  tryCatch({
    path.target <- '/home/angela/XPEB_output/' %&% j %&% '/Cebu.txt'
    path.base <- '/home/angela/XPEB_output/' %&% j %&% '/GLGC.txt'
    Cebu_GLGC <- run.xpeb(path.target = path.target, path.base = path.base, n.target = 1765, n.base = 94595)
    write.table(Cebu_GLGC, "/home/angela/XPEB_output/" %&% j %&%"/Cebu_GLGC.txt", quote = F, row.names = F)
    path.target <- '/home/angela/XPEB_output/' %&% j %&% '/YRI.txt'
    YRI_GLGC <- run.xpeb(path.target = path.target, path.base = path.base, n.target = 1017, n.base = 94595)
    write.table(YRI_GLGC, "/home/angela/XPEB_output/" %&% j %&%"/YRI_GLGC.txt", quote = F, row.names = F)
  }, error=function(e){})
}
