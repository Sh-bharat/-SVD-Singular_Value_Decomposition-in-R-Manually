

# Singular Value Decomposition (SVD) in R

## Overview

This R script demonstrates the manual computation of Singular Value Decomposition (SVD) for a given data matrix `A`. SVD is a powerful matrix factorization technique widely used in linear algebra and data analysis.

## Code

```R
# Singular Value Decomposition (SVD) for a data matrix A

# Data matrix A
A <- cbind(c(3, 2), c(2, 3), c(2, -2))

# Compute matrices needed for SVD
matrix1 <- A %*% t(A)
eig <- eigen(matrix1)
singular_val <- eig$values^0.5
singular_val[is.nan(singular_val)] <- 0

# Ensure the diagonal matrix has the correct dimensions
daigonal_matrix <- diag(singular_val)
u <- eig$vectors

matrix2 <- t(A) %*% A
v <- eigen(matrix2)$vectors

dimu <- nrow(u)
dimv <- nrow(v)
mn <- min(dimu, dimv)

# Adjust dimensions to form a square diagonal matrix
while (dimu != dimv) {
  if (nrow(daigonal_matrix) != dimu || ncol(daigonal_matrix) != dimv) {
    daigonal_matrix <- cbind(daigonal_matrix, rep(0, mn))
  }
  if (dimv == min(dimv, dimu)) {
    dimv <- dimv + 1
  } else if (dimu == min(dimv, dimu)) {
    dimu <- dimu + 1
  }
}

# Display the SVD components
print("SVD form:")
print("U matrix:")
print(u)
print("Diagonal matrix:")
print(daigonal_matrix)
print("V transpose:")
print(t(v))

# Display original and reconstructed data
print("Original Data:")
print(A)
print("SVD-Reconstructed Data:")
print(u %*% daigonal_matrix %*% t(v))
```

## Usage

1. Ensure you have R installed.
2. Copy and paste the code into an R script or use an R environment to execute the code.
3. Run the script to perform SVD on the given data matrix `A`.

## Result

The script will display the U matrix, the diagonal matrix, and the transpose of the V matrix, providing a manual SVD decomposition of the input data matrix.

---
