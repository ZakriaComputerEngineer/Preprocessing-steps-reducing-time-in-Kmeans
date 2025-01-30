function predicted_label = knearest_2(k, test_data_point, train_data, train_labels)
    % K-Nearest Neighbors function to classify a test data point
    % k: the number of nearest neighbors
    % test_data_point: the 1xN vector representing the test sample
    % train_data: the matrix of training data (each row is a feature vector)
    % train_labels: the corresponding labels for the training data

    % Calculate the Euclidean distance between the test data point and all training points
    distances = sqrt(sum((train_data - test_data_point).^2, 2));  % Euclidean distance
    
    % Sort the distances and get the indices of the nearest neighbors
    [~, sorted_indices] = sort(distances);
    
    % Get the labels of the k nearest neighbors
    nearest_labels = train_labels(sorted_indices(1:k));
    
    % Determine the most common label among the k nearest neighbors (majority voting)
    predicted_label = mode(nearest_labels);  % Most frequent label
end
