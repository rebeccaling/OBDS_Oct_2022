#Read in bedfile

bedfile<-read.table('/project/obds/shared/resources/2_r/baseR/coding_gene_region.bed', header=F,sep='\t')
#dimensions of bedfile
dim(bedfile)

#class of bedfile
class(bedfile)
#number of rows
nrow(bedfile)
#add colnames
colnames(bedfile)<-c('chr','start','stop','name','score','strand')

#ways to view colnames
head(bedfile)
colnames(bedfile)
names(bedfile)

bedfile[30,3]

head(bedfile)

Secondndcol <- bedfile$start
Secondcolb <- bedfile[,2]


bedfile$int_length <- bedfile$stop-bedfile$start

colnames(bedfile)

#colnames(bedfile$in_length) <-colnames(bedfile$int_length) 
#colnames(bedfile)<-c('chr','start','stop','name','score','strand','int_length')
#head(bedfile)

#subset only int_length 100-200K

bed_subset <- bedfile[bedfile$int_length >= 100001 & bedfile$int_length <= 200000,]


write.table(bed_subset,'bed_subst.text',sep='\t',quote=FALSE, row.names = FALSE)
