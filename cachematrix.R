##creates the special matrix object that can cache its inverse
makeCacheMatrix <- function(x = matrix()) {
  
  ##make a variable for the inverse
  i <- NULL
  
  ##modifier method; changes matrix x
  set <- function(y) {
    x <<- y
    i <<- NULL
  }
  
  ##returns matrix value
  get <- function() x
  
  ##modifier method; changes inverse value
  setinverse <- function(inverse) i <<- inverse
  
  ##returns inverse value
  getinverse <- function() i
  
  ##returns a list of the methods
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


##returns the inverse of x
cacheSolve <- function(x, ...) {
  
  ##give i the inverse matrix
  i <- x$getinverse
  
  ##return the inverse if already set
  if(!is.null(i)){
    message("getting cached data")
    return(i)
  }
  
  ##get the matrix
  data <- x$get()
  
  ##calculate the inverse
  i <- solve(data) %*% data
    
  ##set the inverse matrix to i
  x$setinverse(i)
  
  ##display i
  i
}
