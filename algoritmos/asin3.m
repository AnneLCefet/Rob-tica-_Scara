function output = asin3(X)
%ASIN3 Y = asin3(X) returns the Inverse Sine (sin-1) of the elements of X 
% in radians with fourth quadrant adjustment. The function accepts both 
% real and complex inputs.
% 
%   => For real values of X in the interval [-1, 1], asin(X) returns values 
%   in the interval [0, π/2] or [3*π/2, 2*π].
% 
%   => For real values of X outside the interval [-1, 1] and for complex 
%   values of X, asin(X) returns complex values.
    
    if X < 0 && X >= -1 % fourth quadrant adjustment
        output = asin(X) + 2*pi;
    else
        output = asin(X);
    end
    
end