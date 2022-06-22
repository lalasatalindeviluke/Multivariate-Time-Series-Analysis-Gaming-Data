library(TSA)

gnp = as.matrix(
    read.csv(
      "E:/Master/Time Series/data/GNP.csv",
      header=1,
      sep=","
    )
  )

gnpgr = diff(log(gnp)) # growth rate
ts.plot(gnpgr)
acf(gnpgr, 24)
pacf(gnpgr, 24)

fit_model <- arima(gnpgr, order=c(0,0,5))
ts.plot(fit_model$residuals)
fit_model_res = fit_model$residuals

rstandard(fit_model)
ts.plot(rstandard(fit_model), ylab="", main="standardized residuals")

acf(fit_model_res)
pacf(fit_model_res)

Box.test(fit_model_res, lag=3, type="Ljung-Box")

B_text_p_value = c(0,0)
for(hh in 3:20){
  B_text_p_value[hh] = Box.test(fit_model_res, lag=hh, type="Ljung-Box")$p.value
}
plot(3:20, B_text_p_value[3:20], type="p", 
     main="p values for Ljung-Box statistic", 
     xlab="lag", ylab="p value", ylim=c(0,1))
abline(h=0.05, lty=2, col=4)


