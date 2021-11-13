function ENL = update_ENL(ENL,Uu,Fu)

NoN = size(ENL,1);
DOFs = 0;
DOCs = 0;

for i=1:NoN
    
    if ENL(i,3) == 1
        DOFs = DOFs + 1;
        ENL(i,9) = Uu(DOFs);
    end
    
    if ENL(i,4) == 1
        DOFs = DOFs + 1;
        ENL(i,10) = Uu(DOFs);
    end
    
end


for i=1:NoN
    
    if ENL(i,3) == -1
        DOCs = DOCs + 1;
        ENL(i,11) = Fu(DOCs);
    end
    
    if ENL(i,4) == -1
        DOCs = DOCs + 1;
        ENL(i,12) = Fu(DOCs);
    end
    
end

end