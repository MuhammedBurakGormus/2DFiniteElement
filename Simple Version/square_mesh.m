function [NL,EL] = square_mesh(geometry_width,geometry_height,width_density,height_density,element_type)
if element_type == "D2QU4N"
    NoE = width_density*height_density;
    NoN = (width_density+1)*(height_density+1);
    NL = zeros(NoN,2);
    EL = zeros(NoE,4);
    x_increment = geometry_width/width_density;
    y_increment = geometry_height/height_density;
    x_coor = 0;
    y_coor = 0;
    for i=1:NoN
        NL(i,1) = x_coor ;
        NL(i,2) = y_coor ;
        if rem(i,width_density+1) == 0
            x_coor = 0;
            y_coor = y_coor + y_increment;
        else
            x_coor = x_coor + x_increment;
        end
    end
    row_counter = 0;
    for i=1:NoE
        if rem(i-1,width_density) == 0 
            EL(i,1) = row_counter * (width_density+1) + 1;
            EL(i,2) = EL(i,1) + 1;
            EL(i,4) = (row_counter+1) * (width_density+1) + 1;
            EL(i,3) = EL(i,4)  + 1;
            row_counter = row_counter + 1;
        else
            EL(i,1) = EL(i-1,2); 
            EL(i,2) = EL(i,1) + 1; 
            EL(i,4) = EL(i-1,3) ;
            EL(i,3) = EL(i,4)  + 1;
        end
    end
elseif element_type == "D2TR3N"
    NoE = width_density*height_density;
    NoN = (width_density+1)*(height_density+1);
    NL = zeros(NoN,2);
    EL = zeros(NoE,4);
    x_increment = geometry_width/width_density;
    y_increment = geometry_height/height_density;
    x_coor = 0;
    y_coor = 0;
    for i=1:NoN
        NL(i,1) = x_coor ;
        NL(i,2) = y_coor ;
        if rem(i,width_density+1) == 0
            x_coor = 0;
            y_coor = y_coor + y_increment;
        else
            x_coor = x_coor + x_increment;
        end
    end
    row_counter = 0;
    for i=1:NoE
        if rem(i-1,width_density) == 0 
            EL(i,1) = row_counter * (width_density+1) + 1;
            EL(i,2) = EL(i,1) + 1;
            EL(i,4) = (row_counter+1) * (width_density+1) + 1;
            EL(i,3) = EL(i,4)  + 1;
            row_counter = row_counter + 1;
        else
            EL(i,1) = EL(i-1,2); 
            EL(i,2) = EL(i,1) + 1; 
            EL(i,4) = EL(i-1,3) ;
            EL(i,3) = EL(i,4)  + 1;
        end
    end
    New_EL_counter = 0;
    New_EL = zeros(NoE*2,3);
    for i=1:NoE
        first = EL(i,1);
        second = EL(i,2);
        third = EL(i,3);
        fourth = EL(i,4);
        
        New_EL_counter = New_EL_counter + 1;
        New_EL(New_EL_counter,1) = first;
        New_EL(New_EL_counter,2) = second;
        New_EL(New_EL_counter,3) = fourth;
        
        New_EL_counter = New_EL_counter + 1;
        New_EL(New_EL_counter,1) = second;
        New_EL(New_EL_counter,2) = third;
        New_EL(New_EL_counter,3) = fourth;
    end
    EL = New_EL;
end
end
