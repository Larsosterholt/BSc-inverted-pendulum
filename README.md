# Bsc inverted pendulum simulation and implementation on real model
How to use: todo.

## data/ 
Test data used to estimate the mathematical model.

## LQR_sim_simple/ 
A simple simulation of Furuta pendulum in simscape using LQR. The model is not the same as the physical.

## matlab_calculations/ 
Derivation of system equations and parameter estimation. 

## PID_physical_model_angle_and_angular_vel_feedback/ 
PID implementation on real model with swing up. Without current feedback

## PID_physical_mode_currentl_angle_and_angular_vel_feedback
PID implementation on real model with swing up. With current feedback

## PID_physical_model_angle_feedback/ 
Does not work. An attempt to control the pendulum without angular velocity feedback.

## PID_servo_angle_control/ 
Using the DC-motor as a servo with PID. A template on how to use the DC-motor as a servo motor. This uses feedback from: current, angular velocity and angle.

## PID_sim/ 
Simulating the pendulum in simscape using PID. 

## LQR_simulation/ 
Simulate the pendulum in matlab. Using un linear mathematical model, LQR regulator and a swing up alogrithim. This is solved using Runge-Kutta 4.

## LQR_physical/
LQR implementation of real model with swing up. The LQR-gain is calculated in: LQR_simulation/ sim_LQR.m 

## paramter_estimation/
A trying to use a optimization algorithm to minimize the sum of square error between model and simulation 