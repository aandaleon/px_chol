#creates a manhattan and qq for MetaXcan results
"%&%" = function(a,b) paste(a,b,sep="")
library(readr)
library(data.table)
library(dplyr)
source("/home/angela/forJournals/GWAS/qqman.r")

sig_genes_Cebu <- read.table("/home/angela/MetaXcan-master/GEMMA_Cebu/Mich/sig_genes.csv", header = T, sep = ',')
BP_Chrome <- read.table("/home/angela/px_yri_chol/PrediXcan/BP_Chrome.txt", header = T)
BP_Chrome <- transform(BP_Chrome, CHR=as.numeric(CHR))
BP_Chrome <- transform(BP_Chrome, BP=as.numeric(BP))
BP_Chrome$gene <- gsub("\\..*","",BP_Chrome$gene)
BP_Chrome$gene_name <- NULL

for(k in sig_genes_Cebu$pheno){
  for(l in sig_genes_Cebu$tissue){
    GWAS <- fread('/home/angela/MetaXcan-master/GEMMA_Cebu/Mich/' %&% l %&% '/' %&% k %&%'.csv', sep = ',')
    GWAS <- na.omit(GWAS)
    GWAS <- left_join(GWAS,BP_Chrome, by='gene')
    threshold <- -log10(0.05/dim(GWAS)[1])
    names(GWAS)[names(GWAS) == 'pvalue'] <- 'P'
    title = '' %&% l %&% ', ' %&% k %&% ''

    pdf(file = '/home/angela/MetaXcan-master/GEMMA_Cebu/Mich/' %&% l %&% '/man_' %&% k %&%'.pdf')
    manhattan(GWAS, suggestiveline = 0, genomewideline = threshold)
    dev.off()
    
    pdf(file = file = '/home/angela/MetaXcan-master/GEMMA_Cebu/Mich/' %&% l %&% '/qq_' %&% k %&%'.pdf')
    qq(GWAS$P)
    dev.off()
  }
}
