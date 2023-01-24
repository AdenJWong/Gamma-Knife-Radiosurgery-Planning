function Compute_Volume_Dose_PTV()
% Compute_Volume_Dose_PTV computes the dose inside the function by creating
% a uniform cartesian grid within the structure and iterating through the
% points within the grid. A dose volume histogram is then plotted.
%
% INPUT:
%       None.
% OUPUT:
%       None.

% declare global variables
global PTV_CENTRE;
global PTV_RAD;


% Create "grid" from center of PTV for all points in the volume of PTV
X = PTV_CENTRE(1);
Y = PTV_CENTRE(2);
Z = PTV_CENTRE(3);
dose_list = [];

while (X - PTV_CENTRE(1))^2 + (Y - PTV_CENTRE(2))^2 + (Z - PTV_CENTRE(3))^2 <= PTV_RAD^2
    while (X - PTV_CENTRE(1))^2 + (Y - PTV_CENTRE(2))^2 + (Z - PTV_CENTRE(3))^2 <= PTV_RAD^2
        while (X - PTV_CENTRE(1))^2 + (Y - PTV_CENTRE(2))^2 + (Z - PTV_CENTRE(3))^2 <= PTV_RAD^2
            dose_list = [dose_list; Compute_Point_Dose_from_All_Beams([X, Y, Z])];
            X = X + 1;
        end
        X = PTV_CENTRE(1);
        Y = Y + 1;
    end
    X = PTV_CENTRE(1);
    Y = PTV_CENTRE(2);
    Z = Z + 1;
end

X = PTV_CENTRE(1);
Y = PTV_CENTRE(2);
Z = PTV_CENTRE(3);

while (X - PTV_CENTRE(1))^2 + (Y - PTV_CENTRE(2))^2 + (Z - PTV_CENTRE(3))^2 <= PTV_RAD^2
    while (X - PTV_CENTRE(1))^2 + (Y - PTV_CENTRE(2))^2 + (Z - PTV_CENTRE(3))^2 <= PTV_RAD^2
        while (X - PTV_CENTRE(1))^2 + (Y - PTV_CENTRE(2))^2 + (Z - PTV_CENTRE(3))^2 <= PTV_RAD^2
            dose_list = [dose_list; Compute_Point_Dose_from_All_Beams([X, Y, Z])];
            X = X - 1;
        end
        X = PTV_CENTRE(1);
        Y = Y - 1;
    end
    X = PTV_CENTRE(1);
    Y = PTV_CENTRE(2);
    Z = Z - 1;
end

X = PTV_CENTRE(1);
Y = PTV_CENTRE(2);
Z = PTV_CENTRE(3);

while (X - PTV_CENTRE(1))^2 + (Y - PTV_CENTRE(2))^2 + (Z - PTV_CENTRE(3))^2 <= PTV_RAD^2
    while (X - PTV_CENTRE(1))^2 + (Y - PTV_CENTRE(2))^2 + (Z - PTV_CENTRE(3))^2 <= PTV_RAD^2
        while (X - PTV_CENTRE(1))^2 + (Y - PTV_CENTRE(2))^2 + (Z - PTV_CENTRE(3))^2 <= PTV_RAD^2
            dose_list = [dose_list; Compute_Point_Dose_from_All_Beams([X, Y, Z])];
            X = X - 1;
        end
        X = PTV_CENTRE(1);
        Y = Y + 1;
    end
    X = PTV_CENTRE(1);
    Y = PTV_CENTRE(2);
    Z = Z + 1;
end

X = PTV_CENTRE(1);
Y = PTV_CENTRE(2);
Z = PTV_CENTRE(3);

while (X - PTV_CENTRE(1))^2 + (Y - PTV_CENTRE(2))^2 + (Z - PTV_CENTRE(3))^2 <= PTV_RAD^2
    while (X - PTV_CENTRE(1))^2 + (Y - PTV_CENTRE(2))^2 + (Z - PTV_CENTRE(3))^2 <= PTV_RAD^2
        while (X - PTV_CENTRE(1))^2 + (Y - PTV_CENTRE(2))^2 + (Z - PTV_CENTRE(3))^2 <= PTV_RAD^2
            dose_list = [dose_list; Compute_Point_Dose_from_All_Beams([X, Y, Z])];
            X = X - 1;
        end
        X = PTV_CENTRE(1);
        Y = Y - 1;
    end
    X = PTV_CENTRE(1);
    Y = PTV_CENTRE(2);
    Z = Z + 1;
end

X = PTV_CENTRE(1);
Y = PTV_CENTRE(2);
Z = PTV_CENTRE(3);

while (X - PTV_CENTRE(1))^2 + (Y - PTV_CENTRE(2))^2 + (Z - PTV_CENTRE(3))^2 <= PTV_RAD^2
    while (X - PTV_CENTRE(1))^2 + (Y - PTV_CENTRE(2))^2 + (Z - PTV_CENTRE(3))^2 <= PTV_RAD^2
        while (X - PTV_CENTRE(1))^2 + (Y - PTV_CENTRE(2))^2 + (Z - PTV_CENTRE(3))^2 <= PTV_RAD^2
            dose_list = [dose_list; Compute_Point_Dose_from_All_Beams([X, Y, Z])];
            X = X + 1;
        end
        X = PTV_CENTRE(1);
        Y = Y + 1;
    end
    X = PTV_CENTRE(1);
    Y = PTV_CENTRE(2);
    Z = Z - 1;
end

X = PTV_CENTRE(1);
Y = PTV_CENTRE(2);
Z = PTV_CENTRE(3);

while (X - PTV_CENTRE(1))^2 + (Y - PTV_CENTRE(2))^2 + (Z - PTV_CENTRE(3))^2 <= PTV_RAD^2
    while (X - PTV_CENTRE(1))^2 + (Y - PTV_CENTRE(2))^2 + (Z - PTV_CENTRE(3))^2 <= PTV_RAD^2
        while (X - PTV_CENTRE(1))^2 + (Y - PTV_CENTRE(2))^2 + (Z - PTV_CENTRE(3))^2 <= PTV_RAD^2
            dose_list = [dose_list; Compute_Point_Dose_from_All_Beams([X, Y, Z])];
            X = X + 1;
        end
        X = PTV_CENTRE(1);
        Y = Y - 1;
    end
    X = PTV_CENTRE(1);
    Y = PTV_CENTRE(2);
    Z = Z - 1;
end

X = PTV_CENTRE(1);
Y = PTV_CENTRE(2);
Z = PTV_CENTRE(3);

while (X - PTV_CENTRE(1))^2 + (Y - PTV_CENTRE(2))^2 + (Z - PTV_CENTRE(3))^2 <= PTV_RAD^2
    while (X - PTV_CENTRE(1))^2 + (Y - PTV_CENTRE(2))^2 + (Z - PTV_CENTRE(3))^2 <= PTV_RAD^2
        while (X - PTV_CENTRE(1))^2 + (Y - PTV_CENTRE(2))^2 + (Z - PTV_CENTRE(3))^2 <= PTV_RAD^2
            dose_list = [dose_list; Compute_Point_Dose_from_All_Beams([X, Y, Z])];
            X = X - 1;
        end
        X = PTV_CENTRE(1);
        Y = Y + 1;
    end
    X = PTV_CENTRE(1);
    Y = PTV_CENTRE(2);
    Z = Z - 1;
end

X = PTV_CENTRE(1);
Y = PTV_CENTRE(2);
Z = PTV_CENTRE(3);

while (X - PTV_CENTRE(1))^2 + (Y - PTV_CENTRE(2))^2 + (Z - PTV_CENTRE(3))^2 <= PTV_RAD^2
    while (X - PTV_CENTRE(1))^2 + (Y - PTV_CENTRE(2))^2 + (Z - PTV_CENTRE(3))^2 <= PTV_RAD^2
        while (X - PTV_CENTRE(1))^2 + (Y - PTV_CENTRE(2))^2 + (Z - PTV_CENTRE(3))^2 <= PTV_RAD^2
            dose_list = [dose_list; Compute_Point_Dose_from_All_Beams([X, Y, Z])];
            X = X + 1;
        end
        X = PTV_CENTRE(1);
        Y = Y - 1;
    end
    X = PTV_CENTRE(1);
    Y = PTV_CENTRE(2);
    Z = Z + 1;
end
 
% Remove Non-Unique points
dose_list = unique(dose_list, 'rows');

PVTMax = zeros(140,1);

for i = 1:size(dose_list,1)
    idx = round(dose_list(i)/20*100);
    PVTMax(idx+1) = PVTMax(idx+1) + 1;
end

total = sum(PVTMax);
yval = PVTMax;


for i = 1:140
    ratio = sum(PVTMax(1:i-1));
    yval(i) = (total - ratio) / total * 100;
end

% Plot
figure(7)
plot((1:140).', yval, '.-');
grid on;
xlabel("ratio of total structure volume")
ylabel("relative dose")
title("PTV Dose Volume Histogram")

end