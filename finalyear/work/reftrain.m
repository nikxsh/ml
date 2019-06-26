load('-ascii','ref.mat');
P=ref(1:51,1:4);
T=ref(1:51,5);
[pn,minp,maxp,tn,mint,maxt]=premnmx(P',T');
net=newff(minmax(pn),[7 1],{'tansig','tansig'},'traingd');
net.trainParam.epochs=60000;
net.trainParam.lr=0.1;
net.trainParam.goal=0.1;
net=train(net,pn,tn);
