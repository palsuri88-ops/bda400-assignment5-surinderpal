# Stochastic RSI (StochRSI)
# Usage: stoch_rsi(data, period, k_period, d_period)
# Returns a list with k_line (%K) and d_line (%D)
# Depends on rsi() from rsi.R and sma() from sma.R

if (!exists("rsi")) source("rsi.R")
if (!exists("sma")) source("sma.R")

stoch_rsi <- function(data, period, k_period, d_period) {
  # Calculate the RSI
  rsi_values <- rsi(data, period)

  # Calculate the StochRSI (normalise RSI between 0 and 1)
  valid_rsi <- rsi_values[!is.na(rsi_values)]
  if (length(valid_rsi) == 0) {
    k_values <- rep(NA_real_, length(rsi_values))     # not enough data for RSI
  } else {
    min_rsi <- min(valid_rsi)
    max_rsi <- max(valid_rsi)
    if (max_rsi == min_rsi) {
      k_values <- ifelse(is.na(rsi_values), NA_real_, 0)  # flat RSI, avoid 0/0
    } else {
      k_values <- (rsi_values - min_rsi) / (max_rsi - min_rsi)
    }
  }

  # Calculate the %K line (StochRSI)
  k_line <- sma(k_values, k_period)

  # Calculate the %D line (3-day simple moving average of %K)
  d_line <- sma(k_line, d_period)

  # Return the %K and %D lines as a list
  result <- list(
    k_line = k_line,
    d_line = d_line
  )

  return(result)
}
