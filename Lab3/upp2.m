clc;
clear;
format long;

tk = [1 1.5];
f = [1.6602 1.7383];

p = polyfit(tk, f, 1);
yy = polyval(p,1.3)

t = 1.3;
f = exp(-t/5) + sin(t)