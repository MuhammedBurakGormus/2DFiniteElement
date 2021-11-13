% you can store the stiffness values block by block, and then combine them 
%trying to permuate over the stiffness subscripts & superscprits
NPE = 3;
% for row=1:NPE  
%     for column=1:NPE 
%         disp([row column])       
%     end  
% end
stored_matrices = [];
counter = 0;
for row=1:NPE  
    for column=1:NPE 
        local_mat = zeros(2,2);
        for row_inside = 1:2
            for column_inside = 1:2
                index_val = 0;
                % we also need to loop over b&d
                for b=1:2
                    for d=1:2
                        
                        index_val = index_val + 
                    end
                end
                     
                local_mat(row_inside,column_inside) = 
                % sup1 = row = i; sup2 = column = j
                % sub1 = row_inside = a
                % sub2 = column_inside = c
                
            end
        end
        stored_matrices = [stored matrices local_mat] ;
        local_mat = zeros(2,2);
    end  
end