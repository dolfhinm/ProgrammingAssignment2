## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  f <- NULL
  set <- function(y) {
    x <<- y
    f <<- NULL
  }
  get <- function() x
  setinverse <- function(solve) f <<- solve
  getinverse <- function() f
  list(set = set, get = get, setinverse = setinverse, getinverse = getinverse) 
}

## Write a short comment describing this function

cacheSolve<-function(x,...){
  
  ##  Return a matrix that is the inverse of 'x'
  f <- x$getinverse()
  if(!is.null(f)) {
    message("getting cached data")
    return(f)
  }
    
  m<-x$get()
  f<-solve(m)
  x$setinverse(f)
  f
}

a<-makeCacheMatrix(matrix(1:4,nrow=2,ncol=2))
a$get()
cacheSolve(a)
a$getinverse()
a$set(matrix(c(3,5,7,6),nrow=2,ncol=2))
cacheSolve(a)
a$get()
a$getinverse()
