a <- c(1,2,3)
b <- c(4,a,6)
a + b

# c(), seq()
var1 <- c(1,2,5,7,8)
var2 <- c(1:5)
var2
var3 <- seq(1,10,by=2)
var3

str1 <- "a"
str1
str2 <- "text"
str2
str3 <- c("A","B","C")
str3
str4 <- c("Z","X","C")
str4

mean(var1)


# paste(): 문자 합치기 - https://m.blog.naver.com/coder1252/220985161855
?paste
paste(str3, collapse = ",")
paste(str3, collapse = "")
paste(str3, collapse = "  ")
paste(str3, str4, sep = "-")

paste(1,2,3,4, sep="-")
paste(1,2,3,4, collapse = "   ")

#---
# 묶이지 않은 원소 - 나열된 원소를 이어붙여서 결과값을 반환
paste(1,2,3,4)
paste("a", "b", "c")

# 묶인 원소 - 변수, rep, c를 개별로 인식한다.
paste(c(1,2,3,4), c("a","b","c","d"))
paste(1:10, c("st","nd","rd", rep("th", 7)))

# 한 쪽만 묶인 경우
paste()


#---

install.packages("ggplot2")
library(ggplot2)

# qplot(): 빈도 막대 그래프는 값의 개수를 막대의 길이로 표현.
# 막대그래프와 히스토그램의 차이점
# 막대그래프는 범주형이다. (남자, 여자 연속된 값이 아니다.)
# 히스토그램은 연속형이다. 
x <- c("a", "a", "b", "c")
qplot(x)
qplot(data = mpg, x = hwy)
qplot(data = mpg, x = cty)
qplot(data = mpg, x = drv, y = hwy)
qplot(data = mpg, x = drv, y = hwy, geom = "line")
qplot(data = mpg, x = drv, y = hwy, geom = "boxplot")
qplot(data = mpg, x = drv, y = hwy, geom = "boxplot", colour = drv)
?qplot

# 혼자서 해보기
score <- c(80, 60, 70, 50, 90)
a <- mean(score)
a
