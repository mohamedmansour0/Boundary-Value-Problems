% test 2d Poisson with homogenous Dirichlet BCs
clear; clc; close all

% define params
L = 1;
H = 1;
num_pts = 100; %high resolution
% num_pts = 10; %low resolution

% The first source
src_fun_name = 'source1_2d';
% run the FD simulation
% FILL THIS IN
[PHI, S, X, Y, soln_time, A_mem] = poisson_2d(src_fun_name, L, H, num_pts);
figure
contourf(X,Y,PHI,50); colorbar; %plot PHI
xlabel('x'); ylabel('y'); title('Poisson BVP (FD) for 1st source: \phi(x,y)');
figure
contourf(X,Y,S,50); colorbar; %plot source1
xlabel('x'); ylabel('y'); title('source1');

% The second source
src_fun_name = 'source2_2d';
% run the FD simulation
% FILL THIS IN
[PHI, S, X, Y, soln_time, A_mem] = poisson_2d(src_fun_name, L, H, num_pts);
figure
contourf(X,Y,PHI,50); colorbar; %plot PHI
xlabel('x'); ylabel('y'); title('Poisson BVP (FD) for 2nd source: \phi(x,y)');
figure
contourf(X,Y,S,50); colorbar; %plot source2
xlabel('x'); ylabel('y'); title('source2');

% The Third source
src_fun_name = 'source3_2d';
% run the FD simulation
% FILL THIS IN
[PHI, S, X, Y, soln_time, A_mem] = poisson_2d(src_fun_name, L, H, num_pts);
figure
contourf(X,Y,PHI,50); colorbar; %plot PHI
xlabel('x'); ylabel('y'); title('Poisson BVP (FD) for 3rd source: \phi(x,y)');
figure
contourf(X,Y,S,50); colorbar; %plot source3
xlabel('x'); ylabel('y'); title('source3');

% The fourth source
src_fun_name = 'source4_2d';
% run the FD simulation
% FILL THIS IN
[PHI, S, X, Y, soln_time, A_mem] = poisson_2d(src_fun_name, L, H, num_pts);
figure
contourf(X,Y,PHI,50); colorbar; %plot PHI
xlabel('x'); ylabel('y'); title('Poisson BVP (FD) for 4th source: \phi(x,y)');
figure
contourf(X,Y,S,50); colorbar; %plot source4
xlabel('x'); ylabel('y'); title('source4');

% The fifth source
src_fun_name = 'source5_2d';
% run the FD simulation
% FILL THIS IN
[PHI, S, X, Y, soln_time, A_mem] = poisson_2d(src_fun_name, L, H, num_pts);
figure
contourf(X,Y,PHI,50); colorbar; %plot PHI
xlabel('x'); ylabel('y'); title('Poisson BVP (FD) for 5th source: \phi(x,y)');
figure
contourf(X,Y,S,50); colorbar; %plot source5
xlabel('x'); ylabel('y'); title('source5');