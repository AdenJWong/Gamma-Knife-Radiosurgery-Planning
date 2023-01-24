function radial_dose_function_table = Compute_Radial_Dose(resolution)
% Compute_Radial_Dose returns a table of radial beam leaked doses outisde
% the collimator. Explained by a linear function.
%
% INPUT:
%       resolution - the step size between each radial distance in the
%       table in mm
% OUTPUT:
%       radial_dose_function_table - the completed lookup table of
%       radial distances and absorped dosages

% initialize return variable
radial_dose_function_table = zeros(45/resolution+1,2);

% depth and counter
d = -22.5;
c = 1;

while (d <= 22.5)
    if d <= -7.5
        radial_dose_function_table(c,:) = [d, max((d + 22.5) * 1 / 15,0)];
    elseif d <= 7.5
        radial_dose_function_table(c,:) = [d, 1];  
    else
        radial_dose_function_table(c,:) = [d, max(1 - (d - 7.5) * 1 / 15,0)];
    end
    c = c + 1;
    d = d + resolution;
end

end