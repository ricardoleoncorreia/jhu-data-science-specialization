## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

## Returns a list that contains four cache methods (it returns a cache instance):
## set: stores matrix in original matrix variable "x" and resets inverse matrix position
## get: returns matrix in original matrix variable "x"
## setInverse: stores matrix in inverse matrix variable "inv"
## getInverse: return matrix in inverse matrix variable "inv"

makeCacheMatrix <- function(x = matrix()) {
    inv <- NULL
    set <- function(y) {
        x <<- y
        inv <<- NULL
    }
    get <- function() x
    setInverse <- function(inverse) inv <<- inverse
    getInverse <- function() inv
    list(set = set, get = get,
         setInverse = setInverse,
         getInverse = getInverse)
}


## Write a short comment describing this function

## It receives the cache instance created with previous function
## If there is an inverse stored in cache, it generates diagnostic
## message and returns the inverse stored.
## Otherwise, it gets the original matrix
## from cache, calculate its inverse,
## store the result in cache and return
## the inverse matrix

cacheSolve <- function(x, ...) {
    inv <- x$getInverse()
    if(!is.null(inv)) {
        message("getting cached data")
        return(inv)
    }
    data <- x$get()
    inv <- solve(data, ...)
    x$setInverse(inv)
    inv
}
