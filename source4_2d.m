function S = source4_2d(X,Y,L,H)
% Returns a uniform value of so for all
% values of (x,y).

S = (X./L) + (2*Y./H); %Linear source in both x and y