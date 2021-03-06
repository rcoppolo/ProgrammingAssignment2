## Creates a special "matrix" object that can cache its inverse
makeCacheMatrix <- function(x = matrix()) {
  i <- NULL
  set <- function(y) {
    x <<- y
    i <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) i <<- inverse
  getinverse <- function() i
  list( set = set,
       get = get,
       setinverse = setinverse,
       getinverse = getinverse )
}

## Computes the inverse of the special "matrix" returned by above. If the
## inverse has already been calculated (and the matrix has not changed), then
## retrieves the inverse from the cache.
cacheSolve <- function(x, ...) {
  i = x$getinverse()
  if (!is.null(i)) {
    message("reading from cache")
    return(i)
  }
  mat <- x$get()
  i <- solve(mat, ...)
  message("writing to cache")
  x$setinverse(i)
  i
}

