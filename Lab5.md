```r
> get_filename <- function (int_val){
+   return (sprintf("%03d.csv", int_val))
+ }
> 
> get_pollut <- function(directory, regions){
+   setwd(directory)
+   files <- get_filename(regions)
+   pollutions_by_reg <- lapply(files, read.csv)
+   return (pollutions_by_region)
+ }
```
### 1. Написати функцію pmean, ...

```r
pmean <- function(directory, pollutant, id = 1:332) {
+   pollut_by_id <- get_pollut(directory, id)
+   pollut <- do.call("rbind", pollut_by_id)
+   mean_pollut <- mean(pollut[[pollutant]], na.rm=TRUE)
+   return(mean_pollut)
+ }
```
3.189369
```r
> complete_cases_as_vec <- function(df) {
+   return (sapply(df, function(x) sum(complete.cases(x)) ))
+ }
```
### 2. Написати функцію complete, ...

```r
> complete <- function(directory, id){
+   pollut <- get_pollut(directory, id)
+   
+   complete_cases_per_id = data.frame(
+     id=id,
+     nobs = complete_cases_as_vec(pollut)
+   )
+   
+   return (complete_cases_per_id)
+ }

```

   id nobs  
1   1  117  
2   2 1041  
3   3  243  
4   4  474  
5   5  402  
6   6  228  
7   7  442  
8   8  192  
9   9  275  
10 10  148


### 3. Написати функцію corr, ...
```r
corr <- function(directory, threshold = 0) {
+   pollut <- get_pollut(directory, 1:332)
+   valid_reg <- remove_if_na(pollut, threshold)
+   valid_reg_without_na <- remove_rows_na(valid_reg)
+   
+   if (length(valid_reg_without_na) == 0) { return (c()) }
+   
+   correl <- get_correl(valid_reg_without_na, 'sulfate', 'nitrate')
+   return (correl)
+ }

corr('specdata')
```

[1] -0.222552561 -0.018957541 -0.140512544 -0.043897372 -0.068159562  
[6] -0.123506666 -0.075888144 -0.159673652 -0.086841940 0.161379334  
[11] 0.763128837 -0.078813785 -0.545372688 -0.222748447 -0.178085309  
...  
[311] -0.123172036 -0.061565518 -0.180133963 0.458643619 0.728610818  
[316] 0.253978075 0.139867175 0.316429404 0.268780500 0.279397143  
[321] 0.267260662 0.287133842 0.146211226
