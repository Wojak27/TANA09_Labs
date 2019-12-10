clc;
clear;

t = [0 2 4 5 6];
y = [0 0 1 0 0];

pn = csape(t,y, 'variational');

tt = 0:0.01:6;

yy = fnval(pn, tt);
plot(tt,yy, '-k');
hold on;
plot(t, y, 'x');

tt2 = 1:2:3;

yy2 = fnval(pn, tt2);
plot(tt2, yy2, 'ob');

pr = csape(t,y, 'complete', [0,0]);
yy3 = fnval(pr, tt);

plot(tt,yy3, '-g');

tt4 = 1:2:3;

yy4 = fnval(pr, tt4);
plot(tt4, yy4, 'ob');

hold off;