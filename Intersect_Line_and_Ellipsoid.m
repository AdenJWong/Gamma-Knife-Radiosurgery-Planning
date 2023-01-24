function [n, i] = Intersect_Line_and_Ellipsoid(P, v, a, b, c)
% Intersect_Line_and_Ellipsoid calculates the intersection point(s) between 
% a line and an ellipsoid and also returns the number of intersections
%
% The function works by first subbing the equation of a line into the
% equation for an elipsoid and then simplifying it into a quadratic form.
% Using the quadratic equation, it then calculates the intersections. The
% discriminant is also calculated in order to check how many intersections
% are to be returned.
%
% INPUTS: 
%         P - fixed point used to define a line
%         v - direction vector used to define a first line
%         a - length of principal axis that is parallel with the x axis
%         b - length of principal axis that is parallel with the y axis
%         c - length of principal axis that is parallel with the z axis
% OUTPUTS:
%         n - the number of intersections between the line and the
%         ellipsoid
%         i - the point(s) of intersection between the line and the
%         ellipsoid assuming atleast one exist

v = v / norm(v);

A = ((v(1)^2)/(a^2)) + ((v(2)^2)/(b^2)) + ((v(3)^2)/(c^2));
B = ((2*P(1)*v(1))/(a^2)) + ((2*P(2)*v(2))/(b^2)) + ((2*P(3)*v(3))/(c^2));
C = ((P(1)^2)/(a^2)) + ((P(2)^2)/(b^2)) + ((P(3)^2)/(c^2)) - 1;

D = ((B^2)-4*A*C);

t1= ((-B)+((B^2-4*A*C))^0.5)/(2*A);
t2= ((-B)-((B^2-4*A*C))^0.5)/(2*A);

L1 = P + t1*v;
L2 = P + t2*v;

if D > 0
    n = 2;
    i = [L1; L2];

elseif D == 0
    n = 1;
    i = L1;
else
    disp("Line and ellipsoid do not intersect")
    n = 0;
    i = nan;
end

end