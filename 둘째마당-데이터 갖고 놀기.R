### 04 데이터 프레임의 세계로
e <- c(90,80,60,70)
m <- c(50,60,100,20)
df_midterm <- data.frame(e,m)
df_midterm
class <- c(1,1,2,2)
df_midterm <- data.frame(e, m, class)
df_midterm

mean(df_midterm$e)
mean(df_midterm$m)

df_midterm <- data.frame(english = c(90,80,60,70), math = c(50,60,100,20), class = c(1,1,2,2))
df_midterm

# 혼자해보기
df_test <- data.frame(제품 = c("사과", "딸기", "수박"), 
                        가격 = c(1800, 1500, 3000), 
                        판매량 = c(24, 38, 13))
df_test
mean(df_test$가격)
mean(df_test$판매량)

# 외부 데이터 이용하기
# 엑셀 파일 읽기.
install.packages("readxl")
library(readxl)
df_exam <- read_excel("excel_exam.xlsx")
df_exam

mean(df_exam$english)
mean(df_exam$science)

df_exam_novar <- read_excel("excel_exam_novar.xlsx")
df_exam_novar

df_exam_novar <- read_excel("excel_exam_novar.xlsx", col_names = F)
df_exam_novar

# csv읽기
df_csv_exam <- read.csv("csv_exam.csv")
df_csv_exam

df_csv_exam <- read.csv("csv_exam.csv", stringsAsFactors = F) # stringsAsFactors = F 는 문자가 들어있을때. 
df_csv_exam

# csv파일로 저장하기
df_midterm <- data.frame(english = c(90,80,60,70), math = c(50,60,100,20), class = c(1,1,2,2))
df_midterm

# csv로 추출하기
write.csv(df_midterm, file = "df_midterm.csv")

# RData 파일로 저장하기
save(df_midterm, file = "df_midterm.rda")
# RData 파일 불러오기
rm(df_midterm)
df_midterm
load("df_midterm.rda")
df_midterm


country_climate <- data.frame(country=c("Canada", "Panama", "South Africa", "Australia"),
                              climate=c("cold", "hot", "temperate", "hot/temperate"),
                              temperature=c(10, 30, 18, "15"),
                              northern_hemisphere=c(TRUE, TRUE, FALSE, "FALSE"),
                              has_kangaroo=c(FALSE, FALSE, FALSE, 1))
str(country_climate)

country_climate <- data.frame(country=c("Canada", "Panama", "South Africa", "Australia"),
                              climate=c("cold", "hot", "temperate", "hot/temperate"),
                              temperature=c(10, 30, 18, "15"),
                              northern_hemisphere=c(TRUE, TRUE, FALSE, "FALSE"),
                              has_kangaroo=c(FALSE, FALSE, FALSE, 1),
                              stringsAsFactors = F)
str(country_climate)
summary(country_climate)
country_climate
names(country_climate)
rownames(country_climate)
ncol(country_climate)
nrow(country_climate)
dim(country_climate)
View(country_climate)

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


### 06. 자유자재로 데이터 가공하기
# 조건에 맞는 데이터만 추출하기: <filter>
library(dplyr)
exam <- read.csv("csv_exam.csv")
head(exam, 3)

exam %>% filter(class == 1)
exam %>% filter(class != 1)
exam %>% filter(class == 2)
exam %>% filter(class != 3)
exam %>% filter(math > 50)
exam %>% filter(math < 50)
exam %>% filter(class == 1 & math >= 50)
exam %>% filter(class == 2 & math >= 80)
exam %>% filter(math >= 90 | english >= 90)
exam %>% filter(class == 1 | class == 3 | class == 5)
exam %>% filter(class %in% c(1,3,5))

# 혼자서 해보기
mpg <- as.data.frame(ggplot2::mpg)
names(mpg)
# 1.
displ4 <- mpg %>% filter(displ <= 4)
mean(displ4$hwy)
displ5 <- mpg %>% filter(displ >= 5)
mean(displ5$hwy)
# 2.
df_audi <- mpg %>% filter(manufacturer == "audi")
mean(df_audi$cty)
df_toyota <- mpg %>% filter(manufacturer == "toyota")
mean(df_toyota$cty)
# 3.
df_CFH <- mpg %>% filter(manufacturer %in% c("chevrolet", "ford", "honda"))
mean(df_CFH$hwy)

# 필요한 변수만 추출하기
exam %>% select(math)
exam %>% select(-math)
exam %>% select(class, math, english)

exam %>% filter(class == 1) %>% select(english)
exam %>% select(id, math) %>%  head(10)

# 혼자서 해보기
# 1.
c_c_df <- mpg %>% select(class, cty)
c_c_df
# 2.
AA <- mpg %>% filter(class == "suv") %>% select(cty)
mean(AA$cty)
BB <- mpg %>% filter(class == "compact") %>% select(cty)
mean(BB$cty)

# 정렬
exam %>% arrange(desc(math))
exam %>% arrange(math)
exam %>% arrange(class, math)

# 혼자서 해보기
mpg %>% filter(manufacturer == "audi") %>% arrange(hwy) %>% head(5)

# 파생변수 추가하기
exam %>% mutate(total = math + english + science) %>% head(3)
exam %>% mutate(test = ifelse(science >= 60, "PASS", "fail")) %>% head
exam %>% mutate(total = math + english + science) %>% arrange(total) %>% head 

# 혼자서 해보기
# 1.
mpg <- mpg %>% mutate(tot = hwy + cty)
head(mpg, 3)
# 2.
mpg <- mpg %>% mutate(avg = tot/2)
head(mpg, 3)
# 3.
mpg %>% arrange(desc(avg)) %>% head(3)
# 4.
mpg %>% mutate(tot = hwy + cty, avg = tot/2) %>% arrange(desc(avg)) %>% head(3)

# 집단별로 요약하기
exam %>% summarise(mean_math = mean(math))
exam %>% group_by(class) %>% summarise(mean_math = mean(math))
mpg %>% group_by(manufacturer, drv) %>% summarise(mean_cty = mean(cty)) %>% head(10)

# 혼자서 해보기
# 1.
mpg %>% group_by(class) %>% summarise(mean(cty))
# 2.
mpg %>% group_by(class) %>% summarise(mean_cty = mean(cty)) %>% arrange(desc(mean_cty))
# 3.
mpg %>% group_by(manufacturer) %>% summarise(mean_hwy = mean(hwy)) %>% arrange(desc(mean_hwy)) %>% head(3)
# 4.
mpg %>% filter(class == "compact") %>% group_by(manufacturer) %>% summarise(count = n()) %>% arrange(desc(count))

# 혼자서 해보기
fuel <- data.frame(fl = c("c","d","e","p","r"),
                   price_fl = c(2.35, 2.38, 2.11, 2.76, 2.22),
                   stringsAsFactors = F)
fuel
# 1.
mpg_test <- mpg
mpg_new <- left_join(mpg, fuel, by="fl") %>% head(10)

# 2.
mpg_new %>% select(model, fl, price_fl) %>% head(5)


# 분석 도전!
midwest <- as.data.frame(ggplot2::midwest)
dim(midwest)
names(midwest)
# 1.
midwest <- midwest %>% mutate(ratio_child = (poptotal - popadults)/poptotal*100)
head(midwest, 5)
# 2.
midwest %>% arrange(desc(ratio_child)) %>% select(county, ratio_child) %>% head(5)
# 3.
midwest %>% mutate(grade = ifelse(ratio_child >= 40, "large",
                            ifelse(ratio_child >= 30, "middle", "small"))) %>% select(ratio_child, grade) %>% head(20)
# 4.
midwest %>% mutate(ratio_asian = popasian/poptotal * 100) %>% arrange(ratio_asian) %>% select(state, county, ratio_asian) %>% head(10)


### 07. 데이터 정제하기 - 빠진 데이터, 이상한 데이터 제거하기


### 08. 그래프 그리기