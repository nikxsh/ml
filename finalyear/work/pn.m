load('-ascii','R4refine.mat');
P=R4refine(1:4,1:4);
T=R4refine(1:4,5);
[pn,minp,maxp,tn,mint,maxt]=premnmx(P',T');
net=newff(minmax(pn),[1 1],{'tansig','tansig'},'traingd');
net.trainParam.epochs=10000;
net.trainParam.goal=0.1;
net.trainParam.lr=0.1;
net=train(net,pn,tn);
