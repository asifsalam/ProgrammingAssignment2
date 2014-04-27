## Overall description
## The two functions in the file work together
## to cache the inverse of a matrix in order to 
## save computation time when the inverse is required
## again.  The "makeCacheMatrix" creates the special enhanced
## matrix object with the functions necessary to store 
## and retrive the matrix and it's inverse.
## 
## The "cacheSolve" function uses the enhanced matrix object
## to retrieve the matrix and it's inverse if it exists, or
## calculate and store it in the enhanced matrix object

## Short description - 
## This function creates a special enhanced matrix that can
## store it's inverse.  It has four get/set funcitons
## set: sets the the base matrix in the object
## get: gets the matrix that is stored
## setinv: stores the calculated inverse of th matrix
## getinv: get the stored inverse of the matrix
makeCacheMatrix <- function(x = matrix()) {
        #First time around, set the inverse to NULL
        inv <- NULL
        setMatrix <- function(y) { # the set function
          #store the new matrix in the enhanced matrix
          x <<- y
          # since this is a new matrix, the inverse has not been calculated
          # set it to NULL.  Takes care of the matrix change requirement as well
          # since another matrix will reset the inverse
          inv <<- NULL
        }
        # retrive the stored matrix
        getMatrix <- function() x
        # store the inverse
        setInverse <- function(inv_mtrx) inv <<- inv_mtrx
        # retrieve the stored inverse
        getInverse <- function() inv
        list(setMatrix = setMatrix, getMatrix = getMatrix,
              setInverse = setInverse,
              getInverse = getInverse)
}

## Short Description:
## This function uses the enhanced matrix object to
## either retrieve an already calculated inverse
## of the stored matrix or, if that is not available, 
## to calculate the inverse and store it in the enhanced
## matrix object
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        # if the inverse exists, skip the calculation
        # and return the inverse
        inv <- x$getInverse()
        if(!is.null(inv)) {
                message("Retreiving the cached inverse of the matrix...")
                return(inv)
        }
        # if the inverse doesn't exist, calculate it
        # retrieve the matrix from the matrix object
        data <- x$getMatrix()
  
        # calculate the inverse
        inv <- solve(data,...)

        # store the inverse in the matrix object
        x$setInverse(inv)
        message("The calculated inverse of the matrix ...")
        inv
}