function Compute_Skin_Entry_Points()
% Compute_Skin_Entry_Points calculates the intersection points between the
% beams and the head ellipsoid of the patient.
%
% INPUT:
%       None
% OUTPUT:
%       None

global PTV_CENTRE
global HEAD_A
global HEAD_B
global HEAD_C
global beam_struct_array

% calculate each beam vector's intersection with the head elipsoid and add
% to the beam_struct_array created previously.
[N,~] = size(beam_struct_array);
for i = 1:N
    v = beam_struct_array(i,3:5);
    
    [~, skin_entry] = Intersect_Line_and_Ellipsoid(PTV_CENTRE, v, HEAD_A, HEAD_B, HEAD_C);
    
    d2c = norm(PTV_CENTRE - skin_entry(1,:));
    
    beam_struct_array(i,6:9) = [skin_entry(1,:), d2c];
end
end