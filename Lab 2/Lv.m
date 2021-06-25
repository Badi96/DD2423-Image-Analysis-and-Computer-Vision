function pixels = Lv(inpic, shape)
     if (nargin < 2)
       shape = 'same';
     end
     %pic = gaussfft(inpic, 0.6);
     dxmask = [-0.5, 0, 0.5];
     dymask = dxmask';
   
     column_vector = zeros(2,256);
     row_vector = zeros(256,2);
     Lx = filter2(dxmask, inpic, shape);
 
     
     Ly = filter2(dymask, inpic, shape);
     %Ly = [Ly; column_vector];
     %Lx = [Lx, row_vector];
     %size(Ly)
  
     pixels = sqrt(Lx.^2 + Ly.^2);

