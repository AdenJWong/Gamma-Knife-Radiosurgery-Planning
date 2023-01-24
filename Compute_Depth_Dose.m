function dose_absorption_function_table = Compute_Depth_Dose(resolution, maxDepth)
% Compute_Depth_Dose computes a dose absoprtion function table. The beam
% build-up is described approximately by a linar function.
%
% INPUT:
%       resolution - the step size between each depth in the table in mm
%       maxDepth - the maximum depth in mm
% OUTPUT:
%       dose_absorption_function_table - the completed lookup table of
%       depths and absorbed dosages

% initialize return variable
dose_absorption_function_table = zeros(maxDepth / resolution + 1, 2);

d = 0;
while (d <= maxDepth)
    pos = round(d / resolution) + 1;
    if (d <= 20)
        dose_absorption_function_table(pos,:) = [d, 0.5 + 0.025 * d];
    else
        dose_absorption_function_table(pos,:) = [d, 1 - 0.005 * (d - 20)];
    end
    d = d + resolution;
end

end