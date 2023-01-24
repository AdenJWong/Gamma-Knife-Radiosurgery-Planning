function point_dose_value = Compute_Point_Dose_from_All_Beams(point_of_interest)
% Compute_Point_Dose_from_All_Beams computes the overall sum of all beam 
% dosages at a point ofinterest
%
% INPUT:
%       point_of_interest - any arbitrary point
% OUTPUT:
%       point_dose_value - the sum of dosage from all safe beams at point

global beam_struct_array;
[N,~] = size(beam_struct_array);

point_dose_value = 0;
for i = 1:N
    if beam_struct_array(i, 10) == 1
        point_dose_value = point_dose_value + Compute_Point_Dose_from_Beam(point_of_interest, i);
    end
end
end