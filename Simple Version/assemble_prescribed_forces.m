function Fp = assemble_prescribed_forces(ENL,NL)
NoN = size(NL,1);
DOFs = 0;
for i=1:NoN
    
    if ENL(i,3) == 1
        DOFs = DOFs + 1;
        Fp(DOFs,1) = ENL(i,11);
    end
    
    if ENL(i,4) == 1
        DOFs = DOFs + 1;
        Fp(DOFs,1) = ENL(i,12);
    end
    
end
end