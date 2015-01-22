pollutantmean <- function(directory=specdata, pollutant=sulfate, id = 1) {
	FILELIST <- list()
	for (MYID in id){
		MYFILE <- paste(".\\specdata\\",MYID,".csv",sep="")
	#	MYFILE <- paste(".\\",directory,"\\",MYID,".csv",sep="")
		FILELIST <- c(FILELIST,MYFILE)
	}

 	MYTABLELIST <- lapply(FILELIST, read.csv, header=TRUE)
	MYTABLE <- data.frame(MYTABLELIST, row.names=TRUE) #convert to table
	#as.data.frame(TABLE) #TABLE = read.csv(".\\specdata\\100.csv",header=TRUE)
	browser()
	MYMEAN <- mean(MYTABLE[[pollutant]], na.rm=TRUE)
	#MYMEAN <- mean(MYTABLE$sulfate, na.rm=TRUE)
	MYMEAN
	#MYFILE <- file(./directory/MYID.csv, "r")
		#data <- read.csv(./direcotry/MYFILE, header=TRUE,sep=",")
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files

        ## 'pollutant' is a character vector of length 1 indicating
        ## the name of the pollutant for which we will calculate the
        ## mean; either "sulfate" or "nitrate".

        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used

        ## Return the mean of the pollutant across all monitors list
        ## in the 'id' vector (ignoring NA values)
}