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


# Apply KNN Classifier
   ![CM_base](https://github.com/user-attachments/assets/a958f2ba-a00f-438b-aa85-7fc35c746c67)
![over_all_results_base](https://github.com/user-attachments/assets/9a181574-2560-496d-b1a9-451c25747480)
![Task1and2](https://github.com/user-attachments/assets/d8a52c1a-5140-4efa-944c-547ee0e150c6)


# KNN using Down Sampling
![evens_only_8](https://github.com/user-attachments/assets/d2794eef-646c-478f-9347-4e88e1c98d29)
![evens_only_6](https://github.com/user-attachments/assets/b5d88e02-7ed2-49f7-b1d4-b82918626a45)
![evens_only_3](https://github.com/user-attachments/assets/b61f5098-2c15-4c65-9b93-d863e93d9790)
![CM_evens](https://github.com/user-attachments/assets/27bed9df-4b49-49bc-9a31-7254e832f35d)
![over_all_results_evens_only](https://github.com/user-attachments/assets/e44072d9-577d-4761-8cc4-1bdb4cd2e35b)


# KNN Using Erosion
![over_all_results_erosion](https://github.com/user-attachments/assets/07e12542-bd48-42d0-a934-d5333b507c76)
![CM_erosion](https://github.com/user-attachments/assets/e554db62-1992-4d57-ada4-7e7cb08c4113)
![eroded_8](https://github.com/user-attachments/assets/9254f6c3-7b36-4c1c-a468-1b2d81987e78)
![eroded_6](https://github.com/user-attachments/assets/f34510b4-7b7e-4964-a0c6-0d5d73124679)
![eroded_3](https://github.com/user-attachments/assets/7f3ed55f-6660-4196-bf34-c1eca9d61da4)

# KNN using PDF
![over_all_results_pdf](https://github.com/user-attachments/assets/22454d8f-d528-436d-9a69-c843814754a2)
![CM_pdf](https://github.com/user-attachments/assets/3e59f073-ac45-4320-be11-96364f879ebb)
