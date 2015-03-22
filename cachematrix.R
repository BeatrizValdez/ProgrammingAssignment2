## Put comments here that give an overall description of what your
## functions do
#The following functions cache the inverse of a matrix  to avoid the time consuming process of  computing it repeatedly.

## MakeCacheMatrix creates a special "matrix" object that can cache its inverse





makeCacheMatrix <- function(x = matrix()) {
	m <- NULL # initializes the values of 'm' to NULL, setting its default value
	# seting the values of the matrix
	set <- function(y) {
		x <<- y # the values of the matrix are cached in the global environment
		m <<- NULL
    }
	
    get <- function() x # captures all the values of x
	
	# this should invert the matrix, storing it in 'm' in the global environment:
	setinversion <- function(inversion) m <<- inversion 
	
	# extracts the invert matrix from m, and creates then a list with the functions created 
    getinversion <- function() m  
    list(set = set, get = get,
        setinversion = setinversion,
        getinversion = getinversion)
}

}


## cacheSolve computes the inverse of the special "matrix" returned by makeCacheMatrix above. 
## If the inverse has already been calculated (and the matrix has not changed), 
## then the cachesolve should retrieve the inverse from the cache

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
		x <- x$getinversion() # if the inverse of the matrix exist, use it and send a msg to notify this action
		if (!is.null(inv_x)) {
			message("getting cached inverse matrix")
			return(x)
	# but if 'inversion' doen't exist, calculate it		
    } else {
        x <- solve(x$get())
        x$setinversion(x)
        return(x)
    }
}
