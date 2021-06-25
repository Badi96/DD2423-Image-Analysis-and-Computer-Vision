function edgecurves = extractedge(inpic, scale, threshold, shape)
%EXTRACTEDGE Summary of this function goes here
%   Detailed explanation goes here
Lvv = Lvvtilde(gaussfft(inpic, scale), shape);
Lvvv = Lvvvtilde(gaussfft(inpic, scale), shape);

%Lvv = Lvvtilde(discgaussfft(inpic, scale), shape);
%Lvvv = Lvvvtilde(discgaussfft(inpic, scale), shape);
edgecurves = zerocrosscurves(Lvv-threshold, -1.*Lvvv);

end

