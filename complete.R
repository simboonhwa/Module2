complete <- function(directory, id = 1:332) {
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
	
	table(MYTABLE$
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files

        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        
        ## Return a data frame of the form:
        ## id nobs
        ## 1  117
        ## 2  1041
        ## ...
        ## where 'id' is the monitor ID number and 'nobs' is the
        ## number of complete cases
}
