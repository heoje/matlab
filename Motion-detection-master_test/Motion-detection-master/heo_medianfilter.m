function [output] = heo_medianfilter(v,row,col,length)

Med = [];
output = zeros(v,row,col,length);
for i=2:row-1
        for j=2:col-1
            Med(1) = output(i-1,j-1,Fn);
            Med(2) = output(i-1,j,Fn) ;
            Med(3) = output(i-1,j+1,Fn);
            Med(4) = output(i,j-1,Fn);
            Med(5) = output(i,j+1,Fn);
            Med(6) = output(i+1, j-1,Fn);
            Med(7) = output(i+1,j,Fn);
            Med(8) = output(i+1,j+1,Fn);
            output(i,j,Fn) = median(Med);
        end
end