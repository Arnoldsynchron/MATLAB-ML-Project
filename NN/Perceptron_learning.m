% MATLAB Implementation of Perceptron Training and Testing Algorithm

function w = Perceptron_learning(train_set, class, epochs, learning_rate)
% ouptut is an (m+1) dimensional vector of weights
% train_set is an n by m matrix, where the rows of the training set matrix
% represent the instances, the columns represent the features ir attributes
% class is an n-dimensional vector of 1's and -1's, corressponding to the
% instances of the training set. Epochs determines the number of times or
% training cycles to update the weights and biases. Learning rate
% determines the rate at which the weights and biases are updated

[n,m] = size(train_set);
w = 0.5*rand(1,m); %weight intialization
a = learning_rate;
for epoch = 1:epochs
    for j = 1:n
        x = train_set(j,:);
        wsum = sum(w.*x);
        if wsum>0
            y =1;
        else
            y = -1;
        end
        error = class(j)-y;
        w = w+error*x*a;
    end
end



