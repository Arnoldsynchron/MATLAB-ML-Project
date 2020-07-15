%Testing of the algorithm, Perceptron Testing function

function [Predictedclass, accuracy] = Perceptron_testing(test_set, class, w)
%The outputs are a vector of predicted class and prediction. accuracy as a
%percentage. accuracy is ratio of correctly classified classes to the total
%classes in the testing set. Testing set is an n by m dimensional matrix.
%and class are the corresponding classes for the feature vectors in the
%testing set matrix. The vector w is the vectors of weights, obtained
%during the training phase

[n, m] = size(test_set);
predictedclass = zeros(n,1);
for j = 1:n
    x = test_set (j,:);
    wsum = sum(w.*x);
    if wsum>0
        predictedclass(j) =1;
    else
        predictedclass(j)=-1;
    end
end
error = class - predictedclass
accuracy = (1-length(find(error))/length(error))*100;