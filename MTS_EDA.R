library(MTS)
horizon <- as.matrix(read.csv("E:/Master/Time Series/data/horizon_diff_multivariate_final.csv",
                              encoding="UTF-8"))
horizon_train <- horizon[1:2892, ]
horizon_test <- horizon[2893:3192, ]

MTSplot(horizon)
ccm(horizon, lags=10)

varma30 <- VARMA(horizon_train, p=3, q=0) # aic=11.6799, bic=11.74183
varma21 <- VARMA(horizon_train, p=2, q=1) # *aic=11.47698, *bic=11.53891
varma12 <- VARMA(horizon_train, p=1, q=2) # aic=11.51741, bic=11.57934
varma03 <- VARMA(horizon_train, p=0, q=3) # aic=11.4847, bic=11.54663

varma21_irf <- VARMAirf(Phi = varma21$Phi,
                        Theta = varma21$Theta,
                        Sigma = varma21$Sigma,
                        lag=10, orth = FALSE)

mq(horizon[,c(1,5)], lag = 24)
mq(horizon[,c(2,5)], lag = 24)
mq(horizon[,c(3,5)], lag = 24)
mq(horizon[,c(4,5)], lag = 24)
