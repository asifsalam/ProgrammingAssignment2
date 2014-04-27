## some code to test the cachematrix functions
r <- 5
c <- 5

m1 <- matrix(rnorm((r*c),mean=30,sd=15),nrow=r,ncol=c)
cm <- makeCacheMatrix(m1)
cm$getMatrix() #print out the stored matrix
cm$getInverse() #get the inverse, should be NULL
cacheSolve(cm) #get the inverse, needs to be calculated and stored
cacheSolve(cm) #this time, it should be retreived from the cache

m2 <- matrix(5:8, 2, 2) # a new matrix
cm$setMatrix(m2) # change the object matrix.  Should reset the inverse to NULL
cm$getInverse()
