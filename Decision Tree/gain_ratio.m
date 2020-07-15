%To calculate split info of each attribute
r = q; [row_r, col_r] = size(r);
split_count = zeros(row_r, 1)
splitinfo = zeros(row_r, 1)
for i = 1:row-r
    for jj = 1:col_r
        if r(i, jj) ~= 0
            split_count(i) = split_count(i)+r(i, jj);
        end
    end
    for jj = 1:col_r
        if r(i,jj) ~=0
            r(i,jj) = r(i, jj)/split_count(i);
            splitinfo(i) = splitinfo(i)+r(i, jj)* log2(r(i, jj));
        end
    end
    splitinfo(i) = -1.* splitinfo(i)
end
Gain_ratio = infor_gains./splitinfo
[gain, max_gain_feature] = max(Gain_ratio)