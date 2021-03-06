function pointSet = findpixelbtpoints(points)
%FINDPIXELBTPOINTS finds the pixel between points.
%   [pointSet] is cell array of size N-1 x 1, where N is the number of
%   points.  
%   [points] is matrix of size N x 2, like [x1 y1;x2 y2;...;xn yn];


% p = round(points);
% diffXY = abs(p(2:end,:)-p(1:end-1,:))+1;
% nPixel = max(diffXY,[],2);
% x = p(1,1);
% y = p(1,2);
% if size(diffXY,1) >1
%     for i = 1:size(diffXY,1)
%         x = [x round(linspace(p(i,1),p(i+1,1),nPixel(i)))];
%         y = [y round(linspace(p(i,2),p(i+1,2),nPixel(i)))];
%     end
% end
% pointSet = unique([x' y'],'rows');

% -----updated
p = round(points);
if size(p,1) == 1
    pointSet = {p};
    return
end
diffXY = abs(p(2:end,:)-p(1:end-1,:))+1;
nPixel = max(diffXY,[],2);
nPoints = size(diffXY,1);
pointSet = cell(1,nPoints);

if nPoints >1
    for i = 1:nPoints
        x = [round(linspace(p(i,1),p(i+1,1),nPixel(i)))];
        y = [round(linspace(p(i,2),p(i+1,2),nPixel(i)))];
        pointSet{i} = [x' y'];
    end
end



%
% function [x,y]=findpixelbt2points(p1,p2)
% % Find the pixel between two points.
%
% p1=round(p1); % [x,y]
% p2=round(p2);
% nX = abs(p1(1)-p2(1))+1;
% nY = abs(p1(2)-p2(2))+1;
% nPixel = max(nX, nY);
% x = round(linspace(p1(1),p2(1),nPixel));
% y = round(linspace(p1(2),p2(2),nPixel));
