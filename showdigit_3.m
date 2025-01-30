function showdigit_3(digit_data, label)
    % Reshape the digit data (1x64 vector) into a 2D image (8x8)
    reshaped_data = reshape(digit_data, 8, 8);  % 8x8 image from the downsampled vector

    % Resize it back to 16x16 for display (optional: adjust if needed)
    resized_data = imresize(reshaped_data, [16 16]);

    % Display the image
    imagesc(resized_data);
    colormap gray;
    axis off;
    axis square;

    % Display the title with the digit label
    title(['Downsampled and Eroded Digit: ' num2str(label)]);
end
