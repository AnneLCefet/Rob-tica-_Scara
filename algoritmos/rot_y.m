function R = rot_y(theta)
    %ROT_Y Representaçao de uma rotaçao pura em y
    R = [cos(theta) 0 sin(theta) 0; 0 1 0 0; -sin(theta) 0  cos(theta) 0; 0 0 0 1];
end