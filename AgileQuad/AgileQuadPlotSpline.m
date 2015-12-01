% AgileQuadPlotSpline plots the spline trajectory generated by the smoother
%
%   AUTHOR: Ross Allen, ASL, Stanford University
%   DATE:   May 5, 2015
%
%   INPUTS:
%
%   OUTPUTS:
%
%   NOTES:
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function err = AgileQuadPlotSpline(mpinfo)

% hardcoded params
nPlotPoints = 100;

% extract information
smoother = mpinfo.smoother;
nCoef = smoother.nCoef;
nSeg = smoother.nSeg;
Tdel = smoother.Tdel;
if isfield(smoother, 'p_coefs')
    p_coefs = smoother.p_coefs;
else
    p_coefs = smoother.splineCoefs;
end

figure
hold on
    
for l = 1:nSeg
    baseInd = (l-1)*nCoef;
    tVec = linspace(0, Tdel(l,1), nPlotPoints);
    xPos = polyval(flipud(p_coefs(1+baseInd:nCoef+baseInd,1)), tVec);
    yPos = polyval(flipud(p_coefs(1+baseInd:nCoef+baseInd,2)), tVec);
    zPos = polyval(flipud(p_coefs(1+baseInd:nCoef+baseInd,3)), tVec);
    plot3(xPos, yPos, zPos);
    hold on
end
set(gca, 'ZDir', 'reverse');

figure
hold on

for l = 1:nSeg
    baseInd = (l-1)*nCoef;
    tVec = linspace(0, Tdel(l,1), nPlotPoints);
    xPos = polyval(flipud(p_coefs(1+baseInd:nCoef+baseInd,1)), tVec);
    yPos = polyval(flipud(p_coefs(1+baseInd:nCoef+baseInd,2)), tVec);
    zPos = polyval(flipud(p_coefs(1+baseInd:nCoef+baseInd,3)), tVec);
    plot3(xPos, yPos, zPos, 'b*');
    hold on
end

for l = 1:nSeg
    baseInd = (l-1)*nCoef;
    tVec = linspace(0, Tdel(l,1), nPlotPoints);
    xPos = polyval(flipud(p_coefs(1+baseInd:nCoef+baseInd,1)), tVec);
    yPos = polyval(flipud(p_coefs(1+baseInd:nCoef+baseInd,2)), tVec);
    zPos = polyval(flipud(p_coefs(1+baseInd:nCoef+baseInd,3)), tVec);
    plot3(xPos, yPos, zPos, 'ro');
    hold on
end

set(gca, 'ZDir', 'reverse');
