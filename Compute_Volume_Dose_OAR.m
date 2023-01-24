function Compute_Volume_Dose_OAR()
% Compute_Volume_Dose_OAR computes the dose inside the function by creating
% a uniform cartesian grid within the structure and iterating through the
% points within the grid. A dose volume histogram is then plotted.
%
% INPUT:
%       None.
% OUPUT:
%       None.

% declare global variables
global OAR_A;
global OAR_B;
global OAR_C;
global OAR_CENTRE;


% Create "grid" from center of PTV for all points in the volume of PTV
X = OAR_CENTRE(1);
Y = OAR_CENTRE(2);
Z = OAR_CENTRE(3);
dose_list = [];

while (X-OAR_CENTRE(1))^2/OAR_A + (Y-OAR_CENTRE(2))^2/OAR_B +(Z-OAR_CENTRE(3))^2/OAR_C <= 1
    while (X-OAR_CENTRE(1))^2/OAR_A + (Y-OAR_CENTRE(2))^2/OAR_B +(Z-OAR_CENTRE(3))^2/OAR_C <= 1
        while (X-OAR_CENTRE(1))^2/OAR_A + (Y-OAR_CENTRE(2))^2/OAR_B +(Z-OAR_CENTRE(3))^2/OAR_C <= 1
            dose_list = [dose_list; Compute_Point_Dose_from_All_Beams([X, Y, Z])];
            X = X + 1;
        end
        X = OAR_CENTRE(1);
        Y = Y + 1;
    end
    X = OAR_CENTRE(1);
    Y = OAR_CENTRE(2);
    Z = Z + 1;
end

X = OAR_CENTRE(1);
Y = OAR_CENTRE(2);
Z = OAR_CENTRE(3);

while (X-OAR_CENTRE(1))^2/OAR_A + (Y-OAR_CENTRE(2))^2/OAR_B +(Z-OAR_CENTRE(3))^2/OAR_C <= 1
    while (X-OAR_CENTRE(1))^2/OAR_A + (Y-OAR_CENTRE(2))^2/OAR_B +(Z-OAR_CENTRE(3))^2/OAR_C <= 1
        while (X-OAR_CENTRE(1))^2/OAR_A + (Y-OAR_CENTRE(2))^2/OAR_B +(Z-OAR_CENTRE(3))^2/OAR_C <= 1
            dose_list = [dose_list; Compute_Point_Dose_from_All_Beams([X, Y, Z])];
            X = X - 1;
        end
        X = OAR_CENTRE(1);
        Y = Y - 1;
    end
    X = OAR_CENTRE(1);
    Y = OAR_CENTRE(2);
    Z = Z - 1;
end

X = OAR_CENTRE(1);
Y = OAR_CENTRE(2);
Z = OAR_CENTRE(3);

while (X-OAR_CENTRE(1))^2/OAR_A + (Y-OAR_CENTRE(2))^2/OAR_B +(Z-OAR_CENTRE(3))^2/OAR_C <= 1
    while (X-OAR_CENTRE(1))^2/OAR_A + (Y-OAR_CENTRE(2))^2/OAR_B +(Z-OAR_CENTRE(3))^2/OAR_C <= 1
        while (X-OAR_CENTRE(1))^2/OAR_A + (Y-OAR_CENTRE(2))^2/OAR_B +(Z-OAR_CENTRE(3))^2/OAR_C <= 1
            dose_list = [dose_list; Compute_Point_Dose_from_All_Beams([X, Y, Z])];
            X = X - 1;
        end
        X = OAR_CENTRE(1);
        Y = Y + 1;
    end
    X = OAR_CENTRE(1);
    Y = OAR_CENTRE(2);
    Z = Z + 1;
end

X = OAR_CENTRE(1);
Y = OAR_CENTRE(2);
Z = OAR_CENTRE(3);

while (X-OAR_CENTRE(1))^2/OAR_A + (Y-OAR_CENTRE(2))^2/OAR_B +(Z-OAR_CENTRE(3))^2/OAR_C <= 1
    while (X-OAR_CENTRE(1))^2/OAR_A + (Y-OAR_CENTRE(2))^2/OAR_B +(Z-OAR_CENTRE(3))^2/OAR_C <= 1
        while (X-OAR_CENTRE(1))^2/OAR_A + (Y-OAR_CENTRE(2))^2/OAR_B +(Z-OAR_CENTRE(3))^2/OAR_C <= 1
            dose_list = [dose_list; Compute_Point_Dose_from_All_Beams([X, Y, Z])];
            X = X - 1;
        end
        X = OAR_CENTRE(1);
        Y = Y - 1;
    end
    X = OAR_CENTRE(1);
    Y = OAR_CENTRE(2);
    Z = Z + 1;
end

X = OAR_CENTRE(1);
Y = OAR_CENTRE(2);
Z = OAR_CENTRE(3);

while (X-OAR_CENTRE(1))^2/OAR_A + (Y-OAR_CENTRE(2))^2/OAR_B +(Z-OAR_CENTRE(3))^2/OAR_C <= 1
    while (X-OAR_CENTRE(1))^2/OAR_A + (Y-OAR_CENTRE(2))^2/OAR_B +(Z-OAR_CENTRE(3))^2/OAR_C <= 1
        while (X-OAR_CENTRE(1))^2/OAR_A + (Y-OAR_CENTRE(2))^2/OAR_B +(Z-OAR_CENTRE(3))^2/OAR_C <= 1
            dose_list = [dose_list; Compute_Point_Dose_from_All_Beams([X, Y, Z])];
            X = X + 1;
        end
        X = OAR_CENTRE(1);
        Y = Y + 1;
    end
    X = OAR_CENTRE(1);
    Y = OAR_CENTRE(2);
    Z = Z - 1;
end

X = OAR_CENTRE(1);
Y = OAR_CENTRE(2);
Z = OAR_CENTRE(3);

while (X-OAR_CENTRE(1))^2/OAR_A + (Y-OAR_CENTRE(2))^2/OAR_B +(Z-OAR_CENTRE(3))^2/OAR_C <= 1
    while (X-OAR_CENTRE(1))^2/OAR_A + (Y-OAR_CENTRE(2))^2/OAR_B +(Z-OAR_CENTRE(3))^2/OAR_C <= 1
        while (X-OAR_CENTRE(1))^2/OAR_A + (Y-OAR_CENTRE(2))^2/OAR_B +(Z-OAR_CENTRE(3))^2/OAR_C <= 1
            dose_list = [dose_list; Compute_Point_Dose_from_All_Beams([X, Y, Z])];
            X = X + 1;
        end
        X = OAR_CENTRE(1);
        Y = Y - 1;
    end
    X = OAR_CENTRE(1);
    Y = OAR_CENTRE(2);
    Z = Z - 1;
end

X = OAR_CENTRE(1);
Y = OAR_CENTRE(2);
Z = OAR_CENTRE(3);

while (X-OAR_CENTRE(1))^2/OAR_A + (Y-OAR_CENTRE(2))^2/OAR_B +(Z-OAR_CENTRE(3))^2/OAR_C <= 1
    while (X-OAR_CENTRE(1))^2/OAR_A + (Y-OAR_CENTRE(2))^2/OAR_B +(Z-OAR_CENTRE(3))^2/OAR_C <= 1
        while (X-OAR_CENTRE(1))^2/OAR_A + (Y-OAR_CENTRE(2))^2/OAR_B +(Z-OAR_CENTRE(3))^2/OAR_C <= 1
            dose_list = [dose_list; Compute_Point_Dose_from_All_Beams([X, Y, Z])];
            X = X - 1;
        end
        X = OAR_CENTRE(1);
        Y = Y + 1;
    end
    X = OAR_CENTRE(1);
    Y = OAR_CENTRE(2);
    Z = Z - 1;
end

X = OAR_CENTRE(1);
Y = OAR_CENTRE(2);
Z = OAR_CENTRE(3);

while (X-OAR_CENTRE(1))^2/OAR_A + (Y-OAR_CENTRE(2))^2/OAR_B +(Z-OAR_CENTRE(3))^2/OAR_C <= 1
    while (X-OAR_CENTRE(1))^2/OAR_A + (Y-OAR_CENTRE(2))^2/OAR_B +(Z-OAR_CENTRE(3))^2/OAR_C <= 1
        while (X-OAR_CENTRE(1))^2/OAR_A + (Y-OAR_CENTRE(2))^2/OAR_B +(Z-OAR_CENTRE(3))^2/OAR_C <= 1
            dose_list = [dose_list; Compute_Point_Dose_from_All_Beams([X, Y, Z])];
            X = X + 1;
        end
        X = OAR_CENTRE(1);
        Y = Y - 1;
    end
    X = OAR_CENTRE(1);
    Y = OAR_CENTRE(2);
    Z = Z + 1;
end
 
% Remove Non-Unique points
dose_list = unique(dose_list, 'rows');

OARMax = zeros(80,1);

for i = 1:size(dose_list,1)
    idx = round(dose_list(i)/20*100);
    OARMax(idx+1) = OARMax(idx+1) + 1;
end

total = sum(OARMax);
yval = OARMax;


for i = 1:80
    ratio = sum(OARMax(1:i-1));
    yval(i) = (total - ratio) / total * 100;
end

% Plot
figure(8)
plot((1:80).', yval, '.-');
grid on;
xlabel("ratio of total structure volume")
ylabel("relative dose")
title("OAR Dose Volume Histogram")

end