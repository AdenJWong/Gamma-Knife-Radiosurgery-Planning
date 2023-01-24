function radial_distance = Compute_Radial_Distance(point_of_interest, beam_index)
% Compute_Radial_Distance returns the radial distance between an arbirtrary 
% point of interest and the center line of a specified beam
%
% INPUT:
%       point_of_interest - any arbitrary point
%       beam_index - the index of a beam from the beam structure array
% OUTPUT:
%       radial_distance - the computed radial distance in mm.

global PTV_CENTRE
global beam_struct_array

v = beam_struct_array(beam_index,3:5);

intersection = Intersect_Line_and_Plane(point_of_interest, v, PTV_CENTRE, v);

radial_distance = norm(intersection - point_of_interest);

end