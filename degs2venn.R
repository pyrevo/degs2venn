#!/usr/bin/env Rscript

'degs2venn prints out Venn diagram from 2 or more tables of DEGs.

Usage:
  degs2venn.R (affy | edgeR) <id> <csv> <out> [--FDR=<n>, --logFC=<n>, --pval]
  degs2venn.R (-h | --help)
  degs2venn.R (-v | --version)

Options:
  -h --help         Show this screen.
  -v --version      Show version.
  -a --FDR=<n>      Max cut-off value on FDR (adj. pval) [default: 0.05].
  -f --logFC=<n>    Min cut-off value on logFC [default: 2].
  -p --pval         Use pval instead of FDR [default: FALSE].
' -> doc

# Load the libraries
suppressPackageStartupMessages({
    library(docopt)
    library(venn)
    library(data.table)
    library(stringr)
    library(tidyr)
    library(hash)
    library(yaml)
})

args <- docopt(doc, version = 'degs2venn 0.1.0\n')
print(args)
source("fun.R")
source("algos.R")

# Input/Output checks
info <- test_input(args$csv)
out <- file.path(args$out, args$id)
test_output(out)
#print(info)

# Actual workflow
if (args$affy == TRUE) {
    write("Running with the AffyMetrix TAC v4 file format!", stdout())
    #if (args$pval == FALSE) {
    #    rpval <- "FDR P-val"
    #} else if (args$pval == TRUE) {
    #    rpval <- "P-val"
    #}
    #print(rpval)
    doAffy(info, path, args)
} else if (args$edgeR == TRUE) {
    write("The edgeR file format is not supported yet!", stdout())
}
