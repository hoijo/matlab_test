% git test dd

close all; clear; clc;

flag_CS = 0; % 1 = case study on

%% Global Variables
global r2d d2r kts2mps ft2m T

%% Global Parameters
kts2mps = 0.5144;
ft2m    = 0.3048;
r2d     = 180/pi;
d2r     = pi/180;

%% Simulation Time
T.T_sim  = 1/400;
T.T_claw = 1/100;
T.T_end = 600;

% motor_delay = 0.05;
% actuator_delay = 0.07;
f_cut = 0.2; % cutoff frequency for CAAP
Flag_Step = 0;
Case_No = 1;

%% Load the eVTOL Data
% addpath('gain\');
addpath('model_info\');
addpath('MREF\');
load('bus_define.mat');
m_evtol_aerodata
m_evtol_aero_tunning_coeffi

% m_evtol_ctol_pid

%% Setting the wind
wind_switch = 1;
trim_switch = 0;
% Trim_mode = 1; % VTOL : 0 / CTOL :1

%% Setting of the initial trim
% states
trim.x = 0;
trim.y = 0;
trim.z = -100;

trim.u = 22.6627;
trim.v = 0;
trim.w = 1.8033;
trim.V = norm([trim.u trim.v trim.w]);

trim.q1 = 0.99921;
trim.q2 = 0;
trim.q3 = 0.039693;
trim.q4 = 0;
quat = [trim.q1 trim.q2 trim.q3 trim.q4];
eul = quat2eul(quat);
trim.phi = eul(1);
trim.the = eul(2);
trim.psi = eul(3);

trim.p = 0;
trim.q = 0;
trim.r = 0;

% input
trim.rpm1 = 0;
trim.rpm2 = 0;
trim.rpm3 = 0;
trim.rpm4 = 0;
trim.rpm5 = 1700;

trim.ail = 0;
trim.ele = -0.076099;
trim.rud = 0;

open_system('Sim_Integrated.slx')                               
