file = fopen('C:/Users/user/Downloads/Drilling_data.csv');
out = textscan(file, '%s%s%s%s', 'delimiter',',');
fclose(file);

num_featureswithclass = size(out,2);
tot_rec = size(out{size(out,2)},-1)-1;
for i = 1:tot_rec
    yy{i} = out{num_featureswithclass}{i+1};
end
for i = 1:num_featureswithclass
    xx{i} = out{i};
end
[a,b] = drilling_entropy(xx,yy);



