function [ img_out ] = my_resample( img_in )
%UNTITLED4 Takes a 512*512 and expands by a factor then recentralizes

if ~isequal(size(img_in), [512, 512])
   error('fel'); 
end

% First we interpolate
Ir = zeros(512, 753);

for y = 1:512
    for x = 1:753
        r = (x-0.5)*512/753;
        xl = floor(r);
        xr = ceil(r);
        al = r - xl;
        ar = xr - r;
%         xl = x*512/753;
%         xr = (x+1)*512/753;
        vl = img_in[xl];
        vr = img_in[xr];
        
        v = vl*ar + vr*al;
        Ir(y, x) = v;
    end
end
        

% Now we just keep middle part

end

