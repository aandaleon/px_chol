/usr/local/bin/gcta64 --reml-bivar --reml-maxit 300 --grm /home/angela/compare/GCTA/combined2 --pheno /home/angela/compare/GCTA/CHOL_rank.txt --out /home/angela/compare/GCTA/CHOL_rank_GCTA.txt
/usr/local/bin/gcta64 --reml-bivar --reml-maxit 300 --grm /home/angela/compare/GCTA/combined2 --pheno /home/angela/compare/GCTA/HDL_rank.txt --out /home/angela/compare/GCTA/HDL_rank_GCTA.txt
#^these first two did not converge and therefore ran into an error

/usr/local/bin/gcta64 --reml-bivar --grm /home/angela/compare/GCTA/combined2 --pheno /home/angela/compare/GCTA/TRIG_rank.txt --out /home/angela/compare/GCTA/TRIG_rank_GCTA.txt
/usr/local/bin/gcta64 --reml-bivar --grm /home/angela/compare/GCTA/combined2 --pheno /home/angela/compare/GCTA/LDL_rank.txt --out /home/angela/compare/GCTA/LDL_rank_GCTA.txt
