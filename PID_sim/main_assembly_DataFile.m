% Simscape(TM) Multibody(TM) version: 7.5

% This is a model data file derived from a Simscape Multibody Import XML file using the smimport function.
% The data in this file sets the block parameter values in an imported Simscape Multibody model.
% For more information on this file, see the smimport function help page in the Simscape Multibody documentation.
% You can modify numerical values, but avoid any other changes to this file.
% Do not add code to this file. Do not edit the physical units shown in comments.

%%%VariableName:smiData


%============= RigidTransform =============%

%Initialize the RigidTransform structure array by filling in null values.
smiData.RigidTransform(20).translation = [0.0 0.0 0.0];
smiData.RigidTransform(20).angle = 0.0;
smiData.RigidTransform(20).axis = [0.0 0.0 0.0];
smiData.RigidTransform(20).ID = "";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(1).translation = [0 0 0];  % mm
smiData.RigidTransform(1).angle = 2.0943951023931953;  % rad
smiData.RigidTransform(1).axis = [-0.57735026918962584 -0.57735026918962584 -0.57735026918962584];
smiData.RigidTransform(1).ID = "B[carbon_rod-1:-:carbon_rod-2]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(2).translation = [124.99099188538679 100.00000000000048 -1.4210854715202004e-14];  % mm
smiData.RigidTransform(2).angle = 3.1415926535897909;  % rad
smiData.RigidTransform(2).axis = [0.70710678118654757 1.0512424264419449e-15 -0.70710678118654746];
smiData.RigidTransform(2).ID = "F[carbon_rod-1:-:carbon_rod-2]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(3).translation = [0 120.00000000000006 0];  % mm
smiData.RigidTransform(3).angle = 2.0943951023931953;  % rad
smiData.RigidTransform(3).axis = [0.57735026918962584 -0.57735026918962584 0.57735026918962584];
smiData.RigidTransform(3).ID = "B[carbon_rod-1:-:elbow-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(4).translation = [1.3233858453531866e-13 7.0090081146125396 -2.6645352591003757e-14];  % mm
smiData.RigidTransform(4).angle = 2.094395102393197;  % rad
smiData.RigidTransform(4).axis = [0.57735026918962651 -0.57735026918962484 0.57735026918962584];
smiData.RigidTransform(4).ID = "F[carbon_rod-1:-:elbow-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(5).translation = [0 120.00000000000006 0];  % mm
smiData.RigidTransform(5).angle = 2.0943951023931953;  % rad
smiData.RigidTransform(5).axis = [0.57735026918962584 -0.57735026918962584 0.57735026918962584];
smiData.RigidTransform(5).ID = "B[carbon_rod-1:-:elbow-2]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(6).translation = [-1.5987211554602254e-14 7.0090081146129828 -7.7271522513910895e-14];  % mm
smiData.RigidTransform(6).angle = 2.0943951023931953;  % rad
smiData.RigidTransform(6).axis = [0.57735026918962529 0.57735026918962618 -0.57735026918962562];
smiData.RigidTransform(6).ID = "F[carbon_rod-1:-:elbow-2]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(7).translation = [0 120.00000000000004 0];  % mm
smiData.RigidTransform(7).angle = 2.0943951023931953;  % rad
smiData.RigidTransform(7).axis = [0.57735026918962584 -0.57735026918962584 0.57735026918962584];
smiData.RigidTransform(7).ID = "B[carbon_rod-2:-:magnet_holder-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(8).translation = [0 0 237.00000000000006];  % mm
smiData.RigidTransform(8).angle = 3.1415926535897931;  % rad
smiData.RigidTransform(8).axis = [-0.70710678118654702 0.70710678118654802 5.5511151231257827e-17];
smiData.RigidTransform(8).ID = "F[carbon_rod-2:-:magnet_holder-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(9).translation = [0 120.00000000000004 0];  % mm
smiData.RigidTransform(9).angle = 2.0943951023931953;  % rad
smiData.RigidTransform(9).axis = [0.57735026918962584 -0.57735026918962584 0.57735026918962584];
smiData.RigidTransform(9).ID = "B[carbon_rod-2:-:elbow-2]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(10).translation = [19.999999999999904 11.999999999999645 -2.4868995751603507e-14];  % mm
smiData.RigidTransform(10).angle = 2.0943951023931939;  % rad
smiData.RigidTransform(10).axis = [-0.57735026918962651 -0.57735026918962529 0.57735026918962551];
smiData.RigidTransform(10).ID = "F[carbon_rod-2:-:elbow-2]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(11).translation = [0 20.000000000000004 0];  % mm
smiData.RigidTransform(11).angle = 2.0943951023931953;  % rad
smiData.RigidTransform(11).axis = [-0.57735026918962584 -0.57735026918962584 -0.57735026918962584];
smiData.RigidTransform(11).ID = "B[elbow-1:-:elbow-2]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(12).translation = [7.460698725481052e-14 20.000000000000448 -9.5923269327613525e-14];  % mm
smiData.RigidTransform(12).angle = 2.094395102393197;  % rad
smiData.RigidTransform(12).axis = [-0.57735026918962629 0.5773502691896244 0.57735026918962673];
smiData.RigidTransform(12).ID = "F[elbow-1:-:elbow-2]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(13).translation = [0 0 0];  % mm
smiData.RigidTransform(13).angle = 2.0943951023931953;  % rad
smiData.RigidTransform(13).axis = [-0.57735026918962584 -0.57735026918962584 -0.57735026918962584];
smiData.RigidTransform(13).ID = "B[dummy_base_bearing-1:-:]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(14).translation = [0 0 0];  % mm
smiData.RigidTransform(14).angle = 3.1415926535897931;  % rad
smiData.RigidTransform(14).axis = [0.70710678118654757 0.70710678118654757 -5.5511151231257839e-17];
smiData.RigidTransform(14).ID = "F[dummy_base_bearing-1:-:]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(15).translation = [0 200.00000000000006 0];  % mm
smiData.RigidTransform(15).angle = 2.0943951023931953;  % rad
smiData.RigidTransform(15).axis = [0.57735026918962584 -0.57735026918962584 0.57735026918962584];
smiData.RigidTransform(15).ID = "B[double_bearing_housing-1:-:carbon_rod-2]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(16).translation = [6.0396132539608516e-14 78.000000000000085 3.4194869158454821e-14];  % mm
smiData.RigidTransform(16).angle = 2.0943951023931962;  % rad
smiData.RigidTransform(16).axis = [0.57735026918962606 -0.57735026918962518 0.57735026918962618];
smiData.RigidTransform(16).ID = "F[double_bearing_housing-1:-:carbon_rod-2]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(17).translation = [0 0 0];  % mm
smiData.RigidTransform(17).angle = 2.0943951023931953;  % rad
smiData.RigidTransform(17).axis = [0.57735026918962584 -0.57735026918962584 0.57735026918962584];
smiData.RigidTransform(17).ID = "B[double_bearing_housing-1:-:magnet_holder-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(18).translation = [3.7325698087897763e-13 -1.6875389974302379e-13 -4.9999999999999689];  % mm
smiData.RigidTransform(18).angle = 3.1415926535897927;  % rad
smiData.RigidTransform(18).axis = [1 2.0923756274278542e-31 7.3100507415792167e-16];
smiData.RigidTransform(18).ID = "F[double_bearing_housing-1:-:magnet_holder-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(19).translation = [0 100.00000000000004 45];  % mm
smiData.RigidTransform(19).angle = 3.1415926535897931;  % rad
smiData.RigidTransform(19).axis = [1 0 0];
smiData.RigidTransform(19).ID = "B[double_bearing_housing-1:-:dummy_base_bearing-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(20).translation = [-1.4566126083082054e-13 5 -1.3633538742396922e-12];  % mm
smiData.RigidTransform(20).angle = 2.0943951023931953;  % rad
smiData.RigidTransform(20).axis = [-0.57735026918962584 -0.57735026918962584 -0.57735026918962584];
smiData.RigidTransform(20).ID = "F[double_bearing_housing-1:-:dummy_base_bearing-1]";


%============= Solid =============%
%Center of Mass (CoM) %Moments of Inertia (MoI) %Product of Inertia (PoI)

%Initialize the Solid structure array by filling in null values.
smiData.Solid(5).mass = 0.0;
smiData.Solid(5).CoM = [0.0 0.0 0.0];
smiData.Solid(5).MoI = [0.0 0.0 0.0];
smiData.Solid(5).PoI = [0.0 0.0 0.0];
smiData.Solid(5).color = [0.0 0.0 0.0];
smiData.Solid(5).opacity = 0.0;
smiData.Solid(5).ID = "";

%Inertia Type - Custom
%Visual Properties - Simple
smiData.Solid(1).mass = 0.0016701329394274004;  % kg
smiData.Solid(1).CoM = [-5.9726648473323837e-05 1.3002317849984506 -4.2370419793749932];  % mm
smiData.Solid(1).MoI = [0.23117940872943973 0.0475531655142791 0.26821624682703404];  % kg*mm^2
smiData.Solid(1).PoI = [0.0046475649753186833 -5.0183226486986943e-07 8.1225856616902787e-08];  % kg*mm^2
smiData.Solid(1).color = [1 1 1];
smiData.Solid(1).opacity = 1;
smiData.Solid(1).ID = "elbow*:*Default";

%Inertia Type - Custom
%Visual Properties - Simple
smiData.Solid(2).mass = 0.00091646540890521512;  % kg
smiData.Solid(2).CoM = [0 0 -0.63636363636363691];  % mm
smiData.Solid(2).MoI = [0.023610248316969066 0.023610248316969069 0.030432419539765169];  % kg*mm^2
smiData.Solid(2).PoI = [0 0 0];  % kg*mm^2
smiData.Solid(2).color = [1 1 1];
smiData.Solid(2).opacity = 1;
smiData.Solid(2).ID = "magnet_holder*:*Default";

%Inertia Type - Custom
%Visual Properties - Simple
smiData.Solid(3).mass = 0.013571680263507907;  % kg
smiData.Solid(3).CoM = [0 0 0];  % mm
smiData.Solid(3).MoI = [65.283174987538828 0.27821944540191212 65.283174987538828];  % kg*mm^2
smiData.Solid(3).PoI = [0 0 0];  % kg*mm^2
smiData.Solid(3).color = [0.25098039215686274 0.25098039215686274 0.25098039215686274];
smiData.Solid(3).opacity = 1;
smiData.Solid(3).ID = "carbon_rod*:*Default";

%Inertia Type - Custom
%Visual Properties - Simple
smiData.Solid(4).mass = 0.055187121604295487;  % kg
smiData.Solid(4).CoM = [-0.0094707499229456059 100.38781430950745 14.893396077084716];  % mm
smiData.Solid(4).MoI = [193.92450907071836 4.2163100708119527 195.33130610129479];  % kg*mm^2
smiData.Solid(4).PoI = [0.2363152360939601 0.0024132523086756782 -0.0002026729367582619];  % kg*mm^2
smiData.Solid(4).color = [1 1 1];
smiData.Solid(4).opacity = 1;
smiData.Solid(4).ID = "double_bearing_housing*:*Default";

%Inertia Type - Custom
%Visual Properties - Simple
smiData.Solid(5).mass = 0.80110612666539727;  % kg
smiData.Solid(5).CoM = [0 0 0];  % mm
smiData.Solid(5).MoI = [297.07685530508491 260.35949116625414 297.07685530508496];  % kg*mm^2
smiData.Solid(5).PoI = [0 0 0];  % kg*mm^2
smiData.Solid(5).color = [0.6470588235294118 0.51764705882352935 0];
smiData.Solid(5).opacity = 1;
smiData.Solid(5).ID = "dummy_base_bearing*:*Default";


%============= Joint =============%
%X Revolute Primitive (Rx) %Y Revolute Primitive (Ry) %Z Revolute Primitive (Rz)
%X Prismatic Primitive (Px) %Y Prismatic Primitive (Py) %Z Prismatic Primitive (Pz) %Spherical Primitive (S)
%Constant Velocity Primitive (CV) %Lead Screw Primitive (LS)
%Position Target (Pos)

%Initialize the CylindricalJoint structure array by filling in null values.
smiData.CylindricalJoint(2).Rz.Pos = 0.0;  % deg
smiData.CylindricalJoint(2).Pz.Pos = 0.0;
smiData.CylindricalJoint(2).ID = "";

%This joint has been chosen as a cut joint. Simscape Multibody treats cut joints as algebraic constraints to solve closed kinematic loops. The imported model does not use the state target data for this joint.
smiData.CylindricalJoint(1).Rz.Pos = 90;  % deg
smiData.CylindricalJoint(1).Pz.Pos = 0;  % mm
smiData.CylindricalJoint(1).ID = "[carbon_rod-2:-:elbow-2]";

smiData.CylindricalJoint(2).Rz.Pos = 90;  % deg  % Sylinder initiell
smiData.CylindricalJoint(2).Pz.Pos = 0;  % mm
smiData.CylindricalJoint(2).ID = "[double_bearing_housing-1:-:carbon_rod-2]";


%Initialize the PlanarJoint structure array by filling in null values.
smiData.PlanarJoint(1).Rz.Pos = 0.0;
smiData.PlanarJoint(1).Px.Pos = 0.0;
smiData.PlanarJoint(1).Py.Pos = 0.0;
smiData.PlanarJoint(1).ID = "";

%This joint has been chosen as a cut joint. Simscape Multibody treats cut joints as algebraic constraints to solve closed kinematic loops. The imported model does not use the state target data for this joint.
smiData.PlanarJoint(1).Rz.Pos = -132.76669708542948;  % deg
smiData.PlanarJoint(1).Px.Pos = 0;  % mm
smiData.PlanarJoint(1).Py.Pos = 0;  % mm
smiData.PlanarJoint(1).ID = "[double_bearing_housing-1:-:magnet_holder-1]";


%Initialize the PrismaticJoint structure array by filling in null values.
smiData.PrismaticJoint(2).Pz.Pos = 0.0;
smiData.PrismaticJoint(2).ID = "";

smiData.PrismaticJoint(1).Pz.Pos = 0;  % m
smiData.PrismaticJoint(1).ID = "[carbon_rod-1:-:carbon_rod-2]";

smiData.PrismaticJoint(2).Pz.Pos = 0;  % m
smiData.PrismaticJoint(2).ID = "[carbon_rod-1:-:elbow-2]";


%Initialize the RectangularJoint structure array by filling in null values.
smiData.RectangularJoint(1).Px.Pos = 0.0;
smiData.RectangularJoint(1).Py.Pos = 0.0;
smiData.RectangularJoint(1).ID = "";

%This joint has been chosen as a cut joint. Simscape Multibody treats cut joints as algebraic constraints to solve closed kinematic loops. The imported model does not use the state target data for this joint.
smiData.RectangularJoint(1).Px.Pos = 0;  % m
smiData.RectangularJoint(1).Py.Pos = 0;  % m
smiData.RectangularJoint(1).ID = "[elbow-1:-:elbow-2]";


%Initialize the RevoluteJoint structure array by filling in null values.
smiData.RevoluteJoint(1).Rz.Pos = 0.0;
smiData.RevoluteJoint(1).ID = "";

smiData.RevoluteJoint(1).Rz.Pos = 0;  % deg
smiData.RevoluteJoint(1).ID = "[double_bearing_housing-1:-:dummy_base_bearing-1]";

