# Crossunder
# Usage: crossunder(arr1, arr2)
# Returns a character vector: "True" where arr1 crosses below arr2,
# otherwise "False" (the first position is "None", as in the pseudocode)

crossunder <- function(arr1, arr2) {
  # Check if the length of both arrays is the same
  if (length(arr1) != length(arr2)) {
    stop("Both arrays should have the same length")
  }

  # Initialize a vector to store the crossunder signals
  crossunder_signals <- character(length(arr1))
  crossunder_signals[1] <- "None"

  # Check for crossunder signals at each data point
  if (length(arr1) >= 2) {
    for (i in 2:length(arr1)) {
      if (arr1[i] < arr2[i] && arr1[i - 1] >= arr2[i - 1]) {
        crossunder_signals[i] <- "True"
      } else {
        crossunder_signals[i] <- "False"
      }
    }
  }

  return(crossunder_signals)
}
