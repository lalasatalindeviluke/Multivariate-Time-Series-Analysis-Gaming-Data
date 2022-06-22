library(forecast)
horizon <- as.matrix(read.csv("E:/Master/Time Series/data/horizon_final.csv",
                     encoding="UTF-8"))[,12]
fit114 <- arima(horizon, order=c(1,1,4)) #aic=23565
fit411 <- arima(horizon, order=c(4,1,1))
fit211 <- arima(horizon, order=c(2,1,1)) # aic=23583

auto.arima(horizon, d=1, start.p = 1, start.q = 1,
           max.p = 5, max.q = 5, trace=TRUE)
