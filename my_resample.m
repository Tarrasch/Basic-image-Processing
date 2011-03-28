function [ img_out ] = my_resample( img_in )
%UNTITLED4 Takes a 512*512 and expands by a factor then recentralizes

if ~isequal(size(img_in), [512, 512])
   error('fel'); 
end

% First we interpolate
Ir = zeros(512, 753);

for y = 1:512
    for x = 1:753
%         +0.00001 so floor/ceil work as i want
        r = (x+0.5)*512/753+0.00001;
        
        xl = floor(r);
        xr = ceil(r);
        al = r - xl;
        ar = xr - r;
        vl = img_in(y, max(1, xl));
        vr = img_in(y, min(512, xr));
        
        v = vl*ar + vr*al;
        Ir(y, x) = v;
    end
end
        

% Now we just keep middle part

img_out = Ir(:, 121:632);

if ~isequal(size(img_out), [512, 512])
   error('fel2'); 
end

end

