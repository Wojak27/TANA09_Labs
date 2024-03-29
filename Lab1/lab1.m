n = 50;
x = 1+2^(-n);
dx = -2^(-n)*log(2);
b = 2;
my = abs(dx/x)


%% Absolute error

approx = sqrt(2);
format long 
da = 1.414213562373095 - sqrt(2)

% correct decimals
t = -log10(2*abs(da))
%% Hex
clc;
format short;
dec2base(3,10)

format hex;
base2dec("3",10)

format short;
dec2base(11,2)

format hex;
base2dec("11",2)

format short;
dec2base(1.1,2)

format hex;
base2dec("1.1",2)

%%
x = 10.^-(0:0.1:16);
f1 = (exp(x)-1)./log(exp(x));
loglog(x,abs(f1-1)), xlabel('x'), ylabel('abs(f_1(x)-1)')

%%
A = [1 2 3; 2 3 4; 4 5 7];
[L,U,P] = lu(A);
L*U
%% 4.8
clear;
clc;

x = (0:0.1:3);

%f=@(x) sqrt(1+x).*exp(x./2)-2.*sin(2.*x).*(x+x.^2);

%plot(x,f(x))

%xStar = fzero(f,1.5); 

format short e;

options = optimset('TolFun',1e-15);
global xVector;
xVector = [];
[y] = fzero(@fun, 1.5, options);
format short e
e=abs(xVector-xVector(end));

figure
semilogy(1:size(xVector,2), e);

% 4.9
e,k=15,e(k),p=(log(e(k)/e(k-1))/log(e(k-1)/e(k-2)))

%% 4.10

z = 0:0.5:10;
y = 1./z;

plot(z,y,'-b')

xk = 0.1;
for i = 0:10
   xk = xk.^2.*y+2.*xk;
end


%% 4.13
error = zeros(size(1:0.01:2,1));
index = 1;
for y = 1:0.01:2
   z = Division(1.32,y)
   ztrue = 1.32/y
   error(index)= (z-ztrue)./ztrue
   index = index+1;
end
plot(1:0.01:2,error)
function [z] = Division(x, y)
   yk = y.^(-1);
   z = x.*yk;
end


function[y]=fun(x)
   y=sqrt(1+x).*exp(x./2)-2.*sin(2.*x).*(x+x.^2);
   fprintf('%18.15f %6.2e\n',x,y)
   global xVector;
   xVector(end+1) = x;
end

