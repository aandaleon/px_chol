#loop for predicted expression in PrediXcan
"%&%" = function(a,b) paste(a,b,sep="")
database_tissues <- read.table("/home/angela/px_yri_chol/PrediXcan/database_tissues.txt")
database_tissues <- database_tissues$V1

for(i in database_tissues){
  PrediXcan_expression <- "python /home/wheelerlab1/predixcan/PrediXcan.py --predict --dosages /home/angela/px_cebu_chol/Imputation/Mich/ --samples /home/angela/px_cebu_chol/Imputation/Mich/UMich_dosages/samples.txt --weights /home/wheelerlab1/Data/PrediXcan_db/GTEx-V6p-HapMap-2016-09-08/" %&% i %&% " --output_dir /home/angela/px_cebu_chol/PrediXcan/"%&% i %&%"/"
  system(PrediXcan_expression)
}
