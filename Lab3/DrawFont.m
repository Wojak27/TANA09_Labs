function []=DrawFont()

%
% Create a vector of points to use for defining straight line segments.
%
 Points=[70 23 23 23  23  23  23    0   0  46 46 70 
          4  0 20 35 107 125 195  213 222 225 28 13]
%
% Create a matrix that can be used to store the control points for the 
% Bezi'er curves. In the exercise you will successively add more points
% into this matrix.
%
 Control=[ 10  23 15 5 -20 -33 -33 -10
          213 216  5 0   0  40 130 170];
%
% Code that can be used to cerate an "italic style" d.
% 
if 0,
 L=[1,0.07;0 1];  , Points=L*Points; Control=L*Control;
end;

%
% Set up a new figure window and draw line segments.
%
 clf,hold on,axis([-70 80 -10 250])
 plot(Points(1,[12,1:3]),Points(2,[12,1:3]),'k')
 plot(Points(1,4:5),Points(2,4:5),'k')
 plot(Points(1,6:7),Points(2,6:7),'k')
 plot(Points(1,8:11),Points(2,8:11),'k')

%
% Here you should set up control points for curve segment A and draw
% the curve using your Bezier spline function. The curve should start at  
% point P1 and end at point P2
%
% Add the new control points into the matrix Control above. And access
% them in the same was we access coordinates from the Points matrix, e.g.  
%
  C1=Control(:,1);
  C2=Control(:,2);
% 
% where column 1 of the Control matrix holds the coordinates for control
% point C1.
%
 P1=Points(:,7);,P2=Points(:,8);
 DisplayBazierPath([P2(1), C1(1),C2(1),P1(1)],[P2(2), C1(2),C2(2),P1(2)], 100)
 
%
% Here you should set up control points for curve segment B and draw
% the curve. (This part of the exercise is optional)
%
 P1=Points(:,11);,P2=Points(:,12);
 
%
% Here you should set up multiple interpolation points and control points
% corresponding to the outer arc. The curve starts at P1 and ends at P4. 
% We need two additional interpolation points P2 and P3 where the curve 
% touches the line y=0 and the line x=A, where A is picked so that the 
% curve looks ok.
%
 C3=Control(:,3);
 C4=Control(:,4);
 C5=Control(:,5);
 C6=Control(:,6);
 C7=Control(:,7);
 C8=Control(:,8);

 P1=Points(:,3);P2 = [-5, 0];P3 = [-33, 73];P4=Points(:,6);
 DisplayBazierPath([P1(1), C3(1), C4(1), P2(1)],[P1(2), C3(2), C4(2), P2(2)], 100);
 DisplayBazierPath([P2(1), C5(1), C6(1), P3(1)],[P2(2), C5(2), C6(2), P3(2)], 100);
 DisplayBazierPath([P3(1), C7(1), C8(1), P4(1)],[P3(2), C7(2), C8(2), P4(2)], 100);
 
%
% Set up the control points needed to draw the inner arc. Now it is enough 
% to use one additional interpolation point to determine where the curve 
% should tangent the line x=B. It is required that B>A or the inner arc
% will cross the outer one. 
%
 %C5=Control(:,5);
 %C6=Control(:,6);
  
 P1=Points(:,4);P3=Points(:,5);
 %DisplayBazierPath([P1(1), C5(1), C6(1), P4(1)],[P1(2), C5(2), C6(2), P4(2)], 100);
 