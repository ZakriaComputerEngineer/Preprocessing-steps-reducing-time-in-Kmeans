% 1. Retrieve 500 samples each for digits 3, 6, and 8 from 'maindata'
train_data = [];
train_labels = [];

for digit = [3, 6, 8]
    for instance = 1:500
        % Get the digit data for each instance
        digdata = getonedigit(digit, instance, maindata);
        train_data = [train_data; digdata(:)'];  % Flatten the 16x16 to 1x256 vector
        train_labels = [train_labels; digit];  % Append the corresponding label
    end
end

% 2. Shuffle the training data and labels
[train_data, train_labels] = shufflerows(train_data, train_labels);

% 3. Retrieve 50 samples each for digits 3, 6, and 8 from 'benchmarkdata' for testing
test_data = [];
test_labels = [];

for digit = [3, 6, 8]
    for instance = 1:50
        % Get the benchmark digit data for each instance
        digdata = getonedigit(digit, instance, benchmarkdata);
        test_data = [test_data; digdata(:)'];  % Flatten the 16x16 to 1x256 vector
        test_labels = [test_labels; digit];  % Append the corresponding label
    end
end

% 4. Apply KNN to classify the benchmark data
k = 3;  % Number of neighbors for KNN
predicted_labels = zeros(size(test_labels));  % Array to store predictions


% Start the timer
tic;

for i = 1:size(test_data, 1)
    % Use KNN for classification
    predicted_labels(i) = knearest(k, test_data(i, :), train_data, train_labels);
end

showdata(test_data, test_labels, predicted_labels);

% Stop the timer and display the execution time
elapsed_time = toc;
disp(['Execution time for KNN with 1x256 features: ', num2str(elapsed_time), ' seconds']);

% 5. Calculate the accuracy
accuracy = sum(predicted_labels == test_labels) / length(test_labels) * 100;
disp(['Accuracy: ', num2str(accuracy), '%']);

% 9. Plot the confusion matrix
figure;
confusionchart(test_labels, predicted_labels);
title('Confusion Matrix for KNN Classification');

