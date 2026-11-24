# Relative Strength Index (RSI) with Wilder's smoothing
# Usage: rsi(data, period)
# Returns a numeric vector the same length as data.
# Positions that cannot be calculated yet are NA.

rsi <- function(data, period) {
  # Calculate the differences between consecutive data points
  diff_values <- data[-1] - data[-length(data)]

  # Initialize two vectors to store the gains and losses
  gains <- numeric(length(diff_values))
  losses <- numeric(length(diff_values))

  # Calculate gains and losses
  for (i in seq_along(diff_values)) {
    if (diff_values[i] > 0) {
      gains[i] <- diff_values[i]
    } else {
      losses[i] <- abs(diff_values[i])
    }
  }

  # Initialize the RSI vector with NA values
  rsi_values <- rep(NA_real_, length(data))

  # Not enough data to calculate any RSI value
  if (length(diff_values) < period) {
    return(rsi_values)
  }

  # Calculate the average gains and average losses for the first 'period' points
  avg_gain <- sum(gains[1:period]) / period
  avg_loss <- sum(losses[1:period]) / period

  # Calculate RSI values using the Wilder's smoothing method
  for (i in (period + 1):length(data)) {
    avg_gain <- (avg_gain * (period - 1) + gains[i - 1]) / period
    avg_loss <- (avg_loss * (period - 1) + losses[i - 1]) / period

    if (avg_loss == 0) {
      rsi_values[i] <- 100            # no losses at all: maximum strength
    } else {
      rs <- avg_gain / avg_loss
      rsi_values[i] <- 100 - (100 / (1 + rs))
    }
  }

  return(rsi_values)
}
