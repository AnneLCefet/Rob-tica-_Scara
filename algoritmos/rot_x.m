function R = rot_x(theta)
%ROT_X Representaçao de uma rotaçao pura em x
R = [1 0 0 0; 0 cos(theta) -sin(theta) 0; 0 sin(theta) cos(theta) 0; 0 0 0 1];
end