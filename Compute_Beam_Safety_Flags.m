function Compute_Beam_Safety_Flags()
% Compute_Beam_Safety_Flags calculates if a beam will intersect with the
% OAR and appends a safety flag of either true or false to the beam
% structure array
%
% INPUT:
%       None.
% OUTPUT: 
%       None.

global OAR_A;
global OAR_B;
global OAR_C;
global OAR_CENTRE;
global PTV_CENTRE;
global BEAM_DIAM;
global beam_struct_array;

% initialize number of columns of array
[N,~] = size(beam_struct_array);

% check whether each beam ever intersects with any of the surface points
% of the OAR ellipsoid optained from the ellipsoid function
[X_OAR,Y_OAR,Z_OAR] = ellipsoid(OAR_CENTRE(1),OAR_CENTRE(2),OAR_CENTRE(3),OAR_A,OAR_B,OAR_C);
for i = 1:N
    for j = 1:size(X_OAR)
        for k = 1:size(X_OAR)
            numInt = Intersect_Sphere_and_Cylinder([X_OAR(j,k), Y_OAR(j,k), Z_OAR(j,k)], 0.05, BEAM_DIAM/2, PTV_CENTRE, beam_struct_array(i,3:5));
            if numInt == 0
                beam_struct_array(i,10) = 1;
            else
                beam_struct_array(i,10) = 0;
                break
            end
        end
        if beam_struct_array(i,10) == 0
            break
        end
    end
end

end