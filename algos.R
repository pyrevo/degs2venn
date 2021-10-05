#!/usr/bin/env Rscript

doAffy <- function(info, path, args) {
    #lapply(info$path, freadd, comp=info$comparison)
    x <- dtlist(ffreadd, info)
    l <- mapply(upsidedown, x)
    m <- as.matrix(l)
    rownames(m) <- c("UP", "DOWN")
    print(t(m))
    write.table(t(m), file=file.path(out, "UpDown_counts.csv"), row.names=T, col.names=T, sep='\t', quote=F)
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
}
