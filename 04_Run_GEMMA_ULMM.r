YRI_CHOL_rank <- 'gemma -g /home/angela/px_yri_chol/GEMMA/fullGeno.txt.gz -p /home/angela/px_yri_chol/GEMMA/phenoYRIwoIID2.txt -a /home/angela/px_yri_chol/GEMMA/annoFull.txt -lmm 4 -n 9 -k /home/angela/px_yri_chol/GEMMA/output/PLINKgeno.cXX.txt -o YRI_CHOL_rank'
system(YRI_CHOL_rank)
YRI_HDL_rank <- 'gemma -g /home/angela/px_yri_chol/GEMMA/fullGeno.txt.gz -p /home/angela/px_yri_chol/GEMMA/phenoYRIwoIID2.txt -a /home/angela/px_yri_chol/GEMMA/annoFull.txt -lmm 4 -n 10 -k /home/angela/px_yri_chol/GEMMA/output/PLINKgeno.cXX.txt -o YRI_HDL_rank'
system(YRI_HDL_rank)
YRI_TRIG_rank <- 'gemma -g /home/angela/px_yri_chol/GEMMA/fullGeno.txt.gz -p /home/angela/px_yri_chol/GEMMA/phenoYRIwoIID2.txt -a /home/angela/px_yri_chol/GEMMA/annoFull.txt -lmm 4 -n 11 -k /home/angela/px_yri_chol/GEMMA/output/PLINKgeno.cXX.txt -o YRI_TRIG_rank'
system(YRI_TRIG_rank)
YRI_LDL_rank <- 'gemma -g /home/angela/px_yri_chol/GEMMA/fullGeno.txt.gz -p /home/angela/px_yri_chol/GEMMA/phenoYRIwoIID2.txt -a /home/angela/px_yri_chol/GEMMA/annoFull.txt -lmm 4 -n 12 -k /home/angela/px_yri_chol/GEMMA/output/PLINKgeno.cXX.txt -o YRI_LDL_rank'
system(YRI_LDL_rank)

Cebu_CHOL_rank <- 'gemma -g /home/angela/px_cebu_chol/GEMMA/GEMMAinput.txt.gz -p /home/angela/px_cebu_chol/GEMMAphenowoIID.txt -a /home/angela/px_cebu_chol/GEMMA/annoFull.txt -lmm 4 -n 5 -k /home/angela/px_cebu_chol/GEMMA/output/relatedness.cXX.txt -o Cebu_CHOL_rank'
system(Cebu_CHOL_rank)
Cebu_HDL_rank <- 'gemma -g /home/angela/px_cebu_chol/GEMMA/GEMMAinput.txt.gz -p /home/angela/px_cebu_chol/GEMMAphenowoIID.txt -a /home/angela/px_cebu_chol/GEMMA/annoFull.txt -lmm 4 -n 6 -k /home/angela/px_cebu_chol/GEMMA/output/relatedness.cXX.txt -o Cebu_HDL_rank'
system(Cebu_HDL_rank)
Cebu_TRIG_rank <- 'gemma -g /home/angela/px_cebu_chol/GEMMA/GEMMAinput.txt.gz -p /home/angela/px_cebu_chol/GEMMAphenowoIID.txt -a /home/angela/px_cebu_chol/GEMMA/annoFull.txt -lmm 4 -n 7 -k /home/angela/px_cebu_chol/GEMMA/output/relatedness.cXX.txt -o Cebu_LDL_rank'
system(Cebu_TRIG_rank)
Cebu_LDL_rank <- 'gemma -g /home/angela/px_cebu_chol/GEMMA/GEMMAinput.txt.gz -p /home/angela/px_cebu_chol/GEMMAphenowoIID.txt -a /home/angela/px_cebu_chol/GEMMA/annoFull.txt -lmm 4 -n 8 -k /home/angela/px_cebu_chol/GEMMA/output/relatedness.cXX.txt -o Cebu_TRIG_rank'
system(Cebu_LDL_rank)

