%%%% use correlation to do image matching a
a=imread('600mm_0mm.jpg');a=rgb2gray(a);a=double(a);
b=imread('600mm_5mm.jpg');b=rgb2gray(b);b=double(b);
%%%% assume the block and search size and center
% block size
Bx=551; hBx=fix(Bx/2);
By=371; hBy=fix(By/2);
% search size ( hS=10 is equal that search size is 20)
hS=10;
% padarray zeros in image a and b
x=1650:1654;
y=2272:2276;
for i=1:length(x)
    d=[];
    for r=x(i)-hS:x(i)+hS
        for c=y(i)-hS:y(i)+hS
            d(r-x(i)+hS+1,c-y(i)+hS+1)=norm(a(x(i)-hBx:x(i)+hBx,y(i)-hBy:y(i)+hBy)-b(r-hBx:r+hBx,c-hBy:c+hBy));
        end
    end
    [~,row1{i}]=min(d);
    [dmin(i),col(i)]=min(min(d));
    row(i)=row1{i}(col(i));
end
[~,k]=min(dmin);
xc=x(k);
yc=y(k);
dx=row(k)-hS-1;
dy=col(k)-hS-1;