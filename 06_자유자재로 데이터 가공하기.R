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
midwest %>% mutate(grade = ifelse(ratio_child >= 40, "large",
                                  ifelse(ratio_child >= 30, "middle", "small"))) %>% group_by(grade) %>% summarise(count = n())
# 4.
midwest %>% mutate(ratio_asian = popasian/poptotal * 100) %>% arrange(ratio_asian) %>% select(state, county, ratio_asian) %>% head(10)

