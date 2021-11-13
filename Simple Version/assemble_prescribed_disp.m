function Up = assemble_prescribed_disp(ENL,NL)
DOCs = 0;
NoN = size(NL,1);
for i=1:NoN
    
    if ENL(i,3) == -1
        DOCs = DOCs + 1;
        Up(DOCs,1) = ENL(i,9);
    end
    
    if ENL(i,4) == -1
        DOCs = DOCs + 1;
        Up(DOCs,1) = ENL(i,10);
    end
      
end
end
