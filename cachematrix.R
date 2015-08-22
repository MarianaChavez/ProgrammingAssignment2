# Create a special matrix first step

@@ -0,0 +1,10 @@
## [Put comments here that describe what your functions do]
## The set function sets the value y to the matrix x in the main function. y is the input here.
## The get is a function that returns the matrix x stored in the main function. Doesn't require any input.
## setmatrix stores the value of the inverse matrix x to m in the main function.
## getmatrix returns the value of the inverse matrix into the main function makeCacheMatrix.
## I store the functions in the function makeCacheMatrix all in the function list(), so that when we assign
## makeCacheMatrix to an object, the object has all the 4 functions.


makeCacheMatrix <- function(x = matrix()) {
	m <-NULL	
	set <- function(y){
		x <<- y
		m <<- NULL
}
get <- function() x 
setmatrix <- function(solve) m <<- solve
getmatrix <- function() m
list(set=set,get=get,setmatrix=setmatrix,getmatrix=getmatrix)
}

## The input of the CacheSolve function is the object where makeCacheMatrix is stored. 
## CacheSolve computes the inverse of a matrix 'x' but checks first if the inverse matrix existe i.e. has already been calculated and is not NULL.
## If it exists in memory, it gets the inverse matrix from the cache and skips the computation.
## Otherwise, it calculates the inverse of the matrix and sets the value m of the inverse matrix in the cache via the setmatrix function

cacheSolve <- function(x, ...) {
m <- x$getmatrix()
if(!is.null(m)){
	message("getting the inverse matrix from cached data")
	return (m)
}
matrixdata <- x$get()
m<-solve(matrixdata,...)
x$setmatrix(m)
m
}
