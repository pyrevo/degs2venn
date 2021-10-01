#!/usr/bin/env Rscript

'degs2venn prints out Venn diagram from 2 or more tables of DEGs.

Usage:
  degs2venn.R (affy | edgeR) <id> <csv> <out> [--pval=<n>, --logFC=<n>]
  degs2venn.R (-h | --help)
  degs2venn.R (-v | --version)

Options:
  -h --help         Show this screen.
  -v --version      Show version.
  -p --pval=<n>     Max cut-off value on pval [default: 0.05].
  -f --logFC=<n>    Min cut-off value on logFC [default: 2].
' -> doc

# Load the libraries
suppressPackageStartupMessages({
    library(docopt)
    library(venn)
    library(data.table)
    library(tidyr)
    library(hash)
    library(yaml)
})

args <- docopt(doc, version = 'degs2venn 0.1.0\n')
print(args)
source("fun.R")

# Input/Output checks
info <- test_input(args$csv)
out <- file.path(args$out, args$id)
test_output(out)
#print(info)

# Actual workflow
if (args$affy == TRUE) {
    write("Running with the AffyMetrix TAC v4 file format!", stdout())
    #lapply(info$path, freadd, comp=info$comparison)
    x <- dtlist(ffreadd, info)
    l <- mapply(upsidedown, x)
    m <- as.matrix(l)
    rownames(m) <- c("UP", "DOWN")
    write.table(t(m), file=file.path(out, "UpDown_counts.csv"), row.names=T, col.names=T, sep='\t', quote=F)
    print(t(m))
    d <- genelist(x, info$comparison)
    #print(keys(d))
    v <- as.list(d)
    plotVenn(v, "Venn_UpDown.pdf")
    printGenes(v, "Venn_UpDown.csv")
    # do UP
    up <- uplist(x, info$comparison)
    up <- as.list(up)
    plotVenn(up, "Venn_Up.pdf")
    printGenes(up, "Venn_Up.csv")
    # do DOWN
    down <- downlist(x, info$comparison)
    down <- as.list(down)
    plotVenn(down, "Venn_Down.pdf")
    printGenes(down, "Venn_Down.csv")

} else if (args$edgeR == TRUE) {
    write("The edgeR file format is not supported yet!", stdout())
}
