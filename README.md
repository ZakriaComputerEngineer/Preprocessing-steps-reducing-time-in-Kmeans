# Preprocessing-steps-reducing-time-in-Kmeans
This repository explores preprocessing techniques to reduce the computational cost of K-Means clustering while maintaining accuracy. Applied to handwriting dataset (.mat files), the approach optimizes clustering performance, making it more efficient for large datasets and resource-constrained environments.

Feature Extraction: Each 16x16 digit image is reshaped into a 1x256 vector.

Binary Classification ('3' vs. '8'): KNN trained with kk-values (1-20), accuracy plotted.

Data Preparation: 100 samples per digit, shuffled, split equally for training/testing.

Random Splits: Multiple train-test splits, mean accuracy plotted with error bars.

Comparison: Accuracy evaluated across splits, results visualized.

Multi-Class Classification ('3', '6', '8'): KNN applied to USPS dataset.

Dimensionality Reduction: Even-indexed pixels (1x128 vector) retained (99% accuracy).

Erosion (3x3 kernel): Boundary enhancement, reducing noise (78% accuracy).

PDF-Based Features: Pixel intensity distribution (1x16 vector) used (36% accuracy).
