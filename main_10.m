% Load the training data and labels
train_data = [];
train_labels = [];

for digit = [3, 6, 8]
    for instance = 1:500
        % Get the digit data for each instance
        digdata = getonedigit(digit, instance, maindata);
        
        % Extract the downsampled features using the extractmyfeatures function
        downsampled_vector = extractmyfeatures_2(digdata);  % Uses erosion with 3x3 kernel
        
        % Append the downsampled vector and the label
        train_data = [train_data; downsampled_vector];  
        train_labels = [train_labels; digit];  
    end
end

% Load the benchmark data
test_data = [];
test_labels = [];
benchmark_data = [];  % To keep a copy of benchmark data for showdata plotting

for digit = [3, 6, 8]
    for instance = 1:50
        % Get the benchmark digit data for each instance
        digdata = getonedigit(digit, instance, benchmarkdata);
        
        % Store the benchmark data for plotting
        benchmark_data = [benchmark_data; digdata(:)'];  % Store the raw 1x256 vector

        % Extract the downsampled features using the extractmyfeatures function
        downsampled_vector = extractmyfeatures_2(digdata);  % Uses erosion with 3x3 kernel
        
        % Append the downsampled vector and the label
        test_data = [test_data; downsampled_vector];  
        test_labels = [test_labels; digit];  
    end
end

% Display the sizes of training and testing data
disp(['Size of train_data: ', num2str(size(train_data))]);
disp(['Size of train_labels: ', num2str(size(train_labels))]);
disp(['Size of test_data: ', num2str(size(test_data))]);
disp(['Size of test_labels: ', num2str(size(test_labels))]);

% Shuffle the training data and labels
[train_data, train_labels] = shufflerows(train_data, train_labels);

% Apply KNN to classify the benchmark data
k = 3;  % Number of neighbors for KNN
predicted_labels = zeros(size(test_labels));  % Array to store predictions

% Start the timer
tic;

for i = 1:size(test_data, 1)
    % Use KNN for classification
    predicted_labels(i) = knearest(k, test_data(i, :), train_data, train_labels);
end

% Display the test data and predicted labels
showdata(benchmark_data, test_labels, predicted_labels);


% Stop the timer and display the execution time
elapsed_time = toc;
disp(['Execution time for KNN: ', num2str(elapsed_time), ' seconds']);

% Plot the confusion matrix
figure;
confusionchart(test_labels, predicted_labels);
title('Confusion Matrix for KNN Classifier');