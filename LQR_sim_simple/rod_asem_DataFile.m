% Simscape(TM) Multibody(TM) version: 7.5

% This is a model data file derived from a Simscape Multibody Import XML file using the smimport function.
% The data in this file sets the block parameter values in an imported Simscape Multibody model.
% For more information on this file, see the smimport function help page in the Simscape Multibody documentation.
% You can modify numerical values, but avoid any other changes to this file.
% Do not add code to this file. Do not edit the physical units shown in comments.

%%%VariableName:smiData


%============= RigidTransform =============%

%Initialize the RigidTransform structure array by filling in null values.
smiData.RigidTransform(8).translation = [0.0 0.0 0.0];
smiData.RigidTransform(8).angle = 0.0;
smiData.RigidTransform(8).axis = [0.0 0.0 0.0];
smiData.RigidTransform(8).ID = "";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(1).translation = [0 175 0];  % mm
smiData.RigidTransform(1).angle = 2.0943951023931953;  % rad
smiData.RigidTransform(1).axis = [0.57735026918962584 -0.57735026918962584 0.57735026918962584];
smiData.RigidTransform(1).ID = "B[carbon_fiber_rod_short-1:-:dummy_bearing-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(2).translation = [2.8421709430404007e-14 -175.00000000000006 -2.8421709430404007e-14];  % mm
smiData.RigidTransform(2).angle = 2.0943951023931953;  % rad
smiData.RigidTransform(2).axis = [-0.57735026918962584 -0.57735026918962584 -0.57735026918962584];
smiData.RigidTransform(2).ID = "F[carbon_fiber_rod_short-1:-:dummy_bearing-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(3).translation = [0 -10.500000000000007 -12.500000000000011];  % mm
smiData.RigidTransform(3).angle = 0;  % rad
smiData.RigidTransform(3).axis = [0 0 0];
smiData.RigidTransform(3).ID = "B[90_deg_bend-1:-:carbon_fiber_rod_short-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(4).translation = [-8.7041485130612273e-14 155.50000000000006 -5.6843418860808015e-14];  % mm
smiData.RigidTransform(4).angle = 3.1415926535897931;  % rad
smiData.RigidTransform(4).axis = [-5.5511151231257815e-17 0.70710678118654757 0.70710678118654757];
smiData.RigidTransform(4).ID = "F[90_deg_bend-1:-:carbon_fiber_rod_short-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(5).translation = [0 0 0];  % mm
smiData.RigidTransform(5).angle = 0;  % rad
smiData.RigidTransform(5).axis = [0 0 0];
smiData.RigidTransform(5).ID = "B[dummy_bearing-1:-:]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(6).translation = [0 0 0];  % mm
smiData.RigidTransform(6).angle = 2.0943951023931953;  % rad
smiData.RigidTransform(6).axis = [-0.57735026918962584 0.57735026918962584 -0.57735026918962584];
smiData.RigidTransform(6).ID = "F[dummy_bearing-1:-:]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(7).translation = [0 -10.500000000000007 -12.500000000000011];  % mm
smiData.RigidTransform(7).angle = 0;  % rad
smiData.RigidTransform(7).axis = [0 0 0];
smiData.RigidTransform(7).ID = "B[90_deg_bend-1:-:carbon_fiber_rod-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(8).translation = [-3.4106051316484809e-13 -255.00000000000128 -12.5];  % mm
smiData.RigidTransform(8).angle = 0;  % rad
smiData.RigidTransform(8).axis = [0 0 0];
smiData.RigidTransform(8).ID = "F[90_deg_bend-1:-:carbon_fiber_rod-1]";


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
smiData.Solid(1).mass = 0.0099164983780856732;  % kg
smiData.Solid(1).CoM = [3.066712567995758e-05 0.097157934759746309 -0.00028534444498437599];  % mm
smiData.Solid(1).MoI = [1.2812767894592099 0.34798836922945037 1.3145502619422975];  % kg*mm^2
smiData.Solid(1).PoI = [2.1996471148157791e-05 -3.9529518403615961e-05 -1.8183024588597063e-06];  % kg*mm^2
smiData.Solid(1).color = [1 0.94901960784313721 0.89803921568627454];
smiData.Solid(1).opacity = 1;
smiData.Solid(1).ID = "90_deg_bend*:*Default";

%Inertia Type - Custom
%Visual Properties - Simple
smiData.Solid(2).mass = 0.019792033717615697;  % kg
smiData.Solid(2).CoM = [0 0 0.28191397282155706];  % mm
smiData.Solid(2).MoI = [202.24408809594334 0.40327890755542545 202.24654587959901];  % kg*mm^2
smiData.Solid(2).PoI = [0 0 0];  % kg*mm^2
smiData.Solid(2).color = [0.25098039215686274 0.25098039215686274 0.25098039215686274];
smiData.Solid(2).opacity = 1;
smiData.Solid(2).ID = "carbon_fiber_rod_short*:*Default";

%Inertia Type - Custom
%Visual Properties - Simple
smiData.Solid(3).mass = 0.011943078631886962;  % kg
smiData.Solid(3).CoM = [0 0 0];  % mm
smiData.Solid(3).MoI = [1.8133574389415039 0.44189390937981743 1.8133574389415039];  % kg*mm^2
smiData.Solid(3).PoI = [0 0 0];  % kg*mm^2
smiData.Solid(3).color = [1 0.94901960784313721 0.89803921568627454];
smiData.Solid(3).opacity = 1;
smiData.Solid(3).ID = "dummy_bearing*:*Default";

%Inertia Type - Custom
%Visual Properties - Simple
smiData.Solid(4).mass = 0.028274333882308156;  % kg
smiData.Solid(4).CoM = [0 0 0.28191397282155678];  % mm
smiData.Solid(4).MoI = [589.33492335087237 0.57611272507917932 589.33843447038043];  % kg*mm^2
smiData.Solid(4).PoI = [0 0 0];  % kg*mm^2
smiData.Solid(4).color = [0.25098039215686274 0.25098039215686274 0.25098039215686274];
smiData.Solid(4).opacity = 1;
smiData.Solid(4).ID = "carbon_fiber_rod*:*Default";


%============= Joint =============%
%X Revolute Primitive (Rx) %Y Revolute Primitive (Ry) %Z Revolute Primitive (Rz)
%X Prismatic Primitive (Px) %Y Prismatic Primitive (Py) %Z Prismatic Primitive (Pz) %Spherical Primitive (S)
%Constant Velocity Primitive (CV) %Lead Screw Primitive (LS)
%Position Target (Pos)

%Initialize the RevoluteJoint structure array by filling in null values.
smiData.RevoluteJoint(1).Rz.Pos = 0.0;
smiData.RevoluteJoint(1).ID = "";
%Initial angle:
smiData.RevoluteJoint(1).Rz.Pos = -95; %178.75153344422759;  % deg 
smiData.RevoluteJoint(1).ID = "[carbon_fiber_rod_short-1:-:dummy_bearing-1]";

