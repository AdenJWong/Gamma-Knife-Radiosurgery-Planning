function Compute_Surface_Dose_PTV()
% Compute_Surface_Dose_PTV computes the sum of doses on the surface of the
% PTV and graphs the hottest and coldest points accordingly using a
% temperature gradient.
%
% INPUT:
%       None.
% OUPUT:
%       None.

% declare global variables
global PTV_CENTRE;
global PTV_RAD;
global beam_struct_array;
global D_0;
[N,~] = size(beam_struct_array);

[X,Y,Z]=sphere;
X = X * PTV_RAD + PTV_CENTRE(1); 
Y = Y * PTV_RAD + PTV_CENTRE(2); 
Z = Z * PTV_RAD + PTV_CENTRE(3); 

hottest = [0,0,0,0];
coldest = [0,0,0,N*D_0];
C=zeros(size(X,1),size(X,2));
for i = 1:size(X,1)
    for j = 1:size(X,2)
        C(i,j) = Compute_Point_Dose_from_All_Beams([X(i,j), Y(i,j), Z(i,j)]);
        if C(i,j) > hottest(4)
            hottest = [X(i,j), Y(i,j), Z(i,j),C(i,j)];
        end
        
        if C(i,j) < coldest(4)
            coldest = [X(i,j), Y(i,j), Z(i,j),C(i,j)];
        end
    end
end

figure(5);
surf(X,Y,Z,C,'EdgeAlpha',0.05)
axis equal
colormap jet;
shading interp
xlabel("X Axis")
ylabel("Y Axis")
zlabel("Z Axis")
title("Surface Dose on PTV Plot")
colorbar
hold on
plot3(hottest(1),hottest(2),hottest(3),'k.','MarkerSize',20);
txt_h = sprintf("Hottest Point: %g",hottest(4));
text(hottest(1),hottest(2),hottest(3)+3, txt_h)
plot3(coldest(1),coldest(2),coldest(3),'k.','MarkerSize',20);
txt_c = sprintf("Coldest Point: %g",coldest(4));
text(coldest(1)+5,coldest(2)+5,coldest(3)+3, txt_c)
fprintf("Hottest point on PTV: (%.2f, %.2f, %.2f)\t Dosage: %.2f\n",...
    hottest(1),hottest(2),hottest(3),hottest(4));
fprintf("Coldest point on PTV: (%.2f, %.2f, %.2f)\t Dosage: %.2f\n\n",...
    coldest(1),coldest(2),coldest(3),coldest(4));
end