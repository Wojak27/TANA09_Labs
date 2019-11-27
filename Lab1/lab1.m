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