digdata = getonedigit(3, 123, maindata);
downsampled_vector = extractmyfeatures_1(digdata);  % Uses erosion with 3x3 kernel
showdigit_2(downsampled_vector,3);

digdata = getonedigit(6, 123, maindata);
downsampled_vector = extractmyfeatures_1(digdata);  % Uses erosion with 3x3 kernel
showdigit_2(downsampled_vector,6);

digdata = getonedigit(8, 123, maindata);
downsampled_vector = extractmyfeatures_1(digdata);  % Uses erosion with 3x3 kernel
showdigit_2(downsampled_vector,8);
