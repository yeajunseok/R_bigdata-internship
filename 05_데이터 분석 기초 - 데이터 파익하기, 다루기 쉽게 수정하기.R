### 05 데이터 분석 기초 - 데이터 파익하기, 다루기 쉽게 수정하기
library("ggplot2")
mpg <- as.data.frame(ggplot2::mpg)
View(mpg)
summary(mpg)
dim(mpg)
str(mpg)
?mpg
names(mpg)

df_raw <- data.frame(var1 = c(1,2,1),
                     var2 = c(2,3,2))
df_raw
str(df_raw)
install.packages("dplyr")
library(dplyr)
df_new <- df_raw
df_new <- rename(df_new, v2 = var2)
df_new

# 혼자서 해보기
cp_mpg <- mpg
cp_mpg
cp_mpg <- rename(cp_mpg, city = cty, highway = hwy )
cp_mpg
head(cp_mpg)

# 파생병수 만들기
df <- data.frame(var1 = c(4,3,8),
                 var2 = c(2,6,1))
df
df$var_sum <- df$var1 + df$var2
df$var_mean <- (df$var1 + df$var2)/2
df

mpg$total <- (mpg$cty + mpg$hwy)/2
head(mpg)
mean(mpg$total)

# 조건문을 활용해 파생변수 만들기
mpg$test <- ifelse(mpg$total >= 20, "PASS", "fail")
head(mpg, 20) # 20줄 까지.

# table: 빈도표 생성
table(mpg$test)

qplot(mpg$test) # qplot으로 그린다, 막대그래프는 범주형이다. (남자, 여자 연속된 값이 아니다.)
hist(mpg$total) # 히스토그램은 연속형이다.

# 중첩 조건문 활용하기
mpg$grade <- ifelse(mpg$total >= 30, "A",
                    ifelse(mpg$total >= 20, "B", "C"))
head(mpg, 20)

table(mpg$grade)
qplot(mpg$grade)

# 분석 도전!
# 1.
midwest <- as.data.frame(ggplot2::midwest)
head(midwest, 8)
names(midwest)
dim(midwest)
# 2.
midwest <- rename(midwest, total = poptotal, asian = popasian)
names(midwest)
# 3.
midwest$ratio <- (midwest$asian/midwest$total)*100
midwest$ratio
# 4, 
mean(midwest$ratio)
midwest$size <- ifelse(midwest$ratio > mean(midwest$ratio), "large", "small")
names(midwest)
table(midwest$size)
qplot(midwest$size)