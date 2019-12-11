function [sx, sy] = ParametricCurve(x,y)
   t = 0:1/(length(x)-1):1;
   sx = csape(t,x);
   sy = csape(t,y);
   n = 10*length(x);
   tt = (0:n)/n;
   plot( ppval(sx,tt) , ppval(sy,tt),'-w')
   hold on;
   plot( x,y,'r+')
   hold off;
end