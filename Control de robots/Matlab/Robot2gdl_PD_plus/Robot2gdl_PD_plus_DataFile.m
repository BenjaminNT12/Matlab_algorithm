% Simscape(TM) Multibody(TM) version: 7.5

% This is a model data file derived from a Simscape Multibody Import XML file using the smimport function.
% The data in this file sets the block parameter values in an imported Simscape Multibody model.
% For more information on this file, see the smimport function help page in the Simscape Multibody documentation.
% You can modify numerical values, but avoid any other changes to this file.
% Do not add code to this file. Do not edit the physical units shown in comments.

%%%VariableName:smiData


%============= RigidTransform =============%

%Initialize the RigidTransform structure array by filling in null values.
smiData.RigidTransform(5).translation = [0.0 0.0 0.0];
smiData.RigidTransform(5).angle = 0.0;
smiData.RigidTransform(5).axis = [0.0 0.0 0.0];
smiData.RigidTransform(5).ID = "";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(1).translation = [15.000000000000007 -203.30000000000004 18.000000000000004];  % mm
smiData.RigidTransform(1).angle = 3.1415926535897931;  % rad
smiData.RigidTransform(1).axis = [1 0 0];
smiData.RigidTransform(1).ID = "B[Part1-1:-:Part2-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(2).translation = [14.999999999999936 203.30000000000004 11.000000000000007];  % mm
smiData.RigidTransform(2).angle = 3.1415926535897931;  % rad
smiData.RigidTransform(2).axis = [1 0 0];
smiData.RigidTransform(2).ID = "F[Part1-1:-:Part2-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(3).translation = [15.000000000000016 -10.000000000000002 5.9999999999999982];  % mm
smiData.RigidTransform(3).angle = 0;  % rad
smiData.RigidTransform(3).axis = [0 0 0];
smiData.RigidTransform(3).ID = "B[Part1-1:-:Part3-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(4).translation = [24.999999999999627 25.00000000000087 17];  % mm
smiData.RigidTransform(4).angle = 0;  % rad
smiData.RigidTransform(4).axis = [0 0 0];
smiData.RigidTransform(4).ID = "F[Part1-1:-:Part3-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(5).translation = [-7.7756027675302262 22.134275413483831 12.343445214977471];  % mm
smiData.RigidTransform(5).angle = 0;  % rad
smiData.RigidTransform(5).axis = [0 0 0];
smiData.RigidTransform(5).ID = "RootGround[Part3-1]";


%============= Solid =============%
%Center of Mass (CoM) %Moments of Inertia (MoI) %Product of Inertia (PoI)

%Initialize the Solid structure array by filling in null values.
smiData.Solid(3).mass = 0.0;
smiData.Solid(3).CoM = [0.0 0.0 0.0];
smiData.Solid(3).MoI = [0.0 0.0 0.0];
smiData.Solid(3).PoI = [0.0 0.0 0.0];
smiData.Solid(3).color = [0.0 0.0 0.0];
smiData.Solid(3).opacity = 0.0;
smiData.Solid(3).ID = "";

%Inertia Type - Custom
%Visual Properties - Simple
smiData.Solid(1).mass = 0.030908157371579786;  % kg
smiData.Solid(1).CoM = [15.000000000000004 127.29337542606211 2.9999999999999996];  % mm
smiData.Solid(1).MoI = [138.5041402170931 3.3746625933505308 141.69335386621415];  % kg*mm^2
smiData.Solid(1).PoI = [0 0 0.02214566097794099];  % kg*mm^2
smiData.Solid(1).color = [0.65098039215686276 0.61960784313725492 0.58823529411764708];
smiData.Solid(1).opacity = 1;
smiData.Solid(1).ID = "Part2*:*Default";

%Inertia Type - Custom
%Visual Properties - Simple
smiData.Solid(2).mass = 0.025182356619683124;  % kg
smiData.Solid(2).CoM = [25.00266515623354 24.733742817428681 5.6661848620258555];  % mm
smiData.Solid(2).MoI = [5.4014604850557868 5.2007951654640694 9.7703565850972236];  % kg*mm^2
smiData.Solid(2).PoI = [-0.0044667583906267787 4.471094020263772e-05 0.0019915279519275193];  % kg*mm^2
smiData.Solid(2).color = [0.7803921568627451 0.76078431372549016 0.74117647058823533];
smiData.Solid(2).opacity = 1;
smiData.Solid(2).ID = "Part3*:*Default";

%Inertia Type - Custom
%Visual Properties - Simple
smiData.Solid(3).mass = 0.032513094467372911;  % kg
smiData.Solid(3).CoM = [15.006295040694928 -113.50153306749473 3.4348145623401329];  % mm
smiData.Solid(3).MoI = [198.49043137846553 4.1738726020916319 202.15655316177813];  % kg*mm^2
smiData.Solid(3).PoI = [1.2694959180845313 8.8994041204930969e-05 0.012421508245358034];  % kg*mm^2
smiData.Solid(3).color = [0.77647058823529413 0.75686274509803919 0.73725490196078436];
smiData.Solid(3).opacity = 1;
smiData.Solid(3).ID = "Part1*:*Default";


%============= Joint =============%
%X Revolute Primitive (Rx) %Y Revolute Primitive (Ry) %Z Revolute Primitive (Rz)
%X Prismatic Primitive (Px) %Y Prismatic Primitive (Py) %Z Prismatic Primitive (Pz) %Spherical Primitive (S)
%Constant Velocity Primitive (CV) %Lead Screw Primitive (LS)
%Position Target (Pos)

%Initialize the RevoluteJoint structure array by filling in null values.
smiData.RevoluteJoint(2).Rz.Pos = 0.0;
smiData.RevoluteJoint(2).ID = "";

smiData.RevoluteJoint(1).Rz.Pos = -55.273559273480963;  % deg
smiData.RevoluteJoint(1).ID = "[Part1-1:-:Part2-1]";

smiData.RevoluteJoint(2).Rz.Pos = 49.553098945085097;  % deg
smiData.RevoluteJoint(2).ID = "[Part1-1:-:Part3-1]";

