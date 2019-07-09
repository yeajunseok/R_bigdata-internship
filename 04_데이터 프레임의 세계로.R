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