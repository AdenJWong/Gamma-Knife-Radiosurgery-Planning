% initial global variables
global D_0;
D_0 = 1;

global D_100;
D_100 = 20;

global D_OARMAX;
D_OARMAX = 10;

global BEAM_SEP_ANGLE;
BEAM_SEP_ANGLE = 30;
global BEAM_DIAM;
BEAM_DIAM = 30;

global PTV_RAD;
PTV_RAD = 15;
global PTV_CENTRE;
PTV_CENTRE = [30, 0, 15];

global OAR_A;
OAR_A = 15;
global OAR_B;
OAR_B = 25;
global OAR_C;
OAR_C = 15;
global OAR_CENTRE;
OAR_CENTRE = [0, 30, 45];

global HEAD_A;
HEAD_A = 80;
global HEAD_B;
HEAD_B = 100;
global HEAD_C;
HEAD_C = 80;
global HEAD_CENTRE;
HEAD_CENTRE = [0,0,0];

%initalize global variables that are returned from created functions
global daftable;
global rdftable;
global beam_struct_array;

% function tests

% Draw_3D_Scene test
figure(1);
Draw_3D_Scene();

% Compute_Depth_Dose test
daftable = Compute_Depth_Dose(1, 200)

% Compute_Radial_Dose test
rdftable = Compute_Radial_Dose(1)

% Compute_Beam_Directions test
figure(2);
beam_struct_array = Compute_Beam_Directions();
[N, ~] = size(beam_struct_array);

% plot beams on 3D visualization
Draw_3D_Scene();
hold on;
grid on;
axis equal;
xlabel("X Axis");
ylabel("Y Axis");
zlabel("Z Axis");
title("Beam trajectories")

for i = 1:N
    vec_beam = beam_struct_array(i,3:5);
    beam_start = PTV_CENTRE + 125 * vec_beam;
    beam_end = PTV_CENTRE - 20 * vec_beam;
    
    plot3([beam_start(1), beam_end(1)],[beam_start(2), beam_end(2)],[beam_start(3), beam_end(3)]);
end
hold off;

% Compute_Skin_Entry_Points test
figure(3);
Compute_Skin_Entry_Points()
Draw_3D_Scene();
hold on;
grid on;
axis equal;
xlabel("X Axis");
ylabel("Y Axis");
zlabel("Z Axis");
title("Beam trajectories")

% plot beams and intersection points on 3D visualization
for i = 1:N
    vec_beam = beam_struct_array(i,3:5);
    beam_start = PTV_CENTRE + 125 * vec_beam;
    beam_end = PTV_CENTRE - 20 * vec_beam;
    
    plot3([beam_start(1), beam_end(1)],[beam_start(2), beam_end(2)],[beam_start(3), beam_end(3)]);

    intersection = beam_struct_array(i, 6:8);
    plot3(intersection(1),intersection(2),intersection(3),'m.','MarkerSize',10);
end
hold off;

% Compute_Beam_Safety_Flags
figure(4);
Compute_Beam_Safety_Flags()
Compute_Skin_Entry_Points()
Draw_3D_Scene();
hold on;
grid on;
axis equal;
xlabel("X Axis");
ylabel("Y Axis");
zlabel("Z Axis");
title("Beam trajectories")

% plot beams and intersection points on 3D visualization
for i = 1:N
    vec_beam = beam_struct_array(i,3:5);
    beam_start = PTV_CENTRE + 125 * vec_beam;
    beam_end = PTV_CENTRE - 20 * vec_beam;

    if beam_struct_array(i, 10) == 0
        plot3([beam_start(1), beam_end(1)],[beam_start(2), beam_end(2)],[beam_start(3), beam_end(3)]);

        intersection = beam_struct_array(i, 6:8);
        plot3(intersection(1),intersection(2),intersection(3),'m.','MarkerSize',10);
    end
end
hold off;

% Compute_Radial_Distance test
radial_dist = Compute_Radial_Distance(PTV_CENTRE + [PTV_RAD,0,0], size(beam_struct_array,1))

% Compute_Depth_from_Skin test
depth_from_skin = Compute_Depth_from_Skin(PTV_CENTRE + [PTV_RAD,0,0], size(beam_struct_array,1))

% Compute_Point_Dose_from_Beam test
for i = 1:N
    flag = 0;
    d = round(Compute_Depth_from_Skin(PTV_CENTRE, i));
    daf = daftable(d+1,2);
    
    pointdose = Compute_Point_Dose_from_Beam(PTV_CENTRE, i);
    
    if pointdose ~= daf
        flag = 1;
        disp("Dose from beam is incorrect")
        fprintf("\n")
        break
    end
end

if flag == 0
    disp("Dose from beam is correct")
    fprintf("\n")
end

% Compute_Point_Dose_from_All_Beams test
sum_DAF = 0;
for i = 1:N
    if beam_struct_array(i, 10) == 1
        d = round(Compute_Depth_from_Skin(PTV_CENTRE, i));
        DAF = daftable(d+1,2);

        sum_DAF = sum_DAF + DAF;
    end
end

NetPD = Compute_Point_Dose_from_All_Beams(PTV_CENTRE);

if NetPD == sum_DAF
    disp("Dose from all beams is correct")
    fprintf("\n")
else
    disp("Dose from all beams is incorrect")
    fprintf("\n")
end

% Compute_Surface_Dose_PTV test
Compute_Surface_Dose_PTV();

% Compute_Surface_Dose_OAR test
Compute_Surface_Dose_OAR();

fprintf("Please be patient, the figures will load shortly")
fprintf("\n")

% Compute_Volume_Dose_PTV test
Compute_Volume_Dose_PTV();

% Compute_Volume_Dose_OAR test
Compute_Volume_Dose_OAR();