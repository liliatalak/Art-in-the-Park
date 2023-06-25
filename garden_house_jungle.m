% Art in the Park
% File written in MATLAB

%% Welcome Message

fprintf('Welcome to Art in the Park!\n\n');

%% User Input

% Ask the user for the number of objects to generate
numObjects = input('How many objects would you like to generate? ');

% Ask the user which shape they would like to use
shapeChoice = input('What shape would you like to use? (circle, square, etc) ','s');

%% Art Creation

% Create the figure
figure

% Generate random coordinates in x and y
x = rand(numObjects,1);
y = rand(numObjects,1);

% Generate random colors using a colormap
cmap = colormap;
cmapIndices = randi(length(cmap),numObjects,1);

% Draw the objects
for i = 1:numObjects
    switch lower(shapeChoice)
        case 'circle'
            % Circle
            viscircles([x(i) y(i)],0.05,'Color',cmap(cmapIndices(i),:));
        case 'square'
            % Square
            rectangle('Position',[x(i) y(i) 0.1 0.1],'Curvature',0,'FaceColor',cmap(cmapIndices(i),:));
        case 'triangle'
            % Triangle
            vertices = [x(i) y(i); x(i)+0.1 y(i)+0.1; x(i)-0.1 y(i)+0.1];
            patch(vertices(:,1),vertices(:,2),[1 0 0],'FaceColor',cmap(cmapIndices(i),:));
    end
end

%% Display Result

fprintf('Your art is complete!\n\n');