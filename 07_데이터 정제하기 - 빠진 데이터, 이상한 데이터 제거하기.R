### 07. 데이터 정제하기 - 빠진 데이터, 이상한 데이터 제거하기
df1  <- read.csv("test.csv")
df1
df2  <- read.csv("test.csv", header = TRUE)
df2
df3  <- read.csv("test.csv", header = TRUE, sep = ",", na.strings = "")
df3
is.na(df3)
table(is.na(df3))
summary(df3)

df3 %>% filter(is.na(score))
df_nomiss <- df3 %>% filter(!is.na(score) & !is.na(sex)) # score, sex 결측치 제거
df_nomiss

df_nomiss2 <- na.omit(df3) # 결측치 없는 데이터 추출
df_nomiss2

df3
mean(df3$score, na.rm = T) # 결측치 제외하고 평균 산출
sum(df$score, na.rm = T) # 결측치 제외하고 합계 산출

exam <- read.csv("csv_exam.csv")
exam[c(3,8,15), "math"] <- NA # 3,8,15 행에 NA로 만들기
exam
exam %>% summarise(mean_math = mean(math))
# 다른방법
aggregate(data=exam, math ~ class, mean)
exam %>% group_by(class) %>% summarise(mean_math = mean(math, na.rm = T))
#
exam %>% group_by(class) %>% summarise(mean_math = mean(math, na.rm = T))
exam %>% summarise(mean_math = mean(math, na.rm = T))
exam %>% summarise(mean_math = mean(math, na.rm = T),
                   sum_math = sum(math, na.rm = T),
                   median_math = median(math, na.rm = T))
exam
exam$math <- ifelse(is.na(exam$math), mean(exam$math, na.rm = T), exam$math)
is.na(exam$math)
table(is.na(exam$math))
exam

# 혼자서 해보기
mpg <- as.data.frame(ggplot2::mpg)
mpg[c(65,124,131,153,212), "hwy"] <- NA
mpg[c(65,124,131,153,212), "hwy"]
# 1.
table(is.na(mpg$drv))
table(is.na(mpg$hwy))
# 2.
mpg %>% filter(is.na(hwy) == FALSE) %>% group_by(drv) %>% summarise(avg = mean(hwy))
mpg %>% filter(!is.na(hwy)) %>% group_by(drv) %>% summarise(avg = mean(hwy))



