function output = atan3(Y,X)
%ATAN3 Four-quadrant inverse tangent adjusted
%   P = atan2(Y,X) returns the four-quadrant inverse tangent (tan-1) of Y 
%   and X, which must be real. The atan2 function follows the convention 
%   that atan2(x,x) returns 0 when x is mathematically zero (either 0 or -0).
%   The four-quadrant inverse tangent, atan2(Y,X), returns values in the 
%   closed interval [0, 2π] based on the values of Y and X.
    
    if Y<0  % third and fourth quadrant
        output = atan2(Y,X) + 2*pi;
    else % first and second quadrant
        output = atan2(Y,X);
    end
end