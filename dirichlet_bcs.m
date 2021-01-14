function D = dirichlet_bcs(X,Y,L,H,num_pts)
Nx = num_pts;
Ny = num_pts;
x = linspace(0,L,Nx);
y = linspace(0,H,Ny);
[X,Y] = meshgrid(x,y);
%BC1
i = 1;
for j=1:Ny
    D(i,j) = 1;
end
%BC2
i = Nx;
for j=1:Ny
    D(i,j) = y(j);    
end
%BC3
j = 1;
for i=1:Nx
    D(i,j) = -2;
end
%BC4
j = Ny;
for i=1:Nx
    D(i,j) = x(i).^2;    
end
figure
contourf(X,Y,D,50); colorbar; %plot Dirichlet
xlabel('x'); ylabel('y'); title('Dirichlet BCs');