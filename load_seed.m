function [ my_images ] = load_seed( path )
%UNTITLED2 Given path, like "img/rum_crisp" loads "img/rum_crisp#.tif"

my_images=zeros(5, 512, 512);

size(my_images)
for i = 1:5 
    s = [path num2str(i) '.tif'];
    M = double(imread(s));
    M = M/255;
    my_images(i,:,:) = M;
end

end

