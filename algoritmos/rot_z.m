function R = rot_z(theta)
    %ROT_Z Representaçao de uma rotaçao pura em z
    R = [cos(theta) -sin(theta) 0 0; sin(theta) cos(theta) 0 0; 0 0 1 0; 0 0 0 1];
end