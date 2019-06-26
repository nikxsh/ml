load('-ascii','deleted.mat');
P=deleted(1:200,1:7);
T=deleted(1:200,8);
a=deleted(201:316,1:7);
s=deleted(201:316,8);
l=deleted(317:532,1:7);
m=deleted(317:532,8);
[pn,minp,maxp,tn,mint,maxt]=premnmx(P',T');
[an,mina,maxa,sn,mins,maxs]=premnmx(a',s');
[ln,minl,maxl,mn,minm,maxm]=premnmx(l',m');
net=newff(minmax(pn),[12 1],{'tansig','tansig'},'traingd');
net.trainParam.epochs=100000;
net.trainParam.lr=0.1;
net.trainParam.goal=0.1;
net=train(net,pn);
y=sim(net,an);
t=postmnmx(y',mins,maxs);
[t s]