#Based on https://github.com/WheelerLab/GWAS_QC/blob/master/example_pipelines/TCS_GWAS_QC/02_plink_QC.sh
#.log outputs are cut to only include relevant information in this example
  
#QCStep1:
plink --bfile /home/wheelerlab1/Data/dbGaP_YRI_CHOL_height/CIDR_Dementia_AA_Yoruba_Top_subject_level_filtered.chr1-22.noNAfrq --missing --out /home/angela/px_yri_chol/QC/QCStep1/QCStep1
  ##Creates two files: .imiss (individual) and .lmiss (SNP/locus) that details missingness in data
  ###1581500 variants loaded from .bim file.
  ###1264 people (446 males, 818 females) loaded from .fam.
  ###Total genotyping rate is 0.998341
  ###--missing: Sample missing data report written to /home/angela/px_yri_chol/QC/QCStep1/QCStep1.imiss, and variant-based missing data report written to /home/angela/px_yri_chol/QC/QCStep1/Step1.lmiss.
  ###1581500 variants and 1264 people pass filters and QC.

#QCStep2:
plink --bfile /home/wheelerlab1/Data/dbGaP_YRI_CHOL_height/CIDR_Dementia_AA_Yoruba_Top_subject_level_filtered.chr1-22.noNAfrq --geno 0.01 --make-bed --out /home/angela/px_yri_chol/QC/QCStep2/QCStep2
  ##Recalculates individual call rates after removing SNPs with call rates <99% and creates new set of binary files
  ###1581500 variants loaded from .bim file.
  ###1264 people (446 males, 818 females) loaded from .fam.
  ###58664 variants removed due to missing genoype data (--geno).
  ###--make-bed to /home/angela/px_yri_chol/QC/QCStep2/QCStep2.bed + /home/angela/px_yri_chol/QC/QCStep2/QCStep2.bim + /home/angela/px_yri_chol/QC/QCStep2/QCStep2.fam ... done
  ###1522836 variants and 1264 people pass filters and QC.

#QCStep3:
plink --bfile /home/angela/px_yri_chol/QC/QCStep2/QCStep2 --missing --out /home/angela/px_yri_chol/QC/QCStep3/QCStep3
  ##Creates two files: .imiss (individual) and .lmiss (SNP/locus) that details missingness in data
  ###1522836 variants loaded from .bim file.
  ###1264 people (446 males, 818 females) loaded from .fam.
  ###Total genotyping rate is 0.999244.
  ###--missing: Sample missing data report written to /home/angela/px_yri_chol/QC/QCStep3/QCStep3.imiss, and variant-based missing data report written to /home/angela/px_yri_chol/QC/QCStep3/QCStep3.lmiss.

#QCStep4:
plink --bfile /home/angela/px_yri_chol/QC/QCStep2/QCStep2 --hardy --out /home/angela/px_yri_chol/QC/QCStep4/QCStep4
  ##Calculates Hardy-Weinberg statistics for each SNP using founders (in this cohort, only 9 are available) in a .hwe file to flag later.; here, no SNP in .hwe has reached p < 1e-06
  ###1522836 variants loaded from .bim file.
  ###1264 people (446 males, 818 females) loaded from .fam.
  ###Total genotyping rate is 0.999244.
  ###--hardy: Writing Hardy-Weinberg report (founders only) to /home/angela/px_yri_chol/QC/QCStep4/QCStep4.hwe ... done.

#QCStep5a:
plink --bfile /home/angela/px_yri_chol/QC/QCStep2/QCStep2 --indep-pairwise 50 5 0.3 --out /home/angela/px_yri_chol/QC/QCStep5/QCStep5a/QCStep5a
  ##Creates a pruned list of SNP IDs for plotting on a principal components analysis
  ##Linkage disequilibrium set to 0.3 instead of 0.2 because of African cohort
  ###1522836 variants loaded from .bim file.
  ###1264 people (446 males, 818 females) loaded from .fam.
  ###Total genotyping rate is 0.999244.
  ###Pruned 109556 variants from chromosome 1, leaving 9958.
  ###Pruned 116601 variants from chromosome 2, leaving 10340.
  ###Pruned 98545 variants from chromosome 3, leaving 8677.
  ###Pruned 92595 variants from chromosome 4, leaving 8293.
  ###Pruned 87304 variants from chromosome 5, leaving 7834.
  ###Pruned 92736 variants from chromosome 6, leaving 8267.
  ###Pruned 77928 variants from chromosome 7, leaving 6997.
  ###Pruned 76304 variants from chromosome 8, leaving 6820.
  ###Pruned 63075 variants from chromosome 9, leaving 5726.
  ###Pruned 71511 variants from chromosome 10, leaving 6536.
  ###Pruned 69699 variants from chromosome 11, leaving 6329.
  ###Pruned 66934 variants from chromosome 12, leaving 6126.
  ###Pruned 51034 variants from chromosome 13, leaving 4684.
  ###Pruned 46613 variants from chromosome 14, leaving 4237.
  ###Pruned 44148 variants from chromosome 15, leaving 4072.
  ###Pruned 46250 variants from chromosome 16, leaving 4332.
  ###Pruned 39306 variants from chromosome 17, leaving 3761.
  ###Pruned 43133 variants from chromosome 18, leaving 4027.
  ###Pruned 27304 variants from chromosome 19, leaving 2693.
  ###Pruned 34960 variants from chromosome 20, leaving 3272.
  ###Pruned 20072 variants from chromosome 21, leaving 1918.
  ###Pruned 20401 variants from chromosome 22, leaving 1928.
  ###Pruning complete.  1396009 of 1522836 variants removed.
  ###1522836 variants and 1264 people pass filters and QC.
  ###Marker lists written to /home/angela/px_yri_chol/QC/QCStep5/QCStep5.prune.in and /home/angela/px_yri_chol/QC/QCStep5/QCStep5.prune.out

#QCStep5b:
plink --bfile /home/angela/px_yri_chol/QC/QCStep2/QCStep2 --extract /home/angela/px_yri_chol/QC/QCStep5/QCStep5a/QCStep5a.prune.in --genome --min 0.25 --out /home/angela/px_yri_chol/QC/QCStep5/QCStep5b/QCStep5b
  ##Extracts the SNPs from QCStep5a into a .genome file using an identity-by-descent threshold of 0.25 relatedness for plotting
  ##0.25 was used as the threshold due to the high degree of relatedness within the cohort. (did not perform this step for the GEMMA cohort)
  ##User: create a list of individuals to remove due to relatedness (in this example, related.to.remove.txt)
  ###1522836 variants loaded from .bim file.
  ###1264 people (446 males, 818 females) loaded from .fam.
  ###--extract: 126827 variants remaining.
  ###Total genotyping rate is 0.999174.
  ###126827 variants and 1264 people pass filters and QC.
  ###IBD calculations complete.
  ###Finished writing /home/angela/px_yri_chol/QC/QCStep5/QCStep5b/QCStep5b.genome .

#At this point, create plots as instructed in https://github.com/aandaleon/px_yri_chol/blob/master/02_QCPlots/02_QCPlots.Rmd

#QCStep5c:
plink --bfile /home/angela/px_yri_chol/QC/QCStep2/QCStep2 --het --out /home/angela/px_yri_chol/QC/QCStep5/QCStep5c/QCStep5c
  ##Creates .het file of inbreeding coefficients for plotting
  ###1522836 variants loaded from .bim file.
  ###1264 people (446 males, 818 females) loaded from .fam.
  ###Total genotyping rate is 0.999244.
  ###1522836 variants and 1264 people pass filters and QC.
  ###--het: 1522836 variants scanned, report written to /home/angela/px_yri_chol/QCStep5/QCStep5c/QCStep5c.het

#QCStep5d:
plink --bfile /home/angela/px_yri_chol/QC/QCStep2/QCStep2 --extract /home/angela/px_yri_chol/QC/QCStep5/QCStep5a/QCStep5a.prune.in --remove /home/angela/px_yri_chol/QC/QCStep5/QCStep5d/related.to.remove.txt --make-bed --out /home/angela/px_yri_chol/QC/QCStep5/QCStep5d/QCStep5d
  ##Removes individuals with >0.25 relatedness, extracts SNPs from the pruned list in QCStep5a, and creates new binary files without them
  ###1522836 variants loaded from .bim file.
  ###1264 people (446 males, 818 females) loaded from .fam.
  ###--remove: 1189 people remaining.
  ###Total genotyping rate in remaining samples is 0.999246.
  ###126827 variants and 1189 people pass filters and QC.
  ###--make-bed to /home/angela/px_yri_chol/QC/QCStep5/QCStep5d/QCStep5d.bed + /home/angela/px_yri_chol/QC/QCStep5/QCStep5d/QCStep5d.bim + /home/angela/px_yri_chol/QC/QCStep5/QCStep5d/QCStep5d.fam ... done.

#QCStep5e:
plink --bfile /home/angela/px_yri_chol/QC/QCStep5/QCStep5d/QCStep5d --het --out /home/angela/px_yri_chol/QC/QCStep5/QCStep5e/QCStep5e
  ##Checks heterozygosity for individuals with <0.25 relatedness
  ###126827  variants loaded from .bim file.
  ##1189 people (408 males, 781 females) loaded from .fam.
  ###Total genotyping rate is 0.999137.
  ###126827 variants and 1189 people pass filters and QC.
  ###--het: 113384 variants scanned, report written to /home/angela/px_yri_chol/QCStep5/QCStep5e/QCStep5e.het .

#At this point, continue to run analyses from https://github.com/aandaleon/px_yri_chol/blob/master/02_QCPlots/02_QCPlots.Rmd

#QCStep5f: 
plink --bfile /home/angela/px_yri_chol/QC/QCStep5/QCStep5d/QCStep5d --remove /home/angela/px_yri_chol/QC/QCStep5/QCStep5e/QCStep5e.txt --make-bed --out /home/angela/px_yri_chol/QC/QCStep5/QCStep5f/QCStep5f
  ##Makes a new set of bfiles without >0.25 relatedness or +/-3 SD outliers
  ###1522836 variants loaded from .bim file.
  ###1189 people (408 males, 781 females) loaded from .fam.
  ###--extract: 52694 variants remaining.
  ###--remove: 1184 people remaining.
  ###Total genotyping rate is 0.999137.
  ###126827 variants and 1184 people pass filters and QC.
  ###--make-bed to /home/angela/px_yri_chol/QCStep5/QCStep5f/QCStep5f.bed + /home/angela/px_yri_chol/QCStep5/QCStep5f/QCStep5f.bim + /home/angela/px_yri_chol/QCStep5/QCStep5f/QCStep5f.fam ... done.

#QCStep6a:
plink --bfile /home/angela/px_yri_chol/QC/QCStep5/QCStep5f/QCStep5f --bmerge /home/wheelerlab1/Data/HAPMAP3_hg19/HM3_ASN_CEU_YRI_Unrelated_hg19_noAmbig.bed /home/wheelerlab1/Data/HAPMAP3_hg19/HM3_ASN_CEU_YRI_Unrelated_hg19_noAmbig.bim /home/wheelerlab1/Data/HAPMAP3_hg19/HM3_ASN_CEU_YRI_Unrelated_hg19_noAmbig.fam --make-bed --out /home/angela/px_yri_chol/QC/QCStep6/QCStep6a/QCStep6a
  ##Merge study cohort with HAPMAP for principal component analysis; produces new .fam file and .missnp, a list of missing SNPs
  ###1184 people loaded from /home/angela/px_yri_chol/QC/QCStep6/QCStep6.fam.
  ###391 people to be merged from /home/wheelerlab1/Data/HAPMAP3_hg19/HM3_ASN_CEU_YRI_Unrelated_hg19_noAmbig.fam.
  ###Of these, 391 are new, while 0 are present in the base dataset.
  ###Warning: Multiple chromosomes seen for variant...
  ###Warning: Multiple positions seen for variant...
  ###126827 markers loaded from /home/angela/QC/QCStep5/QCStep5f/QCStep5f.bim.
  ###1499880 markers to be merged from /home/wheelerlab1/Data/HAPMAP3_hg19/HM3_ASN_CEU_YRI_Unrelated_hg19_noAmbig.bim.
  ###Of these, 1451475 are new, while 48405 are present in the base dataset.
  
#QCStep6b:
plink --bfile /home/wheelerlab1/Data/HAPMAP3_hg19/HM3_ASN_CEU_YRI_Unrelated_hg19_noAmbig --exclude /home/angela/px_yri_chol/QC/QCStep6/QCStep6a/QCStep6a-merge.missnp --make-bed --out /home/angela/px_yri_chol/QC/QCStep6/QCStep6b/QCStep6b
  ##Exclude missing SNPs for another try at merging
  ###1499880 variants loaded from .bim file.
  ###391 people (197 males, 194 females) loaded from .fam.
  ###--extract: 11515 variants remaining.
  ###11515 variants and 391 people pass filters and QC.
  ###Among remaining phenotypes, 0 are cases and 391 are controls.
  ###--make-bed to /home/angela/px_yri_chol/QC/QCStep6/QCStep6b/QCStep6b.bed + /home/angela/px_yri_chol/QC/QCStep6/QCStep6b/QCStep6b.bim + /home/angela/px_yri_chol/QC/QCStep6/QCStep6b/QCStep6b.fam ... done.

#QCStep6c:
plink --bfile /home/angela/px_yri_chol/QC/QCStep5/QCStep5f/QCStep5f --bmerge /home/angela/px_yri_chol/QC/QCStep6/QCStep6b/QCStep6b.bed /home/angela/px_yri_chol/QC/QCStep6/QCStep6b/QCStep6b.bim /home/angela/px_yri_chol/QC/QCStep6/QCStep6b/QCStep6b.fam --make-bed --out /home/angela/px_yri_chol/QC/QCStep6/QCStep6c/QCStep6c
  ##After excluding, try merging HAPMAP and study cohort again
  ###1184 people loaded from /home/angela/px_yri_chol/QC/QCStep5/QCStep5f/QCStep5f.fam.
  ###391 people to be merged from /home/angela/px_yri_chol/QC/QCStep6/QCStep6b/QCStep6b.fam.
  ###Of these, 391 are new, while 0 are present in the base dataset.
  ###Warning: Multiple chromosomes seen for variant...
  ###Warning: Multiple positions seen for variant...
  ###126827 markers loaded from /home/angela/px_yri_chol/QC/QCStep5/QCStep5f/QCStep5f.bim.
  ###1475615 markers to be merged from /home/angela/px_yri_chol/QC/QCStep6/QCStep6b/QCStep6b.bim.
  ###Of these, 1451475  are new, while 11436 are present in the base dataset.
  ###2 more multple-position warnings: see log file.
  ###Warning: Variants '...' and '...' have the same position
  ###16561 more same-position warnings: see log file.
  ###Performing single-pass merge (1575 people, 1578302 variants).
  ###8901 more same-position warnings: see log file.
  ###Merged fileset written to /home/angela/px_yri_chol/QC/QCStep6/QCStep6c/QCStep6c-merge.bed + /home/angela/px_yri_chol/QC/QCStep6/QCStep6c/QCStep6c-merge.bim + /home/angela/px_yri_chol/QC/QCStep6/QCStep6c/QCStep6c-merge.fam .
  ###1578302 variants loaded from .bim file.
  ###1575 people (602 males, 973 females) loaded from .fam.
  ###391 phenotype values loaded from .fam.
  ###Warning: 1676 het. haploid genotypes present (see /home/angela/px_yri_chol/QC/QCStep6/QCStep6c/QCStep6c.hh ); many commands treat these as missing.
  ###Total genotyping rate is 0.257259.
  ###1578302 variants and 1575 people pass filters and QC.
  ###Among remaining phenotypes, 0 are cases and 391 are controls.  (1184 phenotypes are missing.)
  ###--make-bed to /home/angela/px_yri_chol/QC/QCStep6/QCStep6c/QCStep6c.bed + /home/angela/px_yri_chol/QC/QCStep6/QCStep6c/QCStep6c.bim + /home/angela/px_yri_chol/QC/QCStep6/QCStep6c/QCStep6c ... done.

#QCStep6d:
plink --bfile /home/angela/px_yri_chol/QC/QCStep6/QCStep6c/QCStep6c --geno 0.2 --maf 0.05 --make-bed --out /home/angela/px_yri_chol/QC/QCStep6/QCStep6d/QCStep6d
  ##Filter merged file to SNPs with >90% genotypes
  ###1578302 variants loaded from .bim file.
  ###1575 people (602 males, 973 females) loaded from .fam.
  ###391 phenotype values loaded from .fam.
  ###Warning: 1676 het. haploid genotypes present (see /home/angela/px_yri_chol/QC/QCStep6/QCStep6d/QCStep6d.hh ); many commands treat these as missing.
  ###Total genotyping rate is 0.257259.
  ###1554164  variants removed due to missing genotype data (--geno).
  ###185 variants removed due to minor allele threshold(s)
  ###(--maf/--max-maf/--mac/--max-mac).
  ###23953 variants and 1575 people pass filters and QC.
  ###--make-bed to /home/angela/px_yri_chol/QC/QCStep6/QCStep6d/QCStep6d.bed + /home/angela/px_yri_chol/QC/QCStep6/QCStep6d/QCStep6d.bim + /home/angela/px_yri_chol/QC/QCStep6/QCStep6d/QCStep6d.fam ... done.

#QCStep6e:
plink --bfile /home/angela/px_yri_chol/QC/QCStep6/QCStep6d/QCStep6d --indep-pairwise 50 5 0.3 --recode --out /home/angela/px_yri_chol/QC/QCStep6/QCStep6e/QCStep6e
  ##Reduces number of points for plotting in a principal components analysis, and creaties .map and .ped files for smartpca
  ###23953 variants loaded from .bim file.
  ###1575 people (602 males, 973 females) loaded from .fam.
  ###391 phenotype values loaded from .fam.
  ###Total genotyping rate is 0.987966.
  ###23953  variants and 1575 people pass filters and QC.
  ###--recode to /home/angela/px_yri_chol/QC/QCStep6/QCStep6e/QCStep6e.ped + /home/angela/px_yri_chol/QC/QCStep6/QCStep6e/QCStep6e.map ... done.
  ###Pruned 156 variants from chromosome 1, leaving 1814.
  ###Pruned 118 variants from chromosome 2, leaving 1763.
  ###Pruned 102 variants from chromosome 3, leaving 1532.
  ###Pruned 113 variants from chromosome 4, leaving 1339.
  ###Pruned 104 variants from chromosome 5, leaving 1332.
  ###Pruned 138 variants from chromosome 6, leaving 1432.
  ###Pruned 95 variants from chromosome 7, leaving 1173.
  ###Pruned 88 variants from chromosome 8, leaving 1170.
  ###Pruned 75 variants from chromosome 9, leaving 1006.
  ###Pruned 114 variants from chromosome 10, leaving 1199.
  ###Pruned 74 variants from chromosome 11, leaving 1154.
  ###Pruned 83 variants from chromosome 12, leaving 1099.
  ###Pruned 57 variants from chromosome 13, leaving 892.
  ###Pruned 47 variants from chromosome 14, leaving 741.
  ###Pruned 45 variants from chromosome 15, leaving 690.
  ###Pruned 37 variants from chromosome 16, leaving 751.
  ###Pruned 64 variants from chromosome 17, leaving 662.
  ###Pruned 33 variants from chromosome 18, leaving 732.
  ###Pruned 33 variants from chromosome 19, leaving 481.
  ###Pruned 51 variants from chromosome 20, leaving 637.
  ###Pruned 24 variants from chromosome 21, leaving 357.
  ###Pruned 16 variants from chromosome 22, leaving 330.
  ###Pruning complete.  1667 of 23953 variants removed.
  ###Marker lists written to /home/angela/px_yri_chol/QC/QCStep6/QCStep6e/QCStep6e.prune.in and /home/angela/px_yri_chol/QC/QCStep6/QCStep6e/QCStep6e.prune.out .

#QCStep6f:
awk '{print $1,$2,$3,$4,$5,1}' /home/angela/px_yri_chol/QC/QCStep6/QCStep6d/QCStep6d.fam > /home/angela/px_yri_chol/QCStep6/QCStep6e/QCStep6e.fam

#QCStep6g:
perl /home/wheelerlab1/Data/GWAS_QC_scripts/make_par_file.pl /home/angela/px_yri_chol/QC/QCStep6/QCStep6e/QCStep6e 0 > /home/angela/px_yri_chol/QC/QCStep6/QCStep6f/QCStep6f.par
  ##Make parfile for smartpca

#QCStep6h
smartpca -p /home/angela/px_yri_chol/QC/QCStep6/QCStep6f/QCStep6f.par
  ##run smartpca for principal components analysis
  ###parameter file: /home/angela/px_yri_chol/QC/QCStep6/QCStep6f/QCStep6f.par
  ###THE INPUT PARAMETERS
  ###PARAMETER NAME: VALUE
  ###genotypename: /home/angela/px_yri_chol/QC/QCStep6/QCStep6e/QCStep6e.ped
  ###snpname: /home/angela/px_yri_chol/QC/QCStep6/QCStep6e/QCStep6e.map
  ###indivname: /home/angela/px_yri_chol/QC/QCStep6/QCStep6e/QCStep6e.fam
  ###evecoutname: /home/angela/px_yri_chol/QC/QCStep6/QCStep6e/QCStep6e.evec
  ###evaloutname: /home/angela/px_yri_chol/QC/QCStep6/QCStep6e/QCStep6e.eval
  ###outliername: /home/angela/px_yri_chol/QC/QCStep6/QCStep6e/QCStep6e.outlier
  ###numoutevec: 10
  ###numoutlieriter: 0
  ###numoutlierevec: 2
  ###outliersigmathresh: 6
  ###number of samples used: 1575 number of snps used: 23953
  ###total number of snps killed in pass: 0  used: 23953
  ###trace:  49558.312
  ### To get Tracy-Widom statistics: recompile smartpca with TWTAB correctly specified in Makefile, or
  ###just run twstats (see README file in POPGEN directory)
  ###kurtosis           snps    indivs
  ###eigenvector    1     2.775     3.905
  ###eigenvector    2     3.428     7.207
  ###eigenvector    3    10.674     8.687
  ###eigenvector    4     4.274   545.917
  ###eigenvector    5     2.942   158.514
  ###eigenvector    6     3.335   107.766
  ###eigenvector    7    10.293     4.199
  ###eigenvector    8     4.252     3.700
  ###eigenvector    9     3.373     5.919
  ###eigenvector   10     3.152     3.870
  ###population:   0              Control 1575
  ###eigbestsnp...

#QCStep6i:
plink --bfile /home/angela/px_yri_chol/QC/QCStep2/QCStep2 --remove /home/angela/px_yri_chol/QC/QCStep5/QCStep5d/related.to.remove.txt --make-bed --out /home/angela/px_yri_chol/QC/QCStep6/QCStep6i/QCStep6i
  ##Create list of people to include in GWAS with the original 1.5m SNPs
  ##Skip this step if you're using GEMMA
  ###1522836 variants loaded from .bim file.
  ###1264 people (446 males, 818 females) loaded from .fam.
  ###--remove: 1189 people remaining.
  ###Total genotyping rate in remaining samples is 0.999246.
  ###1522836 variants and 1189 people pass filters and QC.
  ###--make-bed to /home/angela/px_yri_chol/QC/QCStep6/QCStep6i/QCStep6i.bed + /home/angela/px_yri_chol/QC/QCStep6/QCStep6i/QCStep6i.bim + /home/angela/px_yri_chol/QC/QCStep6/QCStep6i/QCStep6i.fam ... done.

#QCStep6j:
plink --bfile /home/angela/px_yri_chol/QC/QCStep6/QCStep6i/QCStep6i --remove /home/angela/px_yri_chol/QC/QCStep5/QCStep5e/QCStep5e.txt --make-bed --out /home/angela/px_yri_chol/QC/QCStep6/QCStep6j/QCStep6j
  ##B/c Plink doesn't like running with three similar tags
  ###1189 people (408 males, 781 females) loaded from .fam.
  ###--remove: 1184 people remaining.
  ###Total genotyping rate in remaining samples is 0.999244.
  ###1522836 variants and 1184 people pass filters and QC.
  ###--make-bed to /home/angela/px_yri_chol/QC/QCStep6/QCStep6j/QCStep6j.bed + /home/angela/px_yri_chol/QC/QCStep6/QCStep6j/QCStep6j.bim + /home/angela/px_yri_chol/QC/QCStep6/QCStep6j/QCStep6j.fam ... done.

#QCStep6k:
plink --bfile /home/angela/px_yri_chol/QC/QCStep6/QCStep6j/QCStep6j --keep /home/angela/px_yri_chol/QC/QC_Plots/PC_Plots/GWAS_PCA.txt --make-bed --out /home/angela/px_yri_chol/QC/QCStep6/QCStep6k/QCStep6k
  ##1184 people (405 males, 779 females) loaded from .fam.
  ##Keeping individuals within +/- 5 sd of population mean
  ###--keep: 1157 people remaining.
  ###Total genotyping rate in remaining samples is 0.999242.
  ###1522836 variants and 1157 people pass filters and QC.
  ###--make-bed to /home/angela/px_yri_chol/QC/QCStep6/QCStep6k/QCStep6k.bed + /home/angela/px_yri_chol/QC/QCStep6/QCStep6k/QCStep6k.bim + /home/angela/px_yri_chol/QC/QCStep6/QCStep6k/QCStep6k.fam ... done.
  