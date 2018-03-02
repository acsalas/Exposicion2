function [patternv,patternr,patterng] =  obtener_patrones(w,a0, nfft, N, idx, dol)
eps = .00001;
patternv = (abs(fftshift(fft((conj(w).*a0)',nfft)))).^2;
% convert radiation pattern to dBs
patternr = 10*log10(patternv(idx) ./N + eps);
% Compute directive gain pattern
rbarr = 0.5 *sum(patternv(idx)) ./ (nfft * dol);
patterng = 10*log10(patternv(idx) + eps) - 10*log10(rbarr + eps);
return
