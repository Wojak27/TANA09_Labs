function [] = DisplayBazierPath(x,y, N)
   t = (0:N)'/N;
   p = (1-t).^3.*[x(1),y(1)] + 3*(1-t).^2.*t.*[x(2),y(2)] + 3.*(1-t).*t.^2.*[x(3),y(3)] + t.^3.*[x(4),y(4)];
   
   plot(t,p,'-b')
   hold on;
   plot(x/max(x),y, 'xr')
   hold off;
end