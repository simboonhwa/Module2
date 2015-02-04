# comment either line 9 or 10 accordingly to Unix or window environemnt 
consolidateDF <- function(dir, id = 1:332) {
	FILELIST <- list()  # create empty list

	for (MYID in id){
		#convert into 3 integer numeric
		THREECHAR <- sprintf("%03d",MYID)

		MYFILE <- paste(".\\",dir,"\\",THREECHAR,".csv",sep="") #window
	#	MYFILE <- paste(".//",dir,"//",THREECHAR,".csv",sep="") #linux
		FILELIST <- c(FILELIST,MYFILE)
	}	
        
	# extract the relevant file into data frame within a list
        MYTABLELIST <- lapply(FILELIST, read.csv, header=TRUE)

        # convert LIST to table
        MYTABLE <- do.call("rbind", MYTABLELIST)

	# return data frame with only complete valid row
 	MYTABLE[complete.cases(MYTABLE),]

}
