# Preprocessing the data first.

df <- read.csv('Folder/Part 1 - Data Preprocessing/Section 2 -------------------- Part 1 - Data Preprocessing --------------------/Data.csv')

# Checking for empty values in the columns
dfValues <- 'empty'
for (column in colnames(df)) {
  if (any(is.na(df[[column]]))){
    if (dfValues == 'empty') {
      dfValues <- data.frame(df[[column]])
    } else {
      dfValues$column <- df[[column]]
    }
  }
}

# Replacing the empty values
for (column in colnames(dfValues)) {
    df[[column]] <- ifelse(
        is.na(df[[column]]),
        ave(df[[column]], FUN = function(x) mean(x, na.rm = TRUE)),
        df[[column]]
    )
}



# CLEAN UP #################################################

rm(list = ls())
p_unload(all)
dev.off()
cat("\014")  # ctrl+L
