source('cachematrix.R') ## Import cache functions


cache <- makeCacheMatrix() ## Create empty cache
print(cache$get()) ## Check it returns default matrix
print(cache$getInverse()) ## When first created, there is no inverse


sample = 2 * diag(3) ## Diagonal 3x3 matrix
cache$set(sample) ## Set new matrix in cache
print(cache$get()) ## Check it returns the new matrix
print(cache$getInverse()) ## There is no inverse while is the first time it is set


sampleInverse <- cacheSolve(cache) ## Find inverse matrix in cache
print(sampleInverse) ## Print inverse
print(cache$getInverse()) ## Inverse was stored


newSample = 5 * diag(2) ## Diagonal 2x2 matrix
cache$set(newSample) ## Set new sample in cache
print(cache$get()) ## Check it returns the new sample
print(cache$getInverse()) ## There is no inverse after set is called


newSampleInverse <- cacheSolve(cache) ## Find new inverse matrix in cache
print(newSampleInverse) ## Print inverse
print(cache$getInverse()) ## Inverse was stored
