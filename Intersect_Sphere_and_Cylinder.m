function n = Intersect_Sphere_and_Cylinder(C, R, r, P, v)
% Intersect_Spohere_and_Cylinder calculates the number of intersections
% between a sphere and a hollow cylinder
%
% The function works by reduceing the problem to 2D and first calculating
% the minimum distance between the centre vector of the cylinder and the 
% centre of the sphere. Using the radius of both objects we are then able 
% to easily create conditional statements checking if the two objects touch 
% or not. If the distance is larger than the sum of the two objects' than 
% there is no intersection, if the distance is equal to the sum of the two 
% radii than there is exactly one intersection point, if the distance is
% smaller than the combined radii than we check if the radius of the
% cylinder is larger than the distance plus the radius of the sphere to
% check if the sphere perfectly resides inside the cylinder or lastly, if
% the radius of the cylinder is equal to the distance plus the radius of
% the sphere to check if the sphere intersects once with the inside of the
% cylinder. All other cases that are not mentioned will result in an
% infinite amount of intersections.
%
% INPUTS: 
%         C - Point used to define the center of the sphere
%         R - radius used to define the sphere
%         r - radius used to define the cylinder
%         P - a point that lies on the central axis of the cylinder
%         v - direction vector of the central axis used to define the
%         cylinder
% OUTPUTS:
%         n - the number of intersections between the line and the cylinder

v = v / norm(v);
c = norm(C-P);
a = abs(dot(v, C-P));
d = sqrt((c+a)*(c-a));

if d > R + r
    n = 0;
elseif d == R+r
    n = 1;
elseif d < R + r
    if r > d + R
        n = 0;
    elseif r == d + R
        n = 1;
    else
        n = inf;
    end
end
end