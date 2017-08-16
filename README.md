# px_chol
Note: most of these filepaths are probably messed up as I've been moving and editing things along the way.

01_PLINK_QC_pipeline.bash - run initial quality control pipeline on raw dbGaP data using PLINK. Run concurrently with 02_PLINK_QC_plots.Rmd.  
02_PLINK_QC_plots.Rmd - make plots during quality control (including PCA) and also make files for removing and keeping SNPs and individuals at the end of initial QC. Run concurrently with 01_PLINK_QC_pipeline.bash.  

In between these steps, imputation occured following the pipelines on the respective servers.  

03_prep_fam_for_GEMMA.r - makes a prepped .fam file for GEMMA to create a relatedness matrix. I also realize I forgot to put the command that creates the relatedness matrix or the full genotype file.  
04_runGEMMA.r - commands ran for GEMMA. Warning: each command took ~400 min.  
05_qqman_GEMMA.r - creates QQ and Manhattan plot results for GEMMA output. Warning: each command takes a long time depending on the # of SNPs.  
06_runMetaXcan.r - double loop that runs MetaXcan in all tissues for all phenotypes.  
07_find_sig_genes.r - scans all MetaXcan outputs for genes w/ p-value lower than an adjustable threshold and writes them to a .csv.  
08_qqman_MX.r - creates a Manhattan and QQ plot for MetaXcan results (genes instead of SNPs plotted).  
09a_Sanger_vcf2px.py/09b_UMich_vcf2px.py - converts vcf to PrediXcan dosage format post-imputation, keeping SNPs r2 > 0.8 and MAF > 0.01.  
10_make_pred_exp.r - loop to create predicted expression files for each tissue.  
11_pred_exp_dotplot.r - makes a dotplot for observed phenotype vs. predicted expression of a gene.  
12_make_pheno_for_GCTA.r - makes a phenotype file for input into GCTA for REML analysis.  
13_runGCTA.sh - bash commands to run GCTA. May run into an error if pops do not converge.  
14_runXPEB.r - commands to create files for XPEB and run the package.  



