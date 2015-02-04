corr <- function(directory, threshold = 0) {
	source("consolidateDF.R")	
	source("complete.R")	

	LIST <- list()
	# return DF with station & nobs >= threshold
	STATION <- subset(complete(directory), nobs  >= threshold, select=id)
	if (nrow(STATION) != 0){
		# no station selected will return emply list

		# return DF with only the given STATION id
		MYTABLE <- consolidateDF(directory,STATION$id)

		# group the station and compute the cor accordingly and return the list
		LIST <- lapply(split(MYTABLE, MYTABLE$ID), function(x) cor(x$sulfate, x$nitrate))
	}
	as.numeric(LIST)
}
