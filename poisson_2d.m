function [PHI, S, X, Y, soln_time, A_mem] = poisson_2d(src_fun_name, L, H, num_pts)
Nx = num_pts;
Ny = num_pts; 
Ntot = Nx*Ny; %total number of points

x = linspace(0,L,Nx); dx = x(2)-x(1); %2D computational grid for x
y = linspace(0,H,Ny); dy = y(2)-y(1); %2D computational grid for y

factor_x = 1/(dx^2); factor_y = 1/(dy^2); %linear equations for X and Y
factor_center = 2*(factor_x + factor_y); %Center linear equation
% Form a 2-D regular mesh such that
%     X(i,j) = x(i), Y(i,j) = y(j)
[X,Y] = meshgrid(x,y); %2D meshgrid of x and y
% compute value of f(x,y) at each grid point
S = feval(src_fun_name,X,Y,L,H); %source function evaluation

A = spalloc(Ntot,Ntot,5*Ntot); %matrix A memory allocation
b = S(:); %the solution matrix b
% loop on all interior points
 for j = 1:Ntot
    for i = 1:Ntot
        if i == j %diagonal
            A(i,j) = factor_center;
        elseif i == j-1 %south
            A(i,j) = -factor_y;
        elseif i == j+1 %north
            A(i,j) = -factor_y;
        elseif i == j+Ny %east
            A(i,j) = -factor_x;
        elseif i == j-Ny %west
            A(i,j) = -factor_x;
        end
    end
 end

% We next specify equations for each boundary point.
% BC1: x=0, y=y
i = 1;
for j=1:Ny
  n = ((i-1)*Ny) + j;
  A(n,n) = 1;
  b(n) = 0; %B equals zero at the boundary
end
% BC2: x=L, y=y
% fill in
i = Nx;
for j=1:Ny
  n = ((i-1)*Ny) + j;
  A(n,n) = 1;
  b(n) = 0; %B equals zero at the boundary
end
% BC3: x=x, y=0
% fill in
j = 1;
for i=2:(Nx-1)
  n = ((i-1)*Ny) + j;
  A(n,n) = 1;
  b(n) = 0; %B equals zero at the boundary
end
% BC4: x=x, y=H
% fill in
j = Ny;
for i=1:(Nx-1)
  n = ((i-1)*Ny) + j;
  A(n,n-1) = 0;
  A(n-1,n) = 0; % at BC4 some neighboring points to the diagonal set to zero at the boundary for A to be similar to Kron matrix
  b(n) = 0; %B equals zero at the boundary
end

A_whos = whos('A');
A_mem = A_whos.bytes; %memory used to store matrix A

% solve via Gaussian elimination and get soln time
tic % start the timer
phi = A\b;
soln_time = toc; % get the solution time
% We now extract the results of the calculation
% into the 2-D grid format
PHI = zeros(size(X)); %allocate PHI
for i=1:Nx
  for j=1:Ny
    n = ((i-1)*Ny) + j;
    PHI(i,j) = phi(n); %allocate values of PHI
  end
end