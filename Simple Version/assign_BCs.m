function [ENL,DOFs,DOCs] = assign_BCs(NL,deformation_type,width,height,deformation_magnitude)

NoN = size(NL,1); %rows, Number of nodes
PD = size(NL,2); %columnss, Problem Degree
ENL = zeros(NoN,PD*6); %6Columns
ENL(:,1:2) = NL; %Coordinates

if deformation_type == "Shear"
    
    for i=1:NoN
        
        if ENL(i,2) == 0 %if the y coordinate of the node is 0 - Bottom Line
            
            ENL(i,3) = -1 ;%dirichlet
            ENL(i,4) = -1 ;%dirichlet
            
            ENL(i,9) = 0 ; %x coord stays the same
            ENL(i,10) = 0 ; %y coord stays the same
            
        elseif ENL(i,2) == height %if the y coordinate of the node is height - Top Line
            
            ENL(i,3) = -1; %dirichlet
            ENL(i,4) = -1; %dirichlet
            
            ENL(i,9) = deformation_magnitude; %deformation
            ENL(i,10) = 0; %y def is zero
            
        else %anywhere it is Neumann BC
            
            ENL(i,3) = 1; %Neumann
            ENL(i,4) = 1; %Neumann
            
            ENL(i,11) = 0; %Zero force - neumann assumption
            ENL(i,12) = 0; %Zero force - neumann assumption
            
        end
 
    end
    
elseif deformation_type == "Extension"
    
    for i=1:NoN
        
        if ENL(i,1) == 0 %the nodes at the left line
            
            ENL(i,3) = -1; %dirichlet
            ENL(i,4) = -1; %dirichlet
            
            ENL(i,9) = -deformation_magnitude; %deformation in the x direction
            ENL(i,10) = 0; %deformation in y is zero
            
        elseif ENL(i,1) == width %the nodes at the right line
            
            ENL(i,3) = -1; %dirichlet
            ENL(i,4) = -1; %dirichlet
            
            ENL(i,9) = deformation_magnitude; %deformation in the x direction
            ENL(i,10) = 0; %deformation in y is zero
        
        else %anywhere except those Neumann
            
            ENL(i,3) = 1; %dirichlet
            ENL(i,4) = 1; %dirichlet
            
            ENL(i,11) = 0; %force in the x direction
            ENL(i,12) = 0; %force in y is zero
        
        end
               
    end
    
elseif deformation_type == "Expansion"
    
    for i=1:NoN
        
        if ENL(i,1) == 0 %the line at the left
            
            ENL(i,3) = -1; %dirichlet
            ENL(i,4) = -1; %dirichlet
            
            ENL(i,9) = deformation_magnitude*ENL(i,1); %basically 0
            ENL(i,10) = deformation_magnitude*ENL(i,2); %linear change in y def
            
        elseif ENL(i,1) == width 
            
            ENL(i,3) = -1; %dirichlet
            ENL(i,4) = -1; %dirichlet
            
            ENL(i,9) = deformation_magnitude*ENL(i,1); %basically 0
            ENL(i,10) = deformation_magnitude*ENL(i,2); %linear change in y def
            
        elseif ENL(i,2) == 0
            
            ENL(i,3) = -1; %dirichlet
            ENL(i,4) = -1; %dirichlet
            
            ENL(i,9) = deformation_magnitude*ENL(i,1); %basically 0
            ENL(i,10) = deformation_magnitude*ENL(i,2); %linear change in y def
            
        elseif ENL(i,2) == height
            
            ENL(i,3) = -1; %dirichlet
            ENL(i,4) = -1; %dirichlet
            
            ENL(i,9) = deformation_magnitude*ENL(i,1); %basically 0
            ENL(i,10) = deformation_magnitude*ENL(i,2); %linear change in y def
            
        else
            
            ENL(i,3) = 1; %dirichlet
            ENL(i,4) = 1; %dirichlet
            
            ENL(i,9) = 0; %basically 0
            ENL(i,10) = 0; %linear change in y def                 
        end  
    end    
end

DOFs = 0;
DOCs = 0;

for i=1:NoN
    
    if ENL(i,3) == -1 %dirichlet
        DOCs = DOCs - 1 ;
        ENL(i,5) = DOCs;
    end
    
    if ENL(i,3) == 1 %Neumann
        DOFs = DOFs + 1;
        ENL(i,5) = DOFs;
    end
    
    if ENL(i,4) == -1 %dirichlet 
        DOCs = DOCs - 1 ;
        ENL(i,6) = DOCs;
    end
    
    if ENL(i,4) == 1 %neumann
        DOFs = DOFs + 1;
        ENL(i,6) = DOFs;
    end
    
end

DOCs = abs(DOCs);
%filling the 7th and 8th columns of ENL
dummy_dof = DOFs;

for i = 1:NoN
    
    if ENL(i,5) < 0
        dummy_dof = dummy_dof + 1;
        ENL(i,7) = dummy_dof;
    else
        ENL(i,7) = ENL(i,5);
    end
    
    if ENL(i,6) < 0
        dummy_dof = dummy_dof + 1;
        ENL(i,8) = dummy_dof;
    else
        ENL(i,8) = ENL(i,6);
    end

end

end









