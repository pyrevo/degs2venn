#!/usr/bin/env Rscript

R version 4.0.3 (2020-10-10) -- "Bunny-Wunnies Freak Out"
Copyright (C) 2020 The R Foundation for Statistical Computing
Platform: x86_64-pc-linux-gnu (64-bit)

R is free software and comes with ABSOLUTELY NO WARRANTY.
You are welcome to redistribute it under certain conditions.
Type 'license()' or 'licence()' for distribution details.

  Natural language support but running in an English locale

R is a collaborative project with many contributors.
Type 'contributors()' for more information and
'citation()' on how to cite R or R packages in publications.

Type 'demo()' for some demos, 'help()' for on-line help, or
'help.start()' for an HTML browser interface to help.
Type 'q()' to quit R.

> suppressPackageStartupMessages({
+     library(docopt)
+     library(venn)
+     library(data.table)
+     library(tidyr)
+     library(hash)
+     library(yaml)
+ })

> 
> sessionInfo()
R version 4.0.3 (2020-10-10)
Platform: x86_64-pc-linux-gnu (64-bit)
Running under: Ubuntu 20.04.3 LTS

Matrix products: default
BLAS:   /opt/sw/bioinfo-tools/sources/R-4.0.3/lib/libRblas.so
LAPACK: /opt/sw/bioinfo-tools/sources/R-4.0.3/lib/libRlapack.so

locale:
 [1] LC_CTYPE=en_US.UTF-8       LC_NUMERIC=C              
 [3] LC_TIME=sv_SE.UTF-8        LC_COLLATE=en_US.UTF-8    
 [5] LC_MONETARY=sv_SE.UTF-8    LC_MESSAGES=en_US.UTF-8   
 [7] LC_PAPER=sv_SE.UTF-8       LC_NAME=C                 
 [9] LC_ADDRESS=C               LC_TELEPHONE=C            
[11] LC_MEASUREMENT=sv_SE.UTF-8 LC_IDENTIFICATION=C       

attached base packages:
[1] stats     graphics  grDevices utils     datasets  methods   base     

other attached packages:
[1] yaml_2.2.1        hash_2.2.6.1      tidyr_1.1.3       data.table_1.14.0
[5] venn_1.10         docopt_0.7.1     

loaded via a namespace (and not attached):
 [1] fansi_0.5.0      assertthat_0.2.1 crayon_1.4.1     utf8_1.2.2      
 [5] dplyr_1.0.7      R6_2.5.1         DBI_1.1.1        lifecycle_1.0.0 
 [9] magrittr_2.0.1   pillar_1.6.2     rlang_0.4.11     vctrs_0.3.8     
[13] admisc_0.18      generics_0.1.0   ellipsis_0.3.2   glue_1.4.2      
[17] purrr_0.3.4      compiler_4.0.3   pkgconfig_2.0.3  tidyselect_1.1.1
[21] tibble_3.1.3        

