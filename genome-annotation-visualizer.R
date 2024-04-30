genevisualize <- function(genomealigned, annotationlevel, ids) {
    # Author Gaurav Sablok
    # Universitat Potsdam
    # Date: 2024-4-25
    # Updated: 2024-4-29
    # a gene visualizer for the genome annotation coming from the proteome
    # alignments. You can visualize the specific genes or you can visualize
    # all the annotations at the specific level.
    library(stringr)
    if (annotationlevel == "mRNA") {
    system("cat *.gff | grep -v ^# | grep mRNA > normalizedfilemRNA.txt")
    readfile <- paste(getwd(), "normalizedfilemRNA.txt", sep = "/")
    readids <- read.table(ids, sep = "\t")[2]
    fileinput <- read.table(readfile)
    datainput <- as.data.frame(fileinput)
    idvector <- vector(length=length(fileinput[1]))
    idtype <- vector(length=length(fileinput[1]))
    idstart <- vector(length=length(fileinput[1]))
    idend <- vector(length=length(fileinput[1]))
    idorientation <- vector(length=length(fileinput[1]))
    newids <- vector(length=length(fileinput[1]))
    for (i in seq_along(fileinput[1])){
        idvector <- fileinput[1][i]
    }
     for (i in seq_along(fileinput[1])){
        idtype <- fileinput[2][i]
    }
    for (i in seq_along(fileinput[4])){
         idstart <- fileinput[4][i]
    }
    for (i in seq_along(fileinput[5])){
         idend <- fileinput[5][i]
    }
    for (i in seq_along(fileinput[7])){
        idorientation <- fileinput[7][i]
    }
    for (i in seq_along(readids)){
        newids <- readids[i]
    }
    idtype <- str_replace_all(idtype, "miniprot", "mRNA")    
    data <- cbind(newids, idtype, idstart, idend, idorientation)
    colnames(data)
    colnames(data) <- c("newids", "idtype", "idstart", "idend", "strand")
    data["orientation"] <- data["strand"]
    updatestrand <- as.list(ifelse(data[,"strand"] == "+", "forward"))
    updateorientation <- as.list(ifelse(data[,"strand"] == "+", "1"))
    finaldata <- cbind(data, updatestrand, updateorientation)
    colnames(finaldata) <- c("molecule", "gene", "start", "end", "strand", "orientation", "strand", "orientation")
    return(finaldata[c(1,2,3,4,7,8)])
    }
}
