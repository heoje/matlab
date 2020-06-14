%read video
%change path for different video
path = 'walk.mp4';
v = VideoReader(path);
%o0 = implay(path);
%set(o0.Parent,'Name', 'ori     gin Image');
length = v.NumberOfFrames;  %591 
image = read(v,1);  
[row,col,z] = size(image);  %316x240x3(RGB) 

%get 4 array from different method
output1 = simple_background_diff_function(v,row,col,length);
o1 = implay(output1); 
set(o1.Parent, 'Name', 'simple_background_diff_function');
%output2 = simple_frame_diff_function(v,row,col,length);
%o2 = implay(output2);
%set(o2.Parent, 'Name', 'simple_frame_diff_function');
%output3 = adaptive_background_sub_function(v,row,col,length);
%o3 = implay(output3);
%set(o3.Parent, 'Name', 'adaptive_background_sub_function');
%output4 = persistent_frame_diff_function(v,row,col,length);
%o4 = implay(output4);
%set(o4.Parent, 'Name', 'persistent_frame_diff_function');


