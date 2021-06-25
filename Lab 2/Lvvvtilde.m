function pixels = Lvvvtilde(inpic,shape)
%LVVVTILDE Summary of this function goes here
%   Detailed explanation goes here
dxmask = [-0.5, 0, 0.5, 0, 0; 0,0,0,0,0; 0,0,0,0,0; 0,0,0,0,0; 0,0,0,0,0];
dymask = dxmask';
dxxmask = [1,-2,1,0,0; 0,0,0,0,0; 0,0,0,0,0; 0,0,0,0,0; 0,0,0,0,0];
dyymask = dxxmask';
%dxymask = filter2(dxmask, dymask, 'same');
dxxxmask = filter2(dxxmask, dxmask, 'same');
dxxymask = filter2(dxxmask, dymask, 'same');
dxyymask = filter2(dxmask, dyymask, 'same');
dyyymask = filter2(dyymask, dymask, 'same');

Lx = filter2(dxmask, inpic, shape);
Ly = filter2(dymask, inpic, shape);
Lxxx = filter2(dxxxmask, inpic, shape);
Lyyy = filter2(dyyymask, inpic, shape);
Lxxy = filter2(dxxymask, inpic, shape);
Lxyy = filter2(dxyymask, inpic, shape);
pixels = (Lx.^3).*Lxxx + 3.*(Lx.^2).*Ly.*Lxxy + 3.*Lx.*(Ly.^2).*Lxyy + (Ly.^3).*Lyyy;

end

