function [output] = simple_background_diff_function(v,row,col,length)

output = zeros(row,col,length);

%store previous frame
Pframe = rgb2gray(read(v,1));
%length = number of frame 

for Fn = 1:length
    currentFrame = rgb2gray(read(v,Fn));
    %simple subtraction
    diff = abs(Pframe-currentFrame);
    %diff = medfilt2(diff);
    %threshold 
    diff = im2double(diff);
    diff(diff<=0.2) = 0;
    diff(diff>0.2) = 1;
    %update to return output
    output(:,:,Fn) = diff(:,:);
    output(:,:,Fn) = medfilt2(output(:,:,Fn));
    output(:,:,Fn) = bwlabel(output(:,:,Fn));
    
  
end

