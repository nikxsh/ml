
P=[1 0 0 1];
T=[1 0];
[pn,minp,maxp,tn,mint,maxt]=premnmx(P',T');
net=newff(minmax(pn),[2 1],{'tansig','tansig'},'traingd');
net.trainParam.goal=0.1;
net.trainParam.epochs=500;
net=train(net,pn,tn);
nntool
y=sim(net,pn);
t=postmnmx(y',mint,maxt);
[t T]
net.trainParam.epochs=500;
net=train(net,pn,tn);

