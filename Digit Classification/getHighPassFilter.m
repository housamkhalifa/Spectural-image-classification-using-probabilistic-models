function img = getHighPassFilter(picGray,R)
 I1_ = fftshift(fft2(double(picGray)));
   [m n z] = size(picGray);
   h = fspecial('gaussian', [m n], (R));
   h = h./max(max(h));
      J_(:,:) = I1_(:,:).*((1-h));
      picGray = uint8(real(ifft2(ifftshift(J_))));
      img = picGray;
end