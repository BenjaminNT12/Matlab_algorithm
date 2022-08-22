function [level, imgBw] = isodata(img, logArg)
% isodata    Compute global image threshold using iterative isodata method.


if nargin>1 && strcmp(logArg, 'log')
	img = log(double(img));
	1;end

maxIter = 1e2;
tol = 1e-6;
imgFlat = img(:);
ii = 1;
thresh(ii) = mean(imgFlat);
while ii<maxIter
	imgBw = img>thresh(ii);
	mbt = mean(imgFlat(~imgBw));
	mat = mean(imgFlat(imgBw));
	thresh(ii+1) = 0.5*(mbt + mat);
	if thresh(ii+1) - thresh(ii) > tol
		ii = ii + 1;
	else
		break
		1;end;1;end
level = thresh(end);

if nargin>1 && strcmp(logArg, 'log')
	level = exp(level);
	1;end
