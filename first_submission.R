library('png')
library('data.table')
library('reshape')

#install.packages("reshape")
#install.packages("png")

wd <- "~/GitHub/Denoising-Dirty-Documents"
setwd(wd)

cleanFiles=list.files("~/GitHub/Denoising-Dirty-Documents/test", pattern="*.png")

# gather an ordered set of input filenames
Numfiles=setdiff(unlist(strsplit(cleanFiles, "[.]")),"png")
Numfiles=sort(as.integer(Numfiles))

# let's read the first image as a matrix
Numfile=Numfiles[1]
img <- readPNG(print(paste0(wd, "/test/",Numfile,".png")))

# convert the image to a more manageable dataframe
img.dt=data.table(melt(img))
names.dt<-names(img.dt)
setnames(img.dt,names.dt[1],"X1")
setnames(img.dt,names.dt[2],"X2")
img.dt[,id:=paste(Numfile,X1,X2,sep="_")]
write.table(img.dt[,c("id","value"),with=FALSE], file = "bz_submission.csv", sep = ",", col.names = TRUE,row.names = FALSE,quote = FALSE)

Numfiles=setdiff(Numfiles,Numfile)
for (Numfile in Numfiles) {
        img <- readPNG(print(paste0(wd,"/test/",Numfile,".png")))
        img.dt=data.table(melt(img))
        names.dt<-names(img.dt)
        setnames(img.dt,names.dt[1],"X1")
        setnames(img.dt,names.dt[2],"X2")
        img.dt[,id:=paste(Numfile,X1,X2,sep="_")]
        write.table(img.dt[,c("id","value"),with=FALSE], file = "bz_submission.csv", append = TRUE,sep = ",", col.names = FALSE,row.names = FALSE,quote = FALSE)
        
}