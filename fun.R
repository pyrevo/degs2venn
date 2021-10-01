#!/usr/bin/env Rscript

test_input <- function(csv) {
    if (file.exists(csv)) {
    fread(csv, header=F, col.names=c("comparison","path"))
    } else {
    stop(sprintf("File %s does not exists!", csv), call.=FALSE)
    }
}


test_output <- function(out) {
    if (dir.exists(out)) {
    write("Output directory already exists!", stdout())
    } else {
    dir.create(out, recursive=TRUE)
    }
}


#---------------------#
# degs2venn Functions #
#---------------------#
ffreadd <- function(info, path) {
    dt <- fread(file=path, header=T, skip=4, dec=",", sep="\t")
    dt <- dt[dt$"P-val" <= as.numeric(args$pval) ,]
    dt <- dt[dt$"Fold Change" >= as.numeric(args$logFC) | dt$"Fold Change" <= as.numeric(args$logFC) ,]
    dt[, ("Comparison"):=info]
    return(dt)
}

dtlist <- function(fun, info) {
    v <- mapply(FUN=fun, info$comp, info$path, SIMPLIFY = FALSE)
    #return(v)
}

upsidedown <- function(dt) {
    up <- dt[dt$"Fold Change" >= as.numeric(args$logFC) ,]
    down <- dt[dt$"Fold Change" <= as.numeric(args$logFC) ,]
    l <- list(nrow(up), nrow(down))
    #sprintf("%s has UP:%s and DOWN:%s", unique(dt$Comparison), nrow(up), nrow(down))
}

genelist <- function(x, comp) {
    d <- hash()
    for (i in comp){
        #print(i)
        v <- x[[i]]$"Gene Symbol"
        #print(v)
        d[[i]] <- v
    }
    return(d)
}

uplist <- function(x, comp) {
    d <- hash()
    for (i in comp){
        dt <- x[[i]]
        dt <- dt[dt$"Fold Change" >=  as.numeric(args$logFC) ,]
        v <- dt$"Gene Symbol"
        d[[i]] <- v
    }
    return(d)
}

downlist <- function(x, comp) {
    d <- hash()
    for (i in comp){
        dt <- x[[i]]
        dt <- dt[dt$"Fold Change" <=  as.numeric(args$logFC) ,]
        v <- dt$"Gene Symbol"
        d[[i]] <- v
    }
    return(d)
}

plotVenn <- function(l, name) {
    pdf(file=file.path(out, name), height=8, width=8)
    print(venn(l, zcolor="style", opacity = 0.2))
    invisible(dev.off())
}

printGenes <- function(l, name) {
    o <- venn(l, show.plot=FALSE)
    i <- attr(o, "intersections")
    yaml::write_yaml(i, file.path(out, name))
    #lapply(intersections, function(x) write.table( data.frame(x), './results/test.csv'  , append= T, sep=',' ))
    #capture.output(str(intersections), file = "./results/test.csv")
}


funzione <- function(l) {
    print(l$"Gene Symbol")
}