clc;
clear;

DisplayMap();
cords = AddPointsToMap(11);
[sx, sy] = ParametricCurve(cords(:,1),cords(:,2));
length100 = CalculateLength(sx,sy,100);
length200 = CalculateLength(sx,sy,200);
length400 = CalculateLength(sx,sy,400);
length5000 = CalculateLength(sx,sy,5000);