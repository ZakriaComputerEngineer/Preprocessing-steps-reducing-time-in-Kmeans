% Initialize training data and labels
train_data = [];
train_labels = [];

% Loop over the digits 3, 6, and 8
for digit = [3, 6, 8]
    for instance = 1:500
        % Get the digit data for each instance from 'maindata'
        digdata = getonedigit(digit, instance, maindata);
        
        % Extract the downsampled features (128-length vector)
        downsampled_vector = extractmyfeatures_1(digdata);
        
        % Append the downsampled vector and the corresponding label
        train_data = [train_data; downsampled_vector];  
        train_labels = [train_labels; digit];  
    end
end

% Shuffle the training data and labels
[train_data, train_labels] = shufflerows(train_data, train_labels);

% Initialize testing data and labels
test_data = [];
test_labels = [];

% Loop over the digits 3, 6, and 8 for the benchmark test data
for digit = [3, 6, 8]
    for instance = 1:50
        % Get the benchmark digit data for each instance
        digdata = getonedigit(digit, instance, benchmarkdata);
        
        % Extract the downsampled features (128-length vector)
        downsampled_vector = extractmyfeatures_1(digdata);
        
        % Append the downsampled vector and the corresponding label
        test_data = [test_data; downsampled_vector];  
        test_labels = [test_labels; digit];  
    end
end

% Display the size of training data and test data in the command window
disp(['Size of Training Data: ', num2str(size(train_data))]);  % Display in the format [rows, columns]
disp(['Size of Training Labels: ', num2str(size(train_labels))]);  % Display training labels size
disp(['Size of Test Data: ', num2str(size(test_data))]);  % Display in the format [rows, columns]
disp(['Size of Test Labels: ', num2str(size(test_labels))]);  % Display test labels size


% Apply KNN to classify the benchmark data
k = 3;  % Number of neighbors for KNN
predicted_labels = zeros(size(test_labels));  % Array to store predictions

% Start the timer
tic;

% Loop over each test data point and apply KNN
for i = 1:size(test_data, 1)
    % Use KNN for classification
    predicted_labels(i) = knearest(k, test_data(i, :), train_data, train_labels);
end

% Show the results using the showdata_2 function (or showdata if that is correct)
showdata_2(test_data, test_labels, predicted_labels);


% Stop the timer and display the execution time
elapsed_time = toc;
disp(['Execution time for KNN with 1x128 features: ', num2str(elapsed_time), ' seconds']);


% Calculate the accuracy of the predictions
accuracy = sum(predicted_labels == test_labels) / length(test_labels) * 100;
disp(['Accuracy: ', num2str(accuracy), '%']);

% 9. Plot the confusion matrix
figure;
confusionchart(test_labels, predicted_labels);
title('Confusion Matrix for KNN Classification');


