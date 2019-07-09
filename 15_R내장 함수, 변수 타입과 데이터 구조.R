### 15. R내장 함수, 변수 타입과 데이터 구조
exam <- read.csv("csv_exam.csv")
dim(exam)
exam
exam[1,3]
exam[5, "english"]
exam[exam$math > 50, "english"]
exam[exam$math >= 50, c("math", "english","science")]

exam %>% 
  filter(math >= 50 & english >= 80) %>% 
  mutate(tot = (math + english + science)/3) %>% 
  group_by(class) %>% 
  summarise(mean = mean(tot))

# 혼자서 해보기
mpg$tot_y <- (mpg$cty + mpg$hwy)/2
aggregate(data = mpg[mpg$class == "suv" | mpg$class == "compact", ], tot_y~class, mean)

df_suvcomp <- subset(mpg, class == "suv" | class == "campact")
aggregate(data=df_suvcomp, tot_y ~ class, mean)













exam$tot <- (exam$math + exam$english + exam$science)/3
exam
aggregate(data = exam[exam$math >= 50 & exam$english >= 80, ], tot ~ class, mean)


## 변수 타입
var1 <- c(1,2,3,1,2)
var2 <- factor(c(1,2,3,1,2))
var1
var2
var1 + 2 
var2 + 2

class(var1)
class(var2)
levels(var1)
levels(var2)

var3 <- c("a","b","b","c")
var4 <- factor(c("a","b","b","c"))
var3
var4
var3 + 2
var4 + 2

class(var3)
class(var4)

var2 <- as.numeric(var2)
mean(var2)
class(var2)
levels(var2)

class(mpg)
summarise(mpg)
summary(mpg)

class(mpg$drv)
class(as.factor(mpg$drv))
levels(as.factor(mpg$drv))

## 데이터 구조
# 1. 벡터
a <- 1
a
class(a)
b <- "hello"
b
class(b)
# 2. 데이터 프레임
x1 <- data.frame(var1 = c(1,2,3),
                 var2 = c("a","b","c"))
x1
class(x1)
# 3. 매트릭스
x2 <- matrix(c(1:12), ncol=2)
x2
class(x2)
# 4. 어레이
x3 <- array(1:20, dim=c(2,5,2))
x3
class(x3)
# 5. 리스트
x4 <- list(f1 = a, f2 = x1, f3= x2, f4 = x3)
x4
class(x4)

boxplot(mpg$cty)
x <- boxplot(mpg$cty)
x
class(x) 
x$stats[,1]
x$stats[3,1]
x$stats[,1][3]
x$stats[2,1]
x$stats[,1][2]
