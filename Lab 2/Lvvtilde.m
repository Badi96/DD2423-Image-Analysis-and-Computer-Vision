function pixels = Lvvtilde(inpic,shape)
%LVVTILDE Summary of this function goes here
%   Detailed explanation goes here
dxmask = [-0.5, 0, 0.5, 0, 0; 0,0,0,0,0; 0,0,0,0,0; 0,0,0,0,0; 0,0,0,0,0];
dymask = dxmask';
dxxmask = [1,-2,1,0,0; 0,0,0,0,0; 0,0,0,0,0; 0,0,0,0,0; 0,0,0,0,0];
dyymask = dxxmask';
dxymask = filter2(dxmask, dymask, 'same');
 if (nargin < 2)
       shape = 'same';
 end
Lx = filter2(dxmask, inpic, shape);
Ly = filter2(dymask, inpic, shape);
Lxx = filter2(dxxmask, inpic, shape);
Lyy = filter2(dyymask, inpic, shape);
Lxy = filter2(dxymask, inpic, shape);
pixels = (Lx.^2).*Lxx + 2.*Lx.*Ly.*Lxy + (Ly.^2).*Lyy;


%{
dxmask = [-0.5, 0, 0.5, 0, 0; 0,0,0,0,0; 0,0,0,0,0; 0,0,0,0,0; 0,0,0,0,0];
dymask = dxmask';
dxxmask = [1,-2,1,0,0; 0,0,0,0,0; 0,0,0,0,0; 0,0,0,0,0; 0,0,0,0,0];
dyymask = dxxmask';
dxymask = filter2(dxmask, dymask, 'same');


Lx = filter2(dxmask, inpic, shape);
Ly = filter2(dymask, inpic, shape);
Lxy = filer2(dxymask, inpic, shape);
Lyy = filter2(dyymask, inpic, shape);
Lxx = filter2(dxxmask, inpic, shape);
pixels = (Lx.^2).*Lxx + 2.*Lx.*Ly.*Lxy + Ly.^2.*Lyy;
%}

end
