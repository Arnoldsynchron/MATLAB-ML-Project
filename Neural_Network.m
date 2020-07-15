% MATLAB Implementation of Perceptron Training and Testing Algorithm

clc
res_data = load('reservoir_data.txt');
res_data = res_data(1:end,2:end);
data_features = res_data(1:end, 1:end-1); %data_features
data_targets = res_data(1:end, end);

%Initialize the network
net = feedforwardnet;
net = configure(net, data_features,data_targets);
hiddenLayerSize = 10;
net = patternnet(hiddenLayersize); %pattern recognition network

net.divideParam.trainRatio = 0.7; %training ration
net.divideParam.valRatio = 0.2; %testing ration
net.divideParam.testRatio = 0.1; %validation ration

[net, tr] = train(net, data_features, data_targets);

ouputs = net(data_features);
errors = gsubtract(data_targets, outputs);

performance = perform(net, data_targets, outputs);
view(net)




