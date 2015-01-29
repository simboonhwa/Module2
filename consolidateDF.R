consolidateDF <- function(dir, id = 1:332) {
	FILELIST <- list()  # create empty list
	for (MYID in id){
		#convert into 3 integer numeric
		THREECHAR <- sprintf("%03d",MYID)

	#	MYFILE <- paste(".\\",dir,"\\",THREECHAR,".csv",sep="") #wind
		MYFILE <- paste(".//",dir,"//",THREECHAR,".csv",sep="") #linux
		FILELIST <- c(FILELIST,MYFILE)
	}	
        # extract the relevant file into data frame within a list
        MYTABLELIST <- lapply(FILELIST, read.csv, header=TRUE)

        # convert to table
        MYTABLE <- do.call("rbind", MYTABLELIST)

 	MYTABLE[complete.cases(MYTABLE),]

}
