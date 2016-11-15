library(MASS)

setwd("~/Desktop/Statistical_Modelling_Inference/Ex_8_3")

d1 <-read.table("synthetic_regression.txt", nrows = 300)
data <- d1[,1:31]

set.seed(75)
nu <- 10
eta <- rgamma(300, nu/2,nu/2 -1)
phi <- as.matrix(data[,2:31])
w <- ginv(t(phi) %*% diag(eta) %*% phi) %*% (t(phi) %*% diag(eta) %*% data$t)
q <- (1/300 * (data$t - phi %*% w))


