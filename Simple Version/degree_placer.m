function LToG = degree_placer(degree,element_type)
% degree = [a,b,c,d,e,f] like [7,8,3,4,5,6]
LToG = [];
if element_type == "D2QU4N"
    for i=1:8
        for j=1:8
            LToG = [LToG;degree(i) degree(j)];
        end
    end
elseif element_type == "D2TR3N"
    for i=1:6
        for j=1:6
            LToG = [LToG;degree(i) degree(j)];
        end
    end
end
end