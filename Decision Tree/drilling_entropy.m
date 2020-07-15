function [max_gain_feature, gain] = drilling_entropy(x,y)
    max_gain_feature = 0
    info_gains = zeros(1, size(x,2))
    
    %calculate H(y)
    classes = unique(y);
    hy = 0;
    for c=1 : size(classes',1)
        c_name = classes{c};
        num_matches = 0;
        py(c) = 0;
        
        for rec_num = 1:size(y',1)
            rec_c_name = y{rec_name};
p = zeros(size(x,2),10,size(classes',1));

% iterate over all features (columns)
for col = 1:size(x,2)
    feature_with_header {col} = x{col};
    num_rec = size(y',1);
    for i  = 1:num_rec
        feature_without_header{i} = feature_with_header{col}{i+1};
    end
   %find unique values for each feature
    features = unique(feature_without_header);
    %calculate entropy
    hyx = 0;
    for c = 1:size(features',1)
        f_name = features{c};
        num_matches_feature = 0;
        num_matches_feature_class = 0;
        py(c) = 0;
        for rec_num = 1:size(feature_without_header',1)
            rec_c_name = feature_without_header{rec_num};
            if stremp (rec_c_name, f_name) == 1
                num_matches_feature = num_matches_feature +1;
                for  c1 = 1:size(classes',1)
                    c_name = classes{c1};
                    if (stremp(y{rec_num}, c_name) ==1) && (col ~= size(x,2))
                        p(col,c,c1) = p(col,c,c1)+1;
                    end
                end
            end
        end
    end
end
q = sum(p,3);
jprobtot = zeros(size(x,2),10);
for i = 1:size(classes',1)
    j{i} = p{:,:,i}./q;
    j{i}(isnan(j{i})) = 0;
    jprob{i} = j{i}.*log2(j{i});
    jprob{i}(isnan(jprob{i})) = 0;
end
probmat = cell2mat(jprob);
num_col = size(probmat,2);
step_size = num_col/size(classes',1);
for i = 1:step_size:num_col
    jprobtot = jprobtot +probmat(:,i:1+step_size-1);
end
qtot = q/sum(q(1,:));
EntropyPerFeature = jprobtot.*qtot;
EntropyFinal = -1*sum(EntropyPerFeature,2);
info_gains = hy-EntropyFinal;
info_gains = info_gains(1:size(info_gains)-1);

[gain, max_gain_feature] = max{info_gains);

        