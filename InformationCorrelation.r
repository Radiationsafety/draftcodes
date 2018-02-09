data=as.data.frame(read.table("for_comparison_NIKIET_Sevrao37_blanked.dat", sep=" ", header=F))
x=data[,4] # Grid 400x400 values made from 37 points SevRAO
#x1=data[,5] # Grid 400x400 values made from 37+10 points SevRAO
y=data[,3] # Grid 400x400 values made from 1036 points NIKIET
ro=cor(x,y) # ���������� �������
#entropy

library("infotheo")

disx=discretize(x) #�������������� - default: the number of bins is set to (N)^(1/3) where N is the number of samples.
disy=discretize(y) #�������������� 
entropy(disx)      # �������� H(x)
entropy(disy)
l=mutinformation(disx,disy) # mutinformation returns the mutual information I(X;Y) in nats.
Rinform=sqrt(1-exp(-2*l))   # ����������� �������������� ����������
paste('���������� �������= ',ro)
paste('�������������� ���������� = ',Rinform)


# �������� ��� 37+10 �����, ��� �������� ���� ��?
ro=cor(x1,x) # ���������� �������
disx=discretize(x1) #�������������� - default: the number of bins is set to (N)^(1/3) where N is the number of samples.
disy=discretize(x) #�������������� 
entropy(disx)      # �������� H(x)
entropy(disy)
l=mutinformation(disx,disy) # mutinformation returns the mutual information I(X;Y) in nats.
Rinform=sqrt(1-exp(-2*l))   # ����������� �������������� ����������
paste('���������� �������= ',ro)
paste('�������������� ���������� = ',Rinform)



# ����������� �������������� ���������� - ��������������� �����
library("EnvStats")
zVar= 1.590878412  #Residual Z variance - ��������� - ������� ����� Surfer
zMean= 30 # Residual Z mean - ������� - ������� ����� Surfer
lognorm=  rlnorm(10000000,zMean,zVar) #���������� ������������� �������������, 10000000 ����������
geoMean(lognorm)
