#makes a prepped .fam file for GEMMA to create a relatedness matrix
library(dplyr)
QCStep5jfam <- read.table("/home/angela/px_cebu_chol/wRelateds/QCStep5j.fam") #w/ relateds
phenoCebuwIID <- read.table("/home/angela/px_cebu_chol/GEMMA/phenowIID.txt", header = T)
colnames(QCStep5jfam) <- c('FID', 'IID', 'NA1', 'NA2', 'Sex', 'Pheno')
newfam2 <- inner_join(QCStep5jfam, phenoCebuwIID, by = "IID")
newfam2$Pheno <- NULL
newfam2$NA1 <- NULL
newfam2$NA2 <- NULL
write.table(newfam2, '/home/angela/px_cebu_chol/GEMMA/testPLINK.fam', col.names = F, row.names = F, quote = F)
