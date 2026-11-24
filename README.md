# BDA400 Assignment 5 – Technical Analysis using R (Development Phase)

Surinder Pal

Nine technical indicators written in base R (no packages), one file each:
sma.R, ema.R, macd.R, stdev.R, linreg.R, rsi.R, stoch_rsi.R, crossover.R, crossunder.R

## How to run
1. Open this folder in RStudio and set it as the working directory.
2. Run `source("run_all.R")` to load every function and print results for the assignment's sample data.
   From a terminal: `Rscript run_all.R`
3. To use one indicator alone: `source("sma.R"); sma(c(10, 12, 15), period = 2)`

macd.R loads ema.R, and stoch_rsi.R loads rsi.R and sma.R automatically.
