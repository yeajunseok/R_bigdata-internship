## 1. which: 특정 값의 위치를 찾을수 있다.

# vector
x <- c(2:10)
x
which(x==3) # 숫자 3이 위치하고 있는 인덱스 2를 반환한다.
x[2]
x[which(x==3)]
which(x%%2 == 0)
x[which(x%%2 == 0)]
coder <- c('c','o','d','e','r','1','2','5','2')
which(coder == 'e') 

# matrix
m <- matrix(1:12, 3,4)
m
which(m %% 3 == 0) # matrix는 위치가 아닌 원소 값이 반환된다.
which(m %% 3 == 0, arr.ind = TRUE) # 이렇게 해야지 해당하는 인덱스 값이 나온다.

# Dataframe
head(trees)
which(trees$Height < 70) # 70보다 작은값의 인덱스 값이 나온다.
trees[which(trees$Height < 70),] # 행 전체가 반환된다.

## 2. which.min / which.max , 최소&최대값의 위치(index)가 출력된다.
which.min(x)
which.max(x)
x

# 벡터
x <- c(2:10)
x
which.min(x)
which.max(x)

coder <- c('c','o','d','e','r','1','2','5','2')
which.min(coder) # which는 숫자에만 작동
which.max(coder) # which는 숫자에만 작동

# Dataframe
head(trees)
which.max(trees$Height)
trees[which.max(trees$Height),]
which.min(trees$Height)
trees[which.min(trees$Height),]
