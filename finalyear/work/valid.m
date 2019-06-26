load('-ascii','deleted.mat');
P=deleted(1:366,1:7);
T=deleted(1:366,8);
l=deleted(367:532,1:7);
m=deleted(367:532,8);
[pn,minp,maxp,tn,mint,maxt]=premnmx(P',T');
[an,mina,maxa,sn,mins,maxs]=premnmx(a',s');
[ln,minl,maxl,mn,minm,maxm]=premnmx(l',m');
net=newff(minmax(pn),[20 1],{'tansig','tansig'},'traingd');
net.trainParam.epochs=200000;
net.trainParam.lr=0.1;
net.trainParam.goal=0.1;
nntool