####################################################################################################################
######################## script to extract mutational signatures from input VCF #######################################################
## based on MutSignature package: https://cran.r-project.org/web/packages/mutSignatures/vignettes/get_sarted_with_mutSignatures.html ##
#######################################################################################################################################
library(dplyr)
library(reshape2)
library(kableExtra)
library(ggplot2)
library(gridExtra)
library(BSgenome.Hsapiens.UCSC.hg38)
# Load mutSignatures
library(mutSignatures)

# prep hg19
hg19 <- BSgenome.Hsapiens.UCSC.hg19

# load data
data("mutSigData")