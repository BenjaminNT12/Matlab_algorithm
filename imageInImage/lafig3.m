function hNew=lafig3(newFig, fhv, FFM);
% lafig3(newFig, fhv, FFM) = Combines KF existing (sub)figures into a new figure.
% 	fhv : an array of the existing-figure handles
%	FFM(i,:) = [x0, y0, Wx, Hy] = desired geometry of sub-figure #i in relative units
% The outputs are all the new axes-handles
%       N.B. There may be more than one axes per sub-figure, since it may itself contain subplots...
%
% assumes the overall 'montage' is specified by the proper order of subfigures:
% i.e. later subfigures may overlap earlier
%
% *** General advice:
% Even if the demo tells you otherwise ...
%
% Keep your 3D plots separate: 
% Setting 'Renderer' = either 'zbuffer' or 'OpenGL' will 'pixelize' the whole fig, 
% i.e. its vector property (which is why you wanted a direct .PDF) will be lost
% 
% Conversely setting  'Renderer' = 'painters' is not compatible with fancy 3D rendering

% Set fgTabRasa=non-zero to first create a blank (white) board for each subfigure.
fgTabRasa = 0;
% You may customize further what this does (recall you're an advanced user)
% see below the choice of the <hba> axes properties

KF = length(fhv);

figure(newFig); clf

% overall axes counter:
jThis = 0;
for k = 1:KF
% ----------------------------------

figFrame = FFM(k,:);

relPosX = figFrame(1); relPosY = figFrame(2); 
relSclX = figFrame(3); relSclY = figFrame(4);

% Create a blank (white) board for this subfigure
% N.B. later subfigures may overlap earlier

if fgTabRasa
hba = axes('Position', figFrame); % axis off
set(hba, 'Box', 'off', 'XTick', [], 'YTick', [] );
%
set(hba, 'XColor', 'b', 'YColor', 'b', 'Box', 'on');
end

% ----------------------------------

aav = findobj(fhv(k),'Type','axes');

% whos aav; keyboard
%  aav       10x1   

for j = 1:length(aav)

% the Position of the existing axes:
hThis = aav(j); thisPos = get(hThis,'Position');

X0 = thisPos(1); Y0 = thisPos(2); WX = thisPos(3); HY = thisPos(4); 
newSz = [relSclX*WX relSclY*HY];

% the position of given axes (wrt the whole-fig W & H) is in [0,1] normalized units
newOrg = [relPosX + relSclX*X0, relPosY + relSclY*Y0];

jThis = jThis + 1;
hNew(jThis) = copyobj(hThis,newFig); set(hNew(jThis), 'Position', [newOrg newSz]);
legend('x1','x2')
end %j (current axes to copy)

% ----------------------------------
end %k (current figure to embed)