## 1. Створити змінні базових (atomic) типів. Базові типи: character, numeric, integer, complex, logical. 
 ```r
> my_character <- 'A' 
> print(class(my_character)) 
[1] "character"
> my_numeric <- 10 
> print(class(my_numeric)) 
[1] "numeric"
> my_integer <- 100 
> print(class(my_integer)) 
[1] "numeric"
> my_compl <- complex(real = stats::rnorm(2), imaginary = stats::rnorm(2)) 
> print(class(my_compl)) 
[1] "complex"
> my_logic <- TRUE 
> print(class(my_logic))
[1] "logical"
```

## 2. Створити вектори, які: містить послідовність з 5 до 75; містить числа 3.14, 2.71, 0, 13; 100 значень TRUE.
```r
> my_vector1 <- c(5:75)
> print(my_vector1)
 [1]  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47
[44] 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75
> my_vector2 <- c(3.14,2.71,0,13)
> print(my_vector2) 
[1]  3.14  2.71  0.00 13.00
> my_vector3 <- rep(TRUE, times=100)
> print(my_vector3)
  [1] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
 [26] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
 [51] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
 [76] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
```

## 3. Створити наступну матрицю за допомогою matrix, та за допомогою cbind або rbind
```r
> matrix_val <- c(0.5,3.9,0,2,1.3,131,2.2,7,3.5,2.8,4.6,5.1)
> matrix(matrix_val, nrow = 4)
     [,1]  [,2] [,3]
[1,]  0.5   1.3  3.5
[2,]  3.9 131.0  2.8
[3,]  0.0   2.2  4.6
[4,]  2.0   7.0  5.1
> col1 <- matrix_val[1:4]
> col2 <- matrix_val[5:8]
> col3 <- matrix_val[9:12]
> cbind(col1,col2,col3)
     col1  col2 col3
[1,]  0.5   1.3  3.5
[2,]  3.9 131.0  2.8
[3,]  0.0   2.2  4.6
[4,]  2.0   7.0  5.1
```

## 4. Створити довільний список (list), в який включити всі базові типи.
```r
> list(my_character,my_compl,my_integer,my_logic,my_numeric)
[[1]]
[1] "A"

[[2]]
[1] -0.237714+1.221965i  1.437924+1.633476i

[[3]]
[1] 100

[[4]]
[1] TRUE

[[5]]
[1] 10
```

## 5. Створити фактор з трьома рівнями «baby», «child», «adult».
```r
> my_factor <- factor(c('baby', 'child', 'adult'))
```

## 6. Знайти індекс першого значення NA в векторі 1, 2, 3, 4, NA, 6, 7, NA, 9, NA, 11. Знайти кількість значень NA.
```r
> my_vec <- c(1, 2, 3, 4, NA, 6, 7, NA, 9, NA, 11)
> print(match(NA,my_vec))
[1] 5
> print(sum(is.na(my_vec)))
[1] 3
```

## 7. Створити довільний data frame та вивести в консоль.
```r
> my_df <- data.frame(col1,col2)
> my_df
  col1  col2
1  0.5   1.3
2  3.9 131.0
3  0.0   2.2
4  2.0   7.0
```

## 8. Змінити імена стовпців цього data frame.
```r
> colnames(my_df) <- c('New1','New2')
> my_df
  New1  New2
1  0.5   1.3
2  3.9 131.0
3  0.0   2.2
4  2.0   7.0
```
