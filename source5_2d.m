function S = source5_2d(X,Y,L,H)
% Returns a uniform value of so for all
% values of (x,y).

S = ((X./L).^2) + (sin((10.*Y)./H)); %Non-linear source in both x and y