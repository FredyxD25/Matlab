% Simscape(TM) Multibody(TM) version: 24.2

% This is a model data file derived from a Simscape Multibody Import XML file using the smimport function.
% The data in this file sets the block parameter values in an imported Simscape Multibody model.
% For more information on this file, see the smimport function help page in the Simscape Multibody documentation.
% You can modify numerical values, but avoid any other changes to this file.
% Do not add code to this file. Do not edit the physical units shown in comments.

%%%VariableName:smiData


%============= RigidTransform =============%

%Initialize the RigidTransform structure array by filling in null values.
smiData.RigidTransform(7).translation = [0.0 0.0 0.0];
smiData.RigidTransform(7).angle = 0.0;
smiData.RigidTransform(7).axis = [0.0 0.0 0.0];
smiData.RigidTransform(7).ID = "";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(1).translation = [6.1085925590551184 -2 0.032238346456692914];  % in
smiData.RigidTransform(1).angle = 1.5707963267948968;  % rad
smiData.RigidTransform(1).axis = [-1 -0 -0];
smiData.RigidTransform(1).ID = "B[M/K7rTYMuMwsSXdK1:-:MEQnY2OkqSJ2thHTx]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(2).translation = [-4.4799587401574801 2 0.63803275590551178];  % in
smiData.RigidTransform(2).angle = 1.5707963267948968;  % rad
smiData.RigidTransform(2).axis = [1 0 0];
smiData.RigidTransform(2).ID = "F[M/K7rTYMuMwsSXdK1:-:MEQnY2OkqSJ2thHTx]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(3).translation = [-7.136426929133858 -0.032072598425196851 8.4099120866141739];  % in
smiData.RigidTransform(3).angle = 2.0943951023931953;  % rad
smiData.RigidTransform(3).axis = [0.57735026918962584 -0.57735026918962584 -0.57735026918962584];
smiData.RigidTransform(3).ID = "B[MwX76sAhUUl0ATZOP:-:M/K7rTYMuMwsSXdK1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(4).translation = [-3.8914074409448824 -4 0.032238346456692914];  % in
smiData.RigidTransform(4).angle = 1.5707963267948968;  % rad
smiData.RigidTransform(4).axis = [1 0 0];
smiData.RigidTransform(4).ID = "F[MwX76sAhUUl0ATZOP:-:M/K7rTYMuMwsSXdK1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(5).translation = [0.54798433070866137 -2 0.63803275590551178];  % in
smiData.RigidTransform(5).angle = 3.1415926535897931;  % rad
smiData.RigidTransform(5).axis = [-0 -0.70710678118654746 0.70710678118654757];
smiData.RigidTransform(5).ID = "B[MEQnY2OkqSJ2thHTx:-:M3UL7lgLBpc18H8OC]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(6).translation = [-3.1145768503937012 -0.75000000000000011 3.8400725984251971];  % in
smiData.RigidTransform(6).angle = 2.0943951023931953;  % rad
smiData.RigidTransform(6).axis = [-0.57735026918962584 -0.57735026918962584 0.57735026918962584];
smiData.RigidTransform(6).ID = "F[MEQnY2OkqSJ2thHTx:-:M3UL7lgLBpc18H8OC]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(7).translation = [1.1000552755905513 0.10938007874015748 1.2144503149606301];  % in
smiData.RigidTransform(7).angle = 0;  % rad
smiData.RigidTransform(7).axis = [0 0 0];
smiData.RigidTransform(7).ID = "RootGround[MwX76sAhUUl0ATZOP]";


%============= Solid =============%
%Center of Mass (CoM) %Moments of Inertia (MoI) %Product of Inertia (PoI)

%Initialize the Solid structure array by filling in null values.
smiData.Solid(4).mass = 0.0;
smiData.Solid(4).CoM = [0.0 0.0 0.0];
smiData.Solid(4).MoI = [0.0 0.0 0.0];
smiData.Solid(4).PoI = [0.0 0.0 0.0];
smiData.Solid(4).color = [0.0 0.0 0.0];
smiData.Solid(4).opacity = 0.0;
smiData.Solid(4).ID = "";

%Inertia Type - Custom
%Visual Properties - Simple
smiData.Solid(1).mass = 0;  % lbm
smiData.Solid(1).CoM = [0 0 0];  % in
smiData.Solid(1).MoI = [0 0 0];  % lbm*in^2
smiData.Solid(1).PoI = [0 0 0];  % lbm*in^2
smiData.Solid(1).color = [0.603921569 0.647058824 0.686274510];
smiData.Solid(1).opacity = 1.000000000;
smiData.Solid(1).ID = "JHD*:*edffe19ffc072f0db545f238";

%Inertia Type - Custom
%Visual Properties - Simple
smiData.Solid(2).mass = 0;  % lbm
smiData.Solid(2).CoM = [0 0 0];  % in
smiData.Solid(2).MoI = [0 0 0];  % lbm*in^2
smiData.Solid(2).PoI = [0 0 0];  % lbm*in^2
smiData.Solid(2).color = [0.603921569 0.647058824 0.686274510];
smiData.Solid(2).opacity = 1.000000000;
smiData.Solid(2).ID = "JHD*:*a4ffbe38140fd673c87b9bc3";

%Inertia Type - Custom
%Visual Properties - Simple
smiData.Solid(3).mass = 0;  % lbm
smiData.Solid(3).CoM = [0 0 0];  % in
smiData.Solid(3).MoI = [0 0 0];  % lbm*in^2
smiData.Solid(3).PoI = [0 0 0];  % lbm*in^2
smiData.Solid(3).color = [0.603921569 0.647058824 0.686274510];
smiData.Solid(3).opacity = 1.000000000;
smiData.Solid(3).ID = "JHD*:*52771f1f9efb48df6b538956";

%Inertia Type - Custom
%Visual Properties - Simple
smiData.Solid(4).mass = 0;  % lbm
smiData.Solid(4).CoM = [0 0 0];  % in
smiData.Solid(4).MoI = [0 0 0];  % lbm*in^2
smiData.Solid(4).PoI = [0 0 0];  % lbm*in^2
smiData.Solid(4).color = [0.603921569 0.647058824 0.686274510];
smiData.Solid(4).opacity = 1.000000000;
smiData.Solid(4).ID = "JHD*:*cc2bfa6de98c8c34ad4b5dbe";


%============= Joint =============%
%X Revolute Primitive (Rx) %Y Revolute Primitive (Ry) %Z Revolute Primitive (Rz)
%X Prismatic Primitive (Px) %Y Prismatic Primitive (Py) %Z Prismatic Primitive (Pz) %Spherical Primitive (S)
%Constant Velocity Primitive (CV) %Lead Screw Primitive (LS)
%Position Target (Pos)

%Initialize the RevoluteJoint structure array by filling in null values.
smiData.RevoluteJoint(3).Rz.Pos = 0.0;
smiData.RevoluteJoint(3).ID = "";

smiData.RevoluteJoint(1).Rz.Pos = 71.243410694317404;  % deg
smiData.RevoluteJoint(1).ID = "[M/K7rTYMuMwsSXdK1:-:MEQnY2OkqSJ2thHTx]";

smiData.RevoluteJoint(2).Rz.Pos = 108.31329895362057;  % deg
smiData.RevoluteJoint(2).ID = "[MwX76sAhUUl0ATZOP:-:M/K7rTYMuMwsSXdK1]";

smiData.RevoluteJoint(3).Rz.Pos = 103.81429169294407;  % deg
smiData.RevoluteJoint(3).ID = "[MEQnY2OkqSJ2thHTx:-:M3UL7lgLBpc18H8OC]";

