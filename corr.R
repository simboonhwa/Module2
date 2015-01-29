corr <- function(directory, threshold = 0) {
	source("consolidateDF.R")	
	RESULT <- complete(directory,)
	STATION <- subset(RESULT, nobs >= threshold, select=id)
	MYTABLE <- consolidateDF(directory,STATION$id) 
	LIST <- lapply(split(MYTABLE, MYTABLE$ID), function(x) cor(x$sulfate, x$nitrate))
	as.numeric(LIST)
}
