% 1x128 erosion k=3

function downsampled_vector = extractmyfeatures_2(digit_data)

    % Flatten the 16x16 matrix to a 1x256 vector

    flattened_vector = digit_data(:)';
    
    % Convert to a binary image (assuming the image is grayscale)

    binary_image = digit_data > 0;  % Any non-zero pixel becomes 1 (foreground)
    
    % Define a 3x3 structuring element (kernel) for erosion

    se = strel('square', 3);  % Create a 3x3 square structuring element
    
    % Apply morphological erosion to the binary image
    eroded_image = imerode(binary_image, se);
    
    % Flatten the eroded image to a 1x256 vector
    eroded_vector = eroded_image(:)';
    
    % Select only the odd-indexed pixels (i.e., 1st, 3rd, 5th, ..., 255th)
    % Odd indices correspond to 1, 3, 5, ..., 255 (1-based indexing)
    downsampled_vector = eroded_vector(1:2:end);  % Select odd-indexed elements
    
    % Ensure the size is now 1x128 (half of 256)
    % This downsampling selects every other pixel, so we should have 128 elements in the vector
end
