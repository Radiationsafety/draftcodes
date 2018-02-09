data=as.data.frame(read.table("for_comparison_NIKIET_Sevrao37_blanked.dat", sep=" ", header=F))
x=data[,4] # Grid 400x400 values made from 37 points SevRAO
#x1=data[,5] # Grid 400x400 values made from 37+10 points SevRAO
y=data[,3] # Grid 400x400 values made from 1036 points NIKIET
ro=cor(x,y) # корреляция пирсона
#entropy

library("infotheo")

disx=discretize(x) #дискретизируем - default: the number of bins is set to (N)^(1/3) where N is the number of samples.
disy=discretize(y) #дискретизируем 
entropy(disx)      # энтропия H(x)
entropy(disy)
l=mutinformation(disx,disy) # mutinformation returns the mutual information I(X;Y) in nats.
Rinform=sqrt(1-exp(-2*l))   # расчитываем информационную Корреляцию
paste('Корреляция Пирсона= ',ro)
paste('Информационная Корреляция = ',Rinform)


# проверка для 37+10 точек, как улучшили грид РО?
ro=cor(x1,x) # корреляция пирсона
disx=discretize(x1) #дискретизируем - default: the number of bins is set to (N)^(1/3) where N is the number of samples.
disy=discretize(x) #дискретизируем 
entropy(disx)      # энтропия H(x)
entropy(disy)
l=mutinformation(disx,disy) # mutinformation returns the mutual information I(X;Y) in nats.
Rinform=sqrt(1-exp(-2*l))   # расчитываем информационную Корреляцию
paste('Корреляция Пирсона= ',ro)
paste('Информационная Корреляция = ',Rinform)



# Стандартное геометрическое отклонение - неопределённость грида
library("EnvStats")
zVar= 1.590878412  #Residual Z variance - дисперсия - находим через Surfer
zMean= 30 # Residual Z mean - среднее - находим через Surfer
lognorm=  rlnorm(10000000,zMean,zVar) #моделируем логнормальное распределение, 10000000 розыгрышей
geoMean(lognorm)
