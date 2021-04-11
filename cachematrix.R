

## makeCacheMtarix function creates a special "matrix" object that can 
## cache its inverse.

makeCacheMatrix <- function(x = matrix()) {

  inv<-NULL
  set<- function(y){
    x<<-y
    inv<<-NULL
  }
  get<-function(){x}
  setInverse <- function(inverse){inv<<-inverse}
  getInverse <-function(){inv}
  list(set =set, get= get, setInverse = setInverse, getInverse = getInverse)

}



#This function computes the inverse of the special "matrix" returned by 
#makeCacheMatrix above. 


cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  
  inv<- x$getInverse()
  if(!is.null(inv)){
    message("Retrieving cached data")
    return(inv)
  }
  mat <-x$get()
  inv <-solv(mat, ...)
  x$setInverse(inv)
  inv
}
hilbert<- function(n){
  j<- 1:n
  1/outer(j-1,j,"+")
  
}
