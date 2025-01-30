% Load the datasets
load('usps_main.mat'); % Training data from usps_main
load('usps_benchmark.mat'); % Testing data from usps_benchmark

% Initialize matrices for '3', '6', and '8' digits from the training data
num_train_samples = 500;
digit_3_train = zeros(256, num_train_samples); % Each row corresponds to a flattened 16x16 image
digit_6_train = zeros(256, num_train_samples);
digit_8_train = zeros(256, num_train_samples);

% Extract '3', '6', and '8' digits from usps_main for training
for i = 1:num_train_samples
    digit_3_train(:, i) = reshape(getonedigit(3, i, maindata), [], 1); % Flatten 16x16 to 1x256
    digit_6_train(:, i) = reshape(getonedigit(6, i, maindata), [], 1); % Flatten 16x16 to 1x256
    digit_8_train(:, i) = reshape(getonedigit(8, i, maindata), [], 1); % Flatten 16x16 to 1x256
end

% Combine the training data and create labels
train_data = [digit_3_train, digit_6_train, digit_8_train]'; % Transpose to make 150x256
train_labels = [ones(num_train_samples, 1); ones(num_train_samples, 1) * 2; ones(num_train_samples, 1) * 3]; % Labels: '1' for '3', '2' for '6', '3' for '8'

% Initialize matrices for '3', '6', and '8' digits from the testing data
num_test_samples = 50;
digit_3_test = zeros(256, num_test_samples); % Each row corresponds to a flattened 16x16 image
digit_6_test = zeros(256, num_test_samples);
digit_8_test = zeros(256, num_test_samples);

% Extract '3', '6', and '8' digits from usps_benchmark for testing
for i = 1:num_test_samples
    digit_3_test(:, i) = reshape(getonedigit(3, i, benchmarkdata), [], 1); % Flatten 16x16 to 1x256
    digit_6_test(:, i) = reshape(getonedigit(6, i, benchmarkdata), [], 1); % Flatten 16x16 to 1x256
    digit_8_test(:, i) = reshape(getonedigit(8, i, benchmarkdata), [], 1); % Flatten 16x16 to 1x256
end

% Combine the test data and create labels
test_data = [digit_3_test, digit_6_test, digit_8_test]'; % Transpose to make 150x256
test_labels = [ones(num_test_samples, 1); ones(num_test_samples, 1) * 2; ones(num_test_samples, 1) * 3]; % Labels: '1' for '3', '2' for '6', '3' for '8'

% Perform K-NN classification for various k values
k_values = 1:20;
accuracies = zeros(length(k_values), 1); % Store accuracies for each k value

for k = k_values
    predictions = zeros(length(test_labels), 1);
    
    % K-NN classification for each test sample
    for i = 1:length(test_labels)
        test_sample = test_data(i, :);
        predictions(i) = knearest(k, test_sample, train_data, train_labels);
    end
    
    % Calculate accuracy for the current k
    accuracies(k) = sum(predictions == test_labels) / length(test_labels);
end

% Find the best k (the one that gives the highest accuracy)
[~, best_k_index] = max(accuracies);
best_k = k_values(best_k_index);

% Final K-NN classification with the best k
final_predictions = zeros(length(test_labels), 1);
for i = 1:length(test_labels)
    test_sample = test_data(i, :);
    final_predictions(i) = knearest(best_k, test_sample, train_data, train_labels);
end

% Visualize classification results using the showdata function
showdata(test_data, test_labels, final_predictions); % Visualize true labels vs. predictions
disp('Plotting complete.');
