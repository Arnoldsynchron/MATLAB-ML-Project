%% File import and Implementation of the Naive Bayes Algorithm in MaTLaB
file_id = fopen('C:/Users/user/Downloads/data.csv');
out = textscan(file_id, '%s%s%s%s%s', 'delimiter',',');
fclose(file_id);
num_featureswithclass = size(out,2);
tot_rec = size(out{size(out,2)},1)-1;

for i = i:tot_rec
    yy{i} = out{num_featureswithclass}{i+1};
end
for i = 1:num_featureswithclass
    xx{i} = out{i};
end

%Calculation of probablilties of class variables
yu = unique(yy); %unique classes label
nc = length(yu); % number of classes
fy = zeros(nc,1);
num_of_rec_for_each_class = zeros(nc,1);
for i= 1:nc
    for j = 1:tot_rec
        if (yy{j} == yu{i})
            num_of_rec_for_each_class(i) = num_of_rec_for_each_class(i) +1;
        end
    end
end

%Calculating the likelihood table
prob_table = zeros(num_featureswithclass-1,10,nc);
for col = 1:num_featureswithclass-1
    unique_value= unique(xx{col});
    rec_unique_value{col} = unique_value;
    for i = 2:length(unique_value)
        for j = 2:tot_rec +1
            if strcmp(xx{col}{j}, unique_value{i}) ==1 && ...
                strcmp(xx{num_featureswithclass}{j}, yu{1}) == 1;
                prob_table(col, i-1,1) = prob_table(col, i-1,1)+1;
            end
            if strcmp (xx{col}{j}, unique_value{i}) ==1 && ...
                strcmp(xx{num_featureswithclass}{j}, yu{2}) ==1
                prob_table(col, i-1,2) = prob_table(col, i-1,2)+1;
            end
        end
    end
prob_table (:,:,1) = prob_table(:,:,1)./num_of_rec_for_each_class(1);
prob_table(:,:,2) = prob_table(:,:,2)./num_of_rec_for_each_class(2);
 
%Implementation of the Naive Bayes Algorithm

A = {'sunny', 'hot','high', 'false'};
A1 = find(ismember(rec_unique_value{1}, A{1}));
A11 = 1;
A2 = find(ismember(rec_unique_value{2},A{2}));
A21 = 2;
A3 = find(ismember(rec_unique_value{3}, A{3}));
A31 =3;
A4 = find(ismember(rec_unique_value{4},A{4}));
A41 =4;

ProbN = prob_table(A11, A1-1,1)*prob_table(A21,A2-1,1)*prob_table(A31, A3-1,1)...
    *prob_table(A41,A4-1,1)*fy(1);
ProbP = prob_table(A11, A1 -1,2)*prob_table(A21, A2-1,2)*prob_table(A31, A3-1,2)*...
    prob_table(A41,A4-1,2)*fy(2);

if ProbN> ProbP
    prediction = 'N';
else
    prediction = 'P';
end

    

    