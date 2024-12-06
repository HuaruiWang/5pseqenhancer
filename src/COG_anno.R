library(dplyr)

args <- commandArgs(trailingOnly = TRUE)

ref_gff <- read.delim(args[1], header=FALSE, comment.char="#")
cog.20.cog <- read.csv(args[2], header=FALSE)
cog.20.def <- read.delim(args[3], header=FALSE)

ref_gff$V9 <- as.character(ref_gff$V9)
gene_id <- sapply(strsplit(ref_gff$V9, ";"), `[`, 1)

gene_id <- sapply(strsplit(gene_id, "-"), `[`, 2)



ref_gff$V10=gene_id
ref_gff_tirm=merge(ref_gff,cog.20.cog,by.x = "V10", by.y = "V3")[,c("V1.x","V2.x","V3","V4.x","V5.x","V6.x","V7.x","V8.x","V9.x","V7.y")]

path=paste0(args[4],"/ref_cog.gff")
ref_gff_tirmed=merge(ref_gff_tirm,cog.20.def,by.x = "V7.y", by.y = "V1")[,c("V1.x","V2.x","V3.x","V4.x","V5.x","V6.x","V7.x","V8.x","V9.x","V2")]
write.table(ref_gff_tirmed,path,quote=F,col.names=F,row.names=F,sep = "\t")
