pollutantmean <- function(directory=specdata, pollutant=sulfate, id = 1) {
	FILELIST <- list()  # create empty list
	for (MYID in id){
		#convert into 3 integer numeric
		THREECHAR <- sprintf("%03d",MYID)

		MYFILE <- paste(".\\",directory,"\\",THREECHAR,".csv",sep="")
		FILELIST <- c(FILELIST,MYFILE)
	}


	# extract the relevant file into data frame within a list
 	MYTABLELIST <- lapply(FILELIST, read.csv, header=TRUE)

	# convert to table
	MYTABLE <- do.call("rbind", MYTABLELIST)

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

}
