complete <- function(directory, id = 1:332) {

	source("consolidateDF.R")
	MYTABLE <- consolidateDF(directory,id)
	# return row with df wo NA
	MYTABLE <- MYTABLE[complete.cases(MYTABLE),]
	
	#return DF based on 
	RESULT <- aggregate(MYTABLE$ID, list(id=MYTABLE$ID), length)

	# re-order the output based on the input (id)
	ORESULT <- RESULT[match(id,RESULT$id),]

	#rename the row & column accordingly
	colnames(ORESULT) <- c("id","nobs")
	rownames(ORESULT) <- c(1:nrow(ORESULT))
	ORESULT
}
