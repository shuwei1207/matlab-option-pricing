function out=plotreturn(profit)
S=8000:10000;
figure;
plot(S,profit);
hold on;
plot([8000 10000],[0 0],'--');