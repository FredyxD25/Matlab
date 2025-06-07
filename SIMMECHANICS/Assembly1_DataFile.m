% Simscape(TM) Multibody(TM) version: 24.2

% This is a model data file derived from a Simscape Multibody Import XML file using the smimport function.
% The data in this file sets the block parameter values in an imported Simscape Multibody model.
% For more information on this file, see the smimport function help page in the Simscape Multibody documentation.
% You can modify numerical values, but avoid any other changes to this file.
% Do not add code to this file. Do not edit the physical units shown in comments.

%%%VariableName:smiData


%============= RigidTransform =============%

%Initialize the RigidTransform structure array by filling in null values.
smiData.RigidTransform(2).translation = [0.0 0.0 0.0];
smiData.RigidTransform(2).angle = 0.0;
smiData.RigidTransform(2).axis = [0.0 0.0 0.0];
smiData.RigidTransform(2).ID = "";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(1).translation = [77.577286000000001 1.0424069999999999 10.005846999999999];  % mm
smiData.RigidTransform(1).angle = 0;  % rad
smiData.RigidTransform(1).axis = [0 0 0];
smiData.RigidTransform(1).ID = "SixDofRigidTransform[MUhknySmb63rby7vN]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(2).translation = [20.155304999999998 10.631478 28.730983000000002];  % mm
smiData.RigidTransform(2).angle = 0;  % rad
smiData.RigidTransform(2).axis = [0 0 0];
smiData.RigidTransform(2).ID = "SixDofRigidTransform[MsFx7CrB1vSVIJQSJ]";


%============= Solid =============%
%Center of Mass (CoM) %Moments of Inertia (MoI) %Product of Inertia (PoI)

%Initialize the Solid structure array by filling in null values.
smiData.Solid(2).mass = 0.0;
smiData.Solid(2).CoM = [0.0 0.0 0.0];
smiData.Solid(2).MoI = [0.0 0.0 0.0];
smiData.Solid(2).PoI = [0.0 0.0 0.0];
smiData.Solid(2).color = [0.0 0.0 0.0];
smiData.Solid(2).opacity = 0.0;
smiData.Solid(2).ID = "";

%Inertia Type - Custom
%Visual Properties - Simple
smiData.Solid(1).mass = 7.6177434377919537;  % lbm
smiData.Solid(1).CoM = [1.6000420000000002 -12.555695 -1.0987629999999999];  % mm
smiData.Solid(1).MoI = [5772.3876616354892 8993.0811666871723 9470.5737664855333];  % lbm*mm^2
smiData.Solid(1).PoI = [321.31713326659349 0 0];  % lbm*mm^2
smiData.Solid(1).color = [0.282352941 0.549019608 0.160784314];
smiData.Solid(1).opacity = 1.000000000;
smiData.Solid(1).ID = "JHD*:*8e6e022bd0f4e827dcf22234";

%Inertia Type - Custom
%Visual Properties - Simple
smiData.Solid(2).mass = 0.35390594643379913;  % lbm
smiData.Solid(2).CoM = [16.161785000000002 0 0];  % mm
smiData.Solid(2).MoI = [52.179008213916823 99.558552980068853 99.558552980068853];  % lbm*mm^2
smiData.Solid(2).PoI = [0 0 0];  % lbm*mm^2
smiData.Solid(2).color = [0.615686275 0.811764706 0.929411765];
smiData.Solid(2).opacity = 1.000000000;
smiData.Solid(2).ID = "JHD*:*2a22593eb91959a269767c0c";

