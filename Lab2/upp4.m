%%
clear;

A = [1 2 3; 2 3 4; 4 5 7];
[L,U,P] = lu(A)
L*U;
format long g
x1 = ones(3,1)
b = A*x1;

y = U\(L\(P*b))

x1-y

% x2 = U\y
%% 4.1
clear;
data = load('EluxB.mat');
t = data.t;
EluxB = data.EluxB;

plot(t,EluxB,'-b')
hold on
% quadric polynomial

m = 700;

A = [(t-m).^0 (t-m) (t-m).^2];
p =  75 + 0.0001*(t-m)+0.00002*(t-m).^2
yfit = A*((A'*A)\(A'*EluxB));
plot(t,EluxB,'-b',t,yfit,'-')
hold on
plot(t,p, "*")
xlim([0 2500])
%hold on
%plot(t,yfit, '-b')
yfit(1);
%% 4.2

clear;
data = load('EluxB.mat');
t = data.t;
EluxB = data.EluxB;
format long g

m = 700;

A = [(t-m).^0 (t-m) (t-m).^2];
At = A.';
AtAinv = inv(At*A);
c = AtAinv*At*EluxB
p = c(1) + c(2)*(t-m) + c(3)*(t-m).^2;
plot(t,EluxB,'-b')
hold on
plot(t,p, "or")
xlim(0,2600)
%% 4.4

clear;
data = load('EluxB.mat');
t = data.t;
EluxB = data.EluxB;
format long g
m = 700;


A = [(t-m).^0 (t-m) sin(v(t)) cos(v(t)) sin(2*v(t)) cos(2*v(t)) sin(3*v(t)) cos(3*v(t))];
At = A.';
AtAinv = inv(At*A);

c = AtAinv*At*EluxB

p = c(1) + c(2)*(t-m) + c(3)*sin(v(t)) + c(4)*cos(v(t)) + c(5)*sin(2*v(t)) + c(6)*cos(2*v(t)) + c(7)*sin(3*v(t)) + c(8)*cos(3*v(t));

plot(t,EluxB,'-b')
hold on
plot(t,p, "or")
xlim(0,2600)

function vt = v(t)
m = 700;
vt = pi*(t-m)/365;
end