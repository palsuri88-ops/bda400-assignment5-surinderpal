# Simple Moving Average (SMA)
# Usage: sma(data, period)
#   data   - numeric vector
#   period - number of data points in each window
# Returns a numeric vector of length (length(data) - period + 1)

sma <- function(data, period) {
  # Check if the length of data is less than the specified period
  if (length(data) < period) {
    stop("Data length should be greater than or equal to the period")
  }

  # Initialize a vector to store the SMA values
  n_values <- length(data) - period + 1
  sma_values <- numeric(n_values)

  # Calculate SMA for each window of 'period' data points
  for (i in 1:n_values) {
    current_window <- data[i:(i + period - 1)]
    sma_values[i] <- sum(current_window) / period
  }

  return(sma_values)
}
