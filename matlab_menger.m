function menger_sponge(iterations)

% define the initial cube
x = [0 1 1 0 0 1 1 0];
y = [0 0 1 1 0 0 1 1];
z = [0 0 0 0 1 1 1 1];

% subdivide the cube and remove the center and faces
for i = 1:iterations
    n = length(x);
    for j = 1:n
        x = [x, x(j)+[0 1 1 0 0 1 1 0]/3];
        y = [y, y(j)+[0 0 1 1 0 0 1 1]/3];
        z = [z, z(j)+[0 0 0 0 1 1 1 1]/3];
    end
    for j = 1:n
        if j <= n/3 || j > 2*n/3
            x(j) = [];
            y(j) = [];
            z(j) = [];
        end
    end
end

% plot the Menger sponge
patch(x,y,z,'r')
axis equal
axis off
view(-20,20)
light('Position', [1 2 0.5], 'Style', 'infinite')
light('Position', [-1 -2 -0.5], 'Style', 'infinite')
end

