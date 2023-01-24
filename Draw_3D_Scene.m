function Draw_3D_Scene()
% Draw_3D_Scene plots a 3D scene used for the visual comprehention of the 
% radiosurgery scenario, showing the head, PTV, OAR, isocenter, dose box, 
% and coordinate axis.
%
% INPUT:
%       None
% OUTPUT:
%       None

% declare some needed global variables 
global HEAD_CENTRE;
global HEAD_A;
global HEAD_B;
global HEAD_C;
global PTV_RAD;
global PTV_CENTRE;
global OAR_A;
global OAR_B;
global OAR_C;
global OAR_CENTRE;

% Colours
lightGrey = [0.75 0.75 0.75];
Yellow = [1 1 0.5];
Red = [1 0.75 0.75];

% Plot head
[X_H,Y_H,Z_H] = ellipsoid(HEAD_CENTRE(1),HEAD_CENTRE(2),HEAD_CENTRE(3),HEAD_A,HEAD_B,HEAD_C);
surf(X_H, Y_H, Z_H, 'FaceColor', 'black','FaceAlpha', 0.03,'EdgeColor',lightGrey, 'EdgeAlpha', 0.5);
text(0.75*HEAD_A, 0.75*HEAD_B, 0, "Patient Brain");

hold on;
axis equal;
xlabel("X Axis");
ylabel("Y Axis");
zlabel("Z Axis");
title("3D Visualization")

% Plot PTV
[X, Y, Z] = sphere;
X_PTV = X * PTV_RAD;
Y_PTV = Y * PTV_RAD;
Z_PTV = Z * PTV_RAD;
surf(X_PTV + PTV_CENTRE(1), Y_PTV + PTV_CENTRE(2), Z_PTV + PTV_CENTRE(3),...
     'FaceColor', 'yellow', 'FaceAlpha', 0.3, 'EdgeColor',Yellow, 'EdgeAlpha', 0.3)
text(PTV_CENTRE(1), PTV_CENTRE(2) - PTV_RAD, PTV_CENTRE(3) - PTV_RAD, "PTV");

% Plot OAR
[X_OAR,Y_OAR,Z_OAR] = ellipsoid(OAR_CENTRE(1),OAR_CENTRE(2),OAR_CENTRE(3),OAR_A,OAR_B,OAR_C);
surf(X_OAR, Y_OAR, Z_OAR,'FaceColor', 'red', 'FaceAlpha', 0.3, 'EdgeColor',Red, 'EdgeAlpha', 0.3)
text(OAR_CENTRE(1), OAR_CENTRE(2) - OAR_B*0.75, OAR_CENTRE(3) - OAR_C, "OAR")

% Plot Isocentre
plot3(PTV_CENTRE(1), PTV_CENTRE(2), PTV_CENTRE(3), 'k.', 'MarkerSize', 20);
text(PTV_CENTRE(1)+3,PTV_CENTRE(2)+3, PTV_CENTRE(3), "Isocentre");

hold off;

end