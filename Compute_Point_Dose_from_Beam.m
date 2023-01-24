function point_dose_value = Compute_Point_Dose_from_Beam(point_of_interest, beam_index)
% Compute_Point_Dose returns the dose at a point of interest of a beam
%
% INPUT:
%       point_of_interest - any arbitrary point
%       beam_index - the index of a beam from the beam structure array
% OUTPUT:
%       point_dose_value - the dose at the point of interest from the beam

% declare needed global variables
global daftable;
global rdftable;
global D_0;

d = round(Compute_Depth_from_Skin(point_of_interest, beam_index));
DAF = daftable(d + 1,2);

r = round(Compute_Radial_Distance(point_of_interest, beam_index));
if r >= 22.5 || r <= -22.5
    RDF = 0;
else
    RDF = rdftable(r + 24,2);
end

point_dose_value = D_0 * DAF * RDF;

end