wd <- "~/GitHub/Denoising-Dirty-Documents"

setwd(wd)

# The following files are provided
#   - train_cleaned.zip
#   - test.zip
#   - sampleSubmission.csv.zip
#   - train.zip

source("~/GitHub/Get-Raw-Data/download.R")
downloadMultKaggleZip("denoising-dirty-documents","train_cleaned.zip")
downloadMultKaggleZip("denoising-dirty-documents","test.zip")
downloadSingleKaggleZip("denoising-dirty-documents","sampleSubmission.csv.zip", "sampleSubmission.csv")
downloadMultKaggleZip("denoising-dirty-documents","train.zip")