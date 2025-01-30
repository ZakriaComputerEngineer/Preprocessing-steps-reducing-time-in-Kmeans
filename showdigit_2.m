function showdigit_2(downsampled_vector,label)
    % Check if the downsampled vector has the correct size (1x128)
    if length(downsampled_vector) ~= 128
        error('Input vector must have 128 elements.');
    end
    
    % Reshape the downsampled vector (1x128) into a 16x8 matrix (for visualization)
    reshaped_image = reshape(downsampled_vector, [16, 8]);
    
    % Display the image
    figure;
    imagesc(reshaped_image);
    colormap gray;
    axis off;
    axis square;
    %title('Downsampled Digit');
    title(['Evens only: ' num2str(label)]);
end
