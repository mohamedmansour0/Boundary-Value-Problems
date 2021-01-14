% test 2d Poisson with new Dirichlet BCs
% clear; clc; close all

% define params
L = 1;
H = 1;
num_pts = 100; %high resolution
% num_pts = 10; %low resolution
% The second source
src_fun_name = 'source2_2d';
dir_bcs = 'dirichlet_bcs';
% run the FD simulation
% FILL THIS IN
[PHI, S, X, Y, soln_time, A_mem] = poisson_2d_Dirichlet(dir_bcs,src_fun_name, L, H, num_pts);
figure
contourf(X,Y,PHI,50); colorbar; %plot PHI
xlabel('x'); ylabel('y'); title('Poisson BVP Dirichlet (FD) for 2nd source: \phi(x,y)');
figure
contourf(X,Y,S,50); colorbar; %plot source2
xlabel('x'); ylabel('y'); title('source2');