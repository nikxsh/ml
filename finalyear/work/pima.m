%-- 11/16/11  9:03 PM --%
load('-ascii','data.mat');
P=data(1:384,1:8);
T=data(1:384,9);
[pn,minp,maxp,tn,mint,maxt]=premnmx(P',T');
net=newff(minmax(pn),[7 1],{'tansig','tansig'},'traingd');
net.trainParam.goal=0.01;
net.trainParam.epochs=500000;
net=train(net,pn,tn);
nntool
y=sim(net,pn);
t=postmnmx(y',mint,maxt);
[t T]
net.trainParam.epochs=50000;
net=train(net,pn,tn);

