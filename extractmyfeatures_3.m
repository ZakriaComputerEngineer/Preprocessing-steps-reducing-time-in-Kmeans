% 1x16 by histogram

function pdf_vector = extractmyfeatures_3(digit_data)
    % Extracts the PDF of a 16x16 image (digit) and returns it as a feature vector
    
    % Flatten the 16x16 image into a 1x256 vector
    flat_data = digit_data(:);
    
    % Define the number of bins for the histogram (let's assume 16 intensity bins)
    num_bins = 16;
    
    % Compute the histogram of the pixel values (using 16 bins)
    % Pixel values typically range from 0 to 255 (for grayscale images), but this can vary
    pixel_hist = hist(flat_data, num_bins);
    
    % Normalize the histogram to get a probability density function (PDF)
    pdf_vector = pixel_hist / sum(pixel_hist);  % Normalize to sum to 1
    
    % The resulting pdf_vector is the feature representation for the image
end
