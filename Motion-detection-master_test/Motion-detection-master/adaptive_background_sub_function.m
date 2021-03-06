function [output] = adaptive_background_sub_function(v,row,col,length)
    output = zeros(row,col,length);
    
    B = zeros(row,col,1,length);
    I = rgb2gray(read(v,1));
    B(:,:,1,1) = I(:,:);

    for Fn = 2:length
        %get next frame
        I = rgb2gray(read(v,Fn));
        diff = abs(double(B(:,:,1,Fn-1))-double(I(:,:)));
        %threshold
        diff(diff>30) = 250;
        diff(diff<30) = 0;
        output(:,:,Fn) = diff(:,:);
        output(:,:,Fn) = medfilt2(output(:,:,Fn));
        %adapt background
        B(:,:,1,Fn) = 0.1*double(I) + 0.9*double(B(:,:,1,Fn-1));
    end
end

