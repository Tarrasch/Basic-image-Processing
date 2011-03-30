function [xc,yc]=my_contour(Ib)
%[xc,yc]=contour(Ib)
%
%Searches the boundary for an object in the binary image Ib.
%(where 1 is considered as object pixel), starting at the 
%first object pixel by scanning downwards each column from
%the left.
%
%The search goes in counter-clockwise order.
%
%xc and yc are the output boundary coordinates.
%

% Mats Kvarstr�m 010110 modified 020123
% Modified 030121 by John Gustafsson
% Modified 060120 by Anders Sj�gren to row/col indexation from single index style (help sub2ind)

%%% Notation %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% (xc,yc): coordinates of boundary in image
% d      : denotes direction in which we look/travel
%            d = | 0     | 1  | 2    | 3       
%          -----------------------------------
%                | right | up | left | down

%%% Main program %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% First Point
[ys,xs] = find(Ib==1);
x=xs(1); y=ys(1);
d=3; %the first point is found searching downwards
xc=x; yc=y; %add the first point to the result

% And iterate...
while size(xc,1)<=2 || ~(xc(1)==x & yc(1)==y)
  d = rotateCW(d); %begin with checking 1 step clockwise
  [newx,newy]=next(x,y,d);
  while Ib(newy,newx)~=1
    % If we would step out of the object, rotate counter-clockwise
    d = rotateCCW(d);
    [newx,newy]=next(x,y,d);
  end
  [x,y]=next(x,y,d);
  xc=[xc;x]; yc=[yc;y]; %add the new locations to the contour
end

%%% Subfunctions %%%%%%%%%%%%%%%%%%%d%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%

%%%
function dnew = rotateCW(d)
%Rotate the direction one step clockwise
  dnew = mod(d-1,4);	

%%%
function dnew = rotateCCW(d)
%Rotate the direction one step counter-clockwise
  dnew = mod(d+1,4);	

%%%
function [xnew,ynew] = next(x,y,d)
% Gives the coordinate of the next pixel
% from x,y, travelling according to d
%
xnew=x; ynew=y;
if d==0     % going right
  xnew = x+1;
elseif d==1 % going up
  ynew = y-1;
elseif d==2 % going left
  xnew = x-1;
else        % going down
  ynew = y+1;
end




