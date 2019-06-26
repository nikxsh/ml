load('-ascii','R5refine.mat');
P=R5refine(1:97,1:5);
T=R5refine(1:97,6);
[pn,minp,maxp,tn,mint,maxt]=premnmx(P',T');
net=newff(minmax(pn),[6 1],{'tansig','tansig'},'traingd');
net.trainParam.epochs=50000;
net.trainParam.goal=0.1;
net.trainParam.lr=0.1;
net=train(net,pn,tn);
