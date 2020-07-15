%SVM Implementation

data = load('data.txt');
Features = data(:, 1:end-1); %features
Classes = data(:, end); %classes

SVMModel = svmtrain(Features, Classes, 'Kernel_Function', 'Linear')
New_classes = svmclassify(SVMStruct, TestingData);