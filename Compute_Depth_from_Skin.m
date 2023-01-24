function depth_from_skin = Compute_Depth_from_Skin(point_of_interest, beam_index)
% Compute_Depth_from_Skin returns the distance from skin entry point of the
% center line of a beam and any point of interest
%
% INPUT:
%       point_of_interest - any arbitrary point
%       beam_index - the index of a beam from the beam structure array
% OUTPUT:
%       depth_from_skin - the computed relative skin depth in mm.

global PTV_CENTRE;
global beam_struct_array;

v = beam_struct_array(beam_index,3:5);

intersection = Intersect_Line_and_Plane(point_of_interest, v, PTV_CENTRE, v);

head_intersection = beam_struct_array(beam_index,6:8);
depth_from_skin = norm(intersection - head_intersection);

end