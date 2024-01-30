## SVD (Singular Value Decomposition)
# Let A b the data Matrix
A<-cbind(c(3,2),c(2,3),c(2,-2))
m<-nrow(A)
n<-ncol(A)

matrix1<-A%*%t(A)
matrix1
eig<-eigen(matrix1)
singular_val<-eig$values^0.5
singular_val[is.nan(singular_val)]=0
singular_val

daigonal_matrix<-diag(singular_val)
u<-eig$vectors

matrix2<-t(A)%*%A
matrix2
v<-eigen(matrix2)$vectors


dimu<-nrow(u)
dimv<-nrow(v)
mn<-min(dimu,dimv)

while(dimu!=dimv){
  if(nrow(daigonal_matrix) != dimu || ncol(daigonal_matrix)!=dimv)
  {daigonal_matrix<-cbind(daigonal_matrix,rep(0,mn))}
  if(dimv==min(dimv,dimu))
  {dimv<-dimv+1}
  else if(dimu==min(dimv,dimu))
  {dimu<-dimu+1}
}
print(" so SVD form is given by : ")
print("U matrix = ")
print(u)
print("diagonal matrix = ")
print(daigonal_matrix)
print("V transpose = ")
print(t(v))




print("Original Data :- ")
print(A)

print("SVD Data :- ")
print(u%*%daigonal_matrix%*%t(v))

      