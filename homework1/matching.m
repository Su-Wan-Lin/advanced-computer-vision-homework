%%%% use correlation to do image matching
a = imread('trucka.bmp');
b = imread('truckb.bmp');
%%%% assume the block is 31x31
a1 = padarray(a,[60 60]);
b1 = padarray(b,[60 60]);
[m,n] = size(a1);
center = 76:31:(9*31+76);
x = [];
y = [];

xx = [];
yy = [];
for i = 1:length(center)
   for j = 1:length(center)
   d1 = [];
   r1 = [];
   c1 = [];
   for r = center(i):center(i)+25
       for c = center(j) - 25:center(j)
d=sum(sum(abs(a1(center(i)-15:center(i)+15,center(j)- 15:center(j)+15)-b1(r-15:r+15,c-15:c+15))));
          r1 = [r1 r];
          c1 = [c1 c];
          d1 = [d1 d];
       end
   end
   index = find(d1 == min(d1));
   x = [x center(i)];
   y = [y center(j)];
   xx = [xx r1(index(end))];
   yy = [yy c1(index(end))];
   end
end
dx = xx-x;
dy = yy-y;
figure;
quiver(x,y,dx,dy);
axis([0 m 0 n]);
axis square;




