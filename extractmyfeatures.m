% 1x128 downsampling

function downsampled_vector = extractmyfeatures(digdata)
    % Assuming digdata is 16x16 matrix (flattened to 1x256 vector)
    
    % Downsample by selecting even-numbered pixels (indices 2, 4, 6, ..., 256)
    downsampled_vector = digdata(1:2:end);  % Select every 2nd pixel from the 1x256 vector
    
    % Ensure the downsampled vector has the correct size of 1x128
    if length(downsampled_vector) ~= 128
        error('Downsampled vector has incorrect length. Expected 128, got %d', length(downsampled_vector));
    end
end
