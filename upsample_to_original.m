function upsampled_data = upsample_to_original(data, target_size)
    % data: Input data matrix where each row is an image (flattened).
    % target_size: The desired upsampled size (e.g., 16 for 16x16 images).
    % Returns: A matrix where each row is the upsampled image (flattened).

    num_examples = size(data, 1);
    input_size = sqrt(size(data, 2));

    if input_size ~= floor(input_size)
        error('Input data does not represent square images.');
    end

    input_size = round(input_size);
    upsampled_data = zeros(num_examples, target_size^2);

    for i = 1:num_examples
        % Reshape each row into a square image
        img = reshape(data(i, :), input_size, input_size);

        % Upsample the image using interpolation
        upsampled_img = imresize(img, [target_size, target_size], 'bilinear');

        % Flatten and store in the output matrix
        upsampled_data(i, :) = upsampled_img(:)';
    end
end
