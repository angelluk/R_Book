library(dslabs)
data("tissue_gene_expression")

dim(tissue_gene_expression$x)

table(tissue_gene_expression$y)

d <- dist(tissue_gene_expression$x)

class(d)

as.matrix(d)[1:2,1:2]

as.matrix(d)[39:40,39:40]

as.matrix(d)[73:74,73:74]

image(as.matrix(d))