setwd("/home/bori/Desktop/Coursera/02_R/Ass2/ProgrammingAssignment2")

source("cachematrix.R")

## Test1 - Identity Matrix:
      
id <- (c(1, rep(c(rep(0,4), 1), 3)))
dim(id) <- c(4,4)
print("id = ")
print(id)

sid <- makeCacheMatrix(id)
invId <- cacheSolve(sid)
print("inverse of id: ")
print(invId)


## Test2 – Random 4x4 Matrix:

m <- c(rnorm(16))
dim(m) <- c(4,4)
print("m : ")
print(m)

sm <- makeCacheMatrix(m)
invM <- cacheSolve(sm)
print("inverse of m: ")
print(invM)
