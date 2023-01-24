function beam_structure_array = Compute_Beam_Directions()
% Compute_Beam_Directions returns an array holding the longitude, latitude,
% and direction of every pencil the beams.
%
% INPUT:
%       None
% OUTPUT:
%       beam_structure_array - array containing the longitude, latitude,
%       and direction of every pencil the beams 


% declare global variables
global PTV_CENTRE;
global BEAM_SEP_ANGLE;

% initialize return variable
beam_structure_array = [];

% iterate through angles to create beam matrix
for latitude = 0:BEAM_SEP_ANGLE:90-BEAM_SEP_ANGLE
    [roty, ~] = Rotation_about_Frame_Axis("y", latitude);
    pt0 = roty * [1; 0; 0];
    for longitude = 0:BEAM_SEP_ANGLE:360-BEAM_SEP_ANGLE
        [rotz, ~] = Rotation_about_Frame_Axis("z", longitude);
        pt = rotz * pt0;
        
        pt = pt' + PTV_CENTRE;
        
        dirVec = PTV_CENTRE - pt;
        
        beam_structure_array = [beam_structure_array; longitude, latitude, dirVec];
    end
end
beam_structure_array = [beam_structure_array; 90, 0, [0,0,1]];

end