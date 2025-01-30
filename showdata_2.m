function showdata_2( data, labels, guess )

% First sort the digits so they're in order
[labels, sortorder] = sort(labels);
data = data(sortorder,:);

% Check to see whether this includes predictions
testing = true;
if exist('guess','var')
    guess = guess(sortorder);
else
    guess = labels;
    testing = false;
end

% Find out how many there are and restrict accordingly
numexamples = size(data,1);
if numexamples > 300
    error('Too big!');
end

% Check if the data is in the expected downsampled format (128 pixels)
if size(data,2) ~= 128
    error('Sorry - can only display digits with 128 pixels (downsampled from 256).');
end

% Decide how many digits to put in the square
for side=1:17
    if side^2 >= (numexamples)
        break;
    end
end

% Set up the border parameters
border = 3;
framewidth = 16+(2*border);

% And the main matrix to display
m = zeros(side*framewidth,side*framewidth);

n=1;
mistakes = 0;
for row = 1:framewidth:(side*framewidth)-1
    for col = 1:framewidth:(side*framewidth)-1
       
        % Retrieve the downsampled digit pixels and expand them back to 16x16
        digit = reshape(data(n,:), 8, 16);  % Reshape to 8 rows x 16 columns
        
        % Put a black border around it
        frame = zeros(framewidth);
        frame(border:(border+7), border:(border+15)) = digit;
        digit = frame;        
        
        % Draw a further white border around the digit if we've made an error
        if labels(n) ~= guess(n)
            digit(border, border:(framewidth-border)) = 255;  % Top of white 'mistake' box
            digit(framewidth-border, border:(framewidth-border)) = 255;  % Bottom
            digit(border:(framewidth-border), border) = 255;  % Left
            digit(border:(framewidth-border), framewidth-border) = 255;  % Right
            mistakes = mistakes + 1;
        end
               
        % Put it in the main matrix
        m(row:(row+(framewidth-1)), col:(col+(framewidth-1))) = digit;
        
        % Increment which example we're dealing with
        n = n + 1;

        % Break if we reached the end
        if n > size(data,1)
            break;
        end
    end
    
    % Break if we reached the end
    if n > size(data,1)
        break;
    end
end

% Display it
imagesc(m);
colormap gray;
axis off;
axis square;

% Put a title on it
if testing
    rate = mistakes / numexamples;
    rate = ceil(rate * 10000) / 100;
    title([ num2str(mistakes) ' errors from ' num2str(numexamples) '   (' num2str(rate) '%)'], 'FontSize', 16);
end
