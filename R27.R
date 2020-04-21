data("tissue_gene_expression")
dim(tissue_gene_expression$x)
library(ggplot2)

pca <- prcomp(tissue_gene_expression$x)
summary(pca)

data.frame(pca$x[,1:2], tissue_type=tissue_gene_expression$y) %>% 
ggplot(aes(PC1,PC2, fill = tissue_type))+
  geom_point(cex=3, pch=21) +
  coord_fixed(ratio = 1)

mn <- rowMeans(tissue_gene_expression$x)

data.frame(pca$x[,1:2], tissue_type=tissue_gene_expression$y) %>% 
  ggplot(aes(mn,PC1, fill = tissue_type))+
  geom_point(cex=3, pch=21) +
  coord_fixed(ratio = 1)

cor(mn,pca$x[,1])


# center values from mean
x <- with(tissue_gene_expression, sweep(x, 1, rowMeans(x)))
pc <- prcomp(x)
data.frame(pc_1 = pc$x[,1], pc_2 = pc$x[,2], 
           tissue = tissue_gene_expression$y) %>%
  ggplot(aes(pc_1, pc_2, color = tissue)) +
  geom_point()


boxplot(pc$x[,7] ~tissue_gene_expression$y)


