%Implementation of K Nearest Neighbor on the Ecoli dataset
clear;clc;
Ecoli_data = load('C:/Users/user/Desktop/ecoli.txt'); %Load dataset
Ecoli_attribute = Ecoli_data(:,1:end-1); % Features
Ecoliclass = Ecoli_data(:,end); %Target

%KNN Implementation --1
knnmodel_1 = ClassificationKNN.fit(Ecoli_attribute(1:280,:), Ecoliclass(1:280), ...
    'NumNeighbors',5);

%KNN Implementation --2
knnmodel_2 = ClassificationKNN.fit(Ecoli_attribute(1:280,:),Ecoliclass(1:280), ...
    'NumNeighbors',5, 'DistanceWeight', 'Inverse');
pred = knnmodel_2.predict(Ecoli_attribute(281:end,:));

knnAccuracy = 1 - find(length(Ecoliclass(281:end)-Pred))/length(Ecoliclass(281:end));
knnAccuracy =  knnAccuracy *100;



