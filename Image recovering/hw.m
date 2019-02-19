imread('Tennis.bmp');
data = rgb2gray(Tennis);
figure(1);
imshow(data)
Y = fft2(data,342,522);
shiftuni = fftshift(Y);

%cerchio
r = 8;
rmin=7;
[m n]=size(shift)
m=m+2
n=n+2
for q= m/2-r:m/2+r
  for j = n/2-r:n/2+r
    if (q-m/2)^2+(j-n/2)^2<=r^2 & (q-m/2)^2+(j-n/2)^2>rmin^2
      shift(q,j) = 0;
    end
  end
end
figure(4); 
imagesc(log10(1+abs(shift)));
figure(5);
imshow(uint8(abs(ifft2(fftshift(shift)))));

%CANCELLA DUE PICCHI VICINO CENTRO
shift(168:170,258:261)=5000000;
shift(174:176,264:267)=5000000;

figure(4); 
imagesc(log10(1+abs(shift)));
figure(5);
imshow(uint8(abs(ifft2(fftshift(shift)))));

%CANCELLARE RIGE VERICALI o orizzontali
for o=[260 264]
    shift(150:200,o)=0;
end
for v=[ -6 6]
    shift(172+v,220:330)=0;
end
figure(4); 
imagesc(log10(1+abs(shift)));
figure(5);
imshow(uint8(abs(ifft2(fftshift(shift)))));

%rette 
shift=shiftuni;
%negativa
[m n] = size(shift);
x1 = m/2;
y1 = n/2;
x2 = 342;
y2 = 332;
a = (y2-y1)/(x2-x1);
for d=  [-87 -50 -36 -21 -11 -1 9 10 31 70 87 ]    
    b = ((-x1*(y2-y1))/(x2-x1))+y1;
    for x = 1:m %x 
      y = a*x+b+d;
      %if y<((n/2)-3) | y>((n/2)+3)        
          if x<m & x>0 
            %if x<((m/2)-12) | x>((m/2)+12)
              shift(x,round(y)-1:round(y)+1) = zeros(1,3);
            %end
          %end
        end
    end
end
figure(4); 
imagesc(log10(1+abs(shift)));
figure(5);
imshow(uint8(abs(ifft2(fftshift(shift)))));

%positiva
shift=shiftuni;
[m n] = size(shift)
x1 = 172;
y1 = 256;
x2 = 163;
y2 = 265;
a = (y2-y1)/(x2-x1);
for d=  [0 10]    
    b = ((-x1*(y2-y1))/(x2-x1))+y1;
    for x = 1:m %x 
      y = a*x+b+d;
      %if y<((n/2)-3) | y>((n/2)+3)        
          if x<m & x>0 
            %if x<((m/2)-12) | x>((m/2)+12)
              shift(x,round(y)-1:round(y)+1) = zeros(1,3);
            %end
          %end
        end
    end
end
figure(4); 
imagesc(log10(1+abs(shift)));
figure(5);
imshow(uint8(abs(ifft2(fftshift(shift)))));

%retta esatta
for x=1:m
    y=-7*x+1466;
    if y<=n & y >=0
        shift(x,round(y))=0;
    end
end


    for a=[2 10]
        for b=[2]
            f(172+a,262+b) = 10000000;
            f(172-a,262-b) = 10000000;
        end
    end
    
   for a=[1]
        for b=[2]
            %f(172+a,262-b) = 10000000;
            %f(172-a,262+b) = 10000000;
        end
   end  
figure(4); 
imagesc(log10(1+abs(shift)));
figure(5);
imshow(uint8(abs(ifft2(fftshift(shift)))));