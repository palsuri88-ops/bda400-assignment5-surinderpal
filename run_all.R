# Runs every indicator on the sample data from the assignment.
# From R or RStudio: setwd() to this folder, then source("run_all.R")
# From a terminal:   Rscript run_all.R

source("sma.R")
source("ema.R")
source("macd.R")
source("stdev.R")
source("linreg.R")
source("rsi.R")
source("stoch_rsi.R")
source("crossover.R")
source("crossunder.R")

data <- c(10, 12, 15, 20, 18, 22, 25, 24, 21)

cat("SMA (period 3):\n");  print(sma(data, period = 3))
cat("\nEMA (period 3):\n"); print(ema(data, period = 3))

cat("\nMACD (3, 5, 2):\n")
print(macd(c(100, 105, 110, 115, 120, 125, 130), short_period = 3, long_period = 5, signal_period = 2))

cat("\nStandard deviation:\n"); print(stdev(data))

cat("\nLinear regression (length 5, offset 0):\n")
print(linreg(data, regressionLength = 5, regressionOffset = 0))

rsi_data <- c(45, 50, 48, 55, 52, 49, 58, 60, 65, 62)
cat("\nRSI (period 5):\n"); print(rsi(rsi_data, period = 5))

cat("\nStochastic RSI (period 14, k 3, d 3) - all NA because 10 points < 14:\n")
print(stoch_rsi(rsi_data, period = 14, k_period = 3, d_period = 3))
cat("\nStochastic RSI (period 3, k 3, d 3):\n")
print(stoch_rsi(rsi_data, period = 3, k_period = 3, d_period = 3))

arr1 <- c(10, 12, 15, 20, 18, 22, 25, 24, 21)
arr2 <- c(18, 20, 22, 18, 15, 12, 10, 11, 13)
cat("\nCrossover:\n");  print(crossover(arr1, arr2))
cat("\nCrossunder:\n"); print(crossunder(arr1, arr2))
