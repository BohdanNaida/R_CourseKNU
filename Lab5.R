# [1, 2, 3, 4] -> [001.csv, 002.csv, ...]
get_filename <- function (int_val){
  return (sprintf("%03d.csv", int_val))
}

get_pollut <- function(directory, regions){
  setwd(directory)
  files <- get_filename(regions)
  pollutions_by_reg <- lapply(files, read.csv)
  return (pollutions_by_region)
}
# 1. Написати функцію pmean, ...

pmean <- function(directory, pollutant, id = 1:332) {
  pollut_by_id <- get_pollut(directory, id)
  pollut <- do.call("rbind", pollut_by_id)
  mean_pollut <- mean(pollut[[pollutant]], na.rm=TRUE)
  return(mean_pollut)
}

print("--- pmean")
print(pmean('specdata', 'sulfate'))

complete_cases_as_vec <- function(df) {
  return (sapply(df, function(x) sum(complete.cases(x)) ))
}

# 2. Написати функцію complete, ...
complete <- function(directory, id){
  pollut <- get_pollut(directory, id)
  
  complete_cases_per_id = data.frame(
    id=id,
    nobs = complete_cases_as_vec(pollut)
  )
  
  return (complete_cases_per_id)
}

print("--- complete")
print(complete('.', 1:10))

remove_if_na <- function(df, threshold){
  return (df[lapply(df, function (x) { sum(complete.cases(x)) > threshold}) == TRUE])
}

remove_rows_na <- function(df){
  return (lapply(df, function (x) x[complete.cases(x),]))
}

get_cor <- function(df, col1, col2){
  return (sapply(df, function(x) cor(x[[col1]], x[[col2]]) ))
}

# 3. Написати функцію corr, ...
corr <- function(directory, threshold = 0) {
  pollut <- get_pollut(directory, 1:332)
  valid_reg <- remove_if_na(pollut, threshold)
  valid_reg_without_na <- remove_rows_na(valid_reg)
  
  if (length(valid_reg_without_na) == 0) { return (c()) }
  
  correl <- get_correl(valid_reg_without_na, 'sulfate', 'nitrate')
  return (correl)
}

print("--- corr")
print(corr('.'))