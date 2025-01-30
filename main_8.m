% 1. Retrieve 500 samples each for digits 3, 6, and 8 from 'maindata'
train_data = [];
train_labels = [];

for digit = [3, 6, 8]
    for instance = 1:500
        % Get the digit data for each instance
        digdata = getonedigit(digit, instance, maindata);
        
        % Extract the downsampled features (PDF)
        downsampled_vector = extractmyfeatures_3(digdata);
        
        % Append the downsampled vector and the label
        train_data = [train_data; downsampled_vector];  
        train_labels = [train_labels; digit];  
    end
end

% 2. Display the size of the training data and labels
disp(['Training Data Size: ', num2str(size(train_data))]);
disp(['Training Labels Size: ', num2str(size(train_labels))]);

% 3. Repeat for test data
test_data = [];
test_labels = [];
benchmark_data = [];  % To keep a copy of benchmark data for showdata plotting

for digit = [3, 6, 8]
    for instance = 1:50
        % Get the benchmark digit data for each instance
        digdata = getonedigit(digit, instance, benchmarkdata);
        
        % Store the benchmark data for plotting
        benchmark_data = [benchmark_data; digdata(:)'];  % Store the raw 1x256 vector
        
        % Extract the downsampled features (PDF)
        downsampled_vector = extractmyfeatures_3(digdata);
        
        % Append the downsampled vector and the label
        test_data = [test_data; downsampled_vector];  
        test_labels = [test_labels; digit];  
    end
end

% 4. Display the size of the testing data and labels
disp(['Testing Data Size: ', num2str(size(test_data))]);
disp(['Testing Labels Size: ', num2str(size(test_labels))]);

% 5. Shuffle the training data and labels
[train_data, train_labels] = shufflerows(train_data, train_labels);

% 6. Apply KNN to classify the benchmark data
k = 3;  % Number of neighbors for KNN
predicted_labels = zeros(size(test_labels));  % Array to store predictions

% Start the timer
tic;

for i = 1:size(test_data, 1)
    % Use KNN for classification
    predicted_labels(i) = knearest_2(k, test_data(i, :), train_data, train_labels);
end

% 7. Show the results using the showdata function (using benchmark data for plot)
showdata(benchmark_data, test_labels, predicted_labels);


% Stop the timer and display the execution time
elapsed_time = toc;
disp(['Execution time for KNN with 1x16 features: ', num2str(elapsed_time), ' seconds']);

% 8. Calculate the accuracy
accuracy = sum(predicted_labels == test_labels) / length(test_labels) * 100;
disp(['Accuracy: ', num2str(accuracy), '%']);

% 9. Plot the confusion matrix
figure;
confusionchart(test_labels, predicted_labels);
title('Confusion Matrix for KNN Classification');

