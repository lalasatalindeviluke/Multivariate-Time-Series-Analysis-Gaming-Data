library(forecast)
library(MTS)

data <- read.csv(
  "E:/Master/Time Series/data/horizon_multivariate_final.csv",
  skip = 0, head = T
)
data <- data[1:3183,]
aec <- data[, 1] # diff(data[, 1])
cpc <- data[, 2] # diff(data[, 2])
gec <- data[, 4] # diff(data[, 3])
gp <- data[, 3] # diff(data[, 4])
fps <- data[, 5] # diff(data[, 5])
zt5 <- data.frame(fps, aec, cpc, gec, gp)
MTSplot(zt5)
ccm(zt5)

zt <- data.frame(fps, cpc, gp)
ccm(zt)
fit.cri <- VARorder(zt)
plot(fit.cri$aic, type = "o")
lines(fit.cri$bic, type = "o", pch = 2)
lines(fit.cri$hq, type = "o", pch = 3)

m1 <- VAR(zt, 9) 
#AIC =  11.78797; BIC =  11.94196; HQ  =  11.84318
m1a <- refVAR(m1, thres=1.96) 
#AIC =  11.77922; BIC =  11.86097; HQ  =  11.80853
MTSdiag(m1)


Eccm(zt, maxp = 8, maxq = 8)
m2 <- VARMA(zt, p=6, q=1)
m2a <- refVARMA(m2, thres=1)
# m2a <- refVARMA(m2, thres=1.96)
MTSdiag(m2)
m2_pred <- VARMApred(m2, h=300)



