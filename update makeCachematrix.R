## The following code will create two functions; 
## First is the makeCacheMatrix fucntion, which creates a special "matrix", which is really a 
## list containing a function to:
## set the value of the matrix
## get the value of the matrix
## set the value of the inverse
## get the value of the inverse
makeCAcheMatrix <- function (x=matrix() ){
  inv <- NULL
  set <- function (y) { 
    x <<-y
    inv <<- NULL
  }
  get <- function() {x}
  setInverse <- function(inverse) { inv <<- inverse}
  getInverse <- function() {inv}
  list(set= set, get= get, setInverse= setInverse, getInverse=getInverse)
}

## Secondly, the cacheSolve fuction will get the inverse of the matrix created above.
## First, it returns the inverse of the matrix if it has already been computed from the cache, 
## otherwise, the inverse is computed, cached using the setinverse function, and returned.

casheSolve <- function (x, ...){
  inv <- x$getInverse()
  if(!is.null(inv)){
    message("getting cached dat")
    return(inv)
  }
  mat <- x$get()
  inv <- solve (mat, ...)
  x$setInverse(inv)
  inv
}

