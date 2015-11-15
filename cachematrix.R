## The following 'makeCachMatrix' function takes a matrix 'm' as an 
## argument. It basicly converges the matrix into a special matrix
## with atributes:      the matrix 'm' itself
##                      the invers of 'm', 'inv'
## and it allows us to easily manipulate these atributes.
##
## So how does this work?
## What we actually get back is a list of 4 functions
##    - set: sets the value of the matrix;
##    - get: gets the value of the matrix;
##    - setInverse: sets the value of the inverse matrix,
##    - getInverse: gets the value of the inverse matrix.

makeCacheMatrix <- function(m = matrix()) {
      inv <- NULL                   ## The inverse matrix 'inv' is set to be NULL, i.e. unknown.
      set <- function(y) {          ## Function returning the value of the matrix.
            m <<- y
            inv <<- NULL            ## In this case, 'inv' is also reset to NULL.
      }
      get <- function() m            ## Function returning the value of the matrix.
      setInverse <- function(inverse) inv <<- inverse        ## Funktion assigning a new value to 'inv'.
      getInverse <- function() inv                          ## Function returning the value of the inverse matrix 'inv'. '
      list(set = set, get = get,    
           setInverse = setInverse,
           getInverse = getInverse)             ## This list is the output of the function.
}


## The following 'cacheSolve' function is defined to calculate the 
## inverse of a matrix. It's input arguments are the following
##    1. a "special matrix" 'm' returned by `makeCacheMatrix` above;
##    2. '...': arguments that are passed to the 'solve' function,
##              that calculates the inverse of a given matrix.
##
## In case the inverse of the input matrix 'm' is already known, its
## value is returned without any further computation.
## Otherwise, the inverse of 'm' is computed using the solve function.

cacheSolve <- function(m, ...) {
      inv <- m$getInverse()                     ## Assigns 'inv' the value of the inverse of the input matrix.
      if(!is.null(inv)) {                       ## In case 'inv' is other than NULL, inv is returned.
            message("getting cached data")      
            return(inv)
      }
      matrix <- m$get()               ## Assigns "matrix" the value of the input matrix.
      inv <- solve(matrix, ...)       ## Calculates the inverse of the input matrix.
      m$setInverse(inv)             ## Assigns to the input matrix its inverse.
      inv                           ## Returns the inverse of the input matrix.
}
