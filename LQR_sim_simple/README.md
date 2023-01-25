# Simulink-inverted-pendulum
Simulation of a single inverted pendulum on a rotating body using a LQR controller.
Before running Simulink model: Run "lqr_design.mlx". This estimates the K matrix for the control system and add parameters to the model.

# “system_analyzer/”
This is an attempt to estimate model using model estimation tool in matlab, this needs more work.

# “model_verification/”
Is a numerical solution of the differential equation of a pendulum VS the model generated in simscape and solidworks. This is just for verifying the model.

# "rod_asem_DataFile.m"
Here is the initial conditions.