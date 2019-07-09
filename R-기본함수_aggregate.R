aggregate(mtcars, list(cylStandard = mtcars$cyl), mean)
aggregate(mtcars, mtcars[,'disp'] > 120, mean)
