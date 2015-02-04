complete <- function(directory, id = 1:332) {

	source("consolidateDF.R")
	MYTABLE <- consolidateDF(directory,id)

	#return DF based on 
	RESULT <- aggregate(MYTABLE$ID, list(id=MYTABLE$ID), length)

	# re-order the output based on the input (id)
	ORESULT <- RESULT[match(RESULT$id,id),]

	#rename the row & column accordingly
	colnames(RESULT) <- c("id","nobs")
	rownames(ORESULT) <- c(1:nrow(ORESULT))
	ORESULT
}
