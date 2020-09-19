function [srad,sang,S]=specxture(f)
S=fftshift(fft2(f));
S=abs(S);
[M,N]=size(S);
x0=M/2+1;
y0=N/2+1;
rmax=min(M,N)/2-1;
srad=zeros(1,rmax);
srad(1)=S(x0,y0);
for r=2:rmax
    [xc,yc]=halfcircle(r,x0,y0);
    srad(r)=sum(S(sub2ind(size(S),xc,yc)));
end
[xc,yc]=halfcircle(rmax,x0,y0);
sang=zeros(1,length(xc));       
for a=1:length(xc)
    [xr,yr]=radial(x0,y0,xc(a),yc(a));
    sang(a)=sum(S(sub2ind(size(S),xr,yr)));
end
S=mat2gray(log(1+S));
function [xc,yc]=halfcircle(r,x0,y0)
theta=91:270;
theta=theta*pi/180;
[xc,yc]=pol2cart(theta,r);
xc=round(xc)'+x0;
yc=round(yc)'+y0;
function [xr,yr]=radial(x0,y0,x,y)
[xr,yr]=intline(x0,x,y0,y);
function [x,y]=intline(x1,x2,y1,y2)
dx=abs(x2-x1);
dy=abs(y2-y1);
if ((dx==0)&(dy==0))
    x=x1;
    y=y1;
    return;
end
flip=0;
if (dx>=dy)
    if(x1>x2)
        t=x1;x1=x2;x2=t;
        t=y1;y1=y2;y2=t;
        flip=1;
    end
    m=(y2-y1)/(x2-x1);
    x=(x1:x2).';
    y=round(y1+m*(x-x1));
else
    if(y1>y2)
        t=x1;x1=x2;x2=t;
        t=y1;y1=y2;y2=t;
        flip=1;
    end
     m=(x2-x1)/(y2-y1);
    y=(y1:y2).';
   x=round(x1+m*(y-y1));
end
if (flip)
    x=flipud(x);
    y=flipud(y);
end

