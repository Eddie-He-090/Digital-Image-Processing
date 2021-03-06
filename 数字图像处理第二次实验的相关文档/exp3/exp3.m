%实验三  二维离散傅里叶变换性质和频域滤波

%五、实验步骤
%1、图像的二维离散傅里叶变换与二维离散傅里叶逆变换

%（1）显示图像的离散傅里叶变换谱
clear all;
clc;
I=imread('cameraman1.tif'); %读取图像
J=fftshift(fft2(I));   %求图像的傅里叶变换谱并进行频谱中心化
imshow(I),title('原始图像') ;
figure,imshow(log(1+abs(J)),[]);title('原始图像的幅度谱')  %采用对数方法显示原图的幅度谱


%（2）显示图像的离散傅里叶变换的幅度谱和相位谱
clear all;
clc;
I=imread('lena.tif'); %读取图像
J=fftshift(fft2(I));   %求图像的傅里叶变换谱并进行频谱中心化
subplot(1,2,1),imshow(log(1+abs(J)),[]);title('原图像的幅度谱')  %对数方法显示原图的幅度谱
subplot(1,2,2),imshow(angle(J)),title('原图像相位谱') ;    %显示原图的相位谱


%（3）显示高斯低通滤波输出图的幅度谱
clear all;
clc;
I=imread('cameraman1.tif'); %读取图像
J=fftshift(fft2(I));   %求图像的傅里叶变换谱并进行频谱中心化
h=fspecial('gaussian',21,2);   
K=imfilter(I,h);          %求图像的高斯低通滤波
L=fftshift(fft2(K));
subplot(1,2,1),imshow(log(1+abs(J)),[]);title('原始图像的幅度谱')  %对数方法显示原图幅度谱
subplot(1,2,2),imshow(log(1+abs(L)),[]);title('高斯低通滤波输出图的幅度谱')  
%采用对数方法显示高斯低通滤波输出图的幅度谱


%（4）二维离散傅里叶逆变换
clear all;
clc;
I=imread('lena.tif'); %读取图像
J=fft2(I);   %求图像的傅里叶变换谱
K=ifft2(J);  %采用二维离散傅里叶逆变换重构图像
subplot(1,2,1),imshow(I);title('原始图像') ;
subplot(1,2,2),imshow(real(K),[]);title('傅里叶变换谱的重构图')  %傅里叶变换谱的重构图


%（5）傅里叶变换谱实部的二维离散傅里叶逆变换
clear all;
clc;
I=imread('lena.tif'); %读取图像
J=real(fft2(I));   %求图像傅里叶变换谱的实部
K=ifft2(J);
subplot(1,2,1),imshow(I);title('原始图像') ;
subplot(1,2,2),imshow(real(K),[]);title('傅里叶变换谱实部的重构图') 
 %显示傅里叶变换谱实部的重构图	


 %（6）傅里叶变换相位信息的二维离散傅里叶逆变换
clear all;
clc;
I=imread('lena.tif'); %读取图像
J=fft2(I)./abs(fft2(I));   
K=ifft2(J);
subplot(1,2,1),imshow(I);title('原始图像') ;
subplot(1,2,2),imshow(real(K),[]);title('傅里叶变换相位信息的重构图') 
 %显示傅里叶变换相位信息的重构图	


%2、图像二维离散傅里叶变换的性质

%（1）二维离散傅里叶变换的可分离性
clear all;
clc;
I=imread('lena.tif'); %读取图像
[M,N]=size(I);
J=zeros(M,N);
K=zeros(M,N);
for i=1:M
    J(i,:)=fft(I(i,:));%先执行行方向一维FFT
end
for j=1:N
    K(:,j)=fft(J(:,j));%接着执行列方向的一维FFT
end
H=ifft2(K);  %对图像的傅里叶变换谱执行二维离散傅里叶逆变换
subplot(1,2,1),imshow(log(1+abs(fftshift(K))),[]);title('原始图像的幅度谱') 
subplot(1,2,2),imshow(real(H),[]);title('傅里叶变换谱的重构图')


%（2）二维离散傅里叶变换的旋转性质
clear all;
clc;
I=imread('boat.bmp ');
J= imrotate(I,90);
K=fftshift(fft2(I)); 
L=fftshift(fft2(J)); 
subplot(1,2,1),imshow(log(1+abs(K)),[]);title('原始图像的幅度谱')
subplot(1,2,2),imshow(log(1+abs(L)),[]);title('图像旋转90度后的幅度谱') 


%（3）二维离散傅里叶变换的共轭对称性质
clear all;
clc;
I=imread('lena.tif'); %读取图像
J=fft2(I);   
K=conj(J);  %对傅里叶变换谱求共轭
H=ifft2(K); 
imshow(real(H),[]);title('傅里叶变换谱求共轭后的重构图')


%（4）二维离散傅里叶变换的平移性质
I=imread('cameraman1.tif');
J=fftshift(I);  %对图像I进行循环移位
K=fftshift(fft2(I));   %求原图像的傅里叶变换谱并进行频谱中心化
L=fftshift(fft2(J));   %求平移后图像的傅里叶变换谱并进行频谱中心化
subplot(1,2,1),imshow(log(1+abs(K)),[]);title('原始图像的幅度谱')  
subplot(1,2,2),imshow(log(1+abs(L)),[]);title('图像平移后的幅度谱')  


%（5）二维离散傅里叶变换的卷积定理和相关定理
%基于相关运算，通过模板匹配检测文本图像中的字符a,
clear all;
clc;
textimage = imread('text1.png');
a = textimage(32:45,88:98);   %字符a的模板图像 
imshow(textimage);
figure, imshow(a);
C = real(ifft2(fft2(textimage) .* fft2(rot90(a,2),256,256)));    
figure, imshow(C,[]) 
thresh = 60;     % 设置相关峰的检测阈值
figure, imshow(C > thresh);   % 检测大于阈值的相关峰，则对应的位置为字符a


%3、频域滤波

%（1）频域理想低通滤波
clear all;
clc;
f = imread('boat.bmp'); %读取图像
F=fft2(f);
Fc=fftshift(F);
[M N]=size(f);     %取图像大小
HLPF= zeros(M,N); 
d0=50;
for i=1:M
       for j=1:N
           d=sqrt((i-M/2)^2+(j-N/2)^2);
           if d<=d0
           HLPF(i,j) = 1;  %理想低通滤波器传递函数
           end           
       end
end
Fc1=Fc.*HLPF;  %频域理想低通滤波器
F1=ifftshift(Fc1);
J=ifft2(F1);  %理想低通滤波后采用二维离散傅里叶逆变换输出空域图像
imshow(real(J),[]);title('频域理想低通滤波后的图像')
figure,imshow(HLPF);title('频域理想低通滤波的传递函数')


%（2）巴特沃斯低通滤波
%2阶巴特沃斯低通滤波
clear all;
clc;
f = imread('boat.bmp'); %读取图像
F=fft2(f);
Fc=fftshift(F);
 [M N]=size(f);  %取图像大小
HBLPF= zeros(M,N); 
d0=50;
n=2;
for i=1:M
       for j=1:N
           d=sqrt((i-M/2)^2+(j-N/2)^2);
           HBLPF(i,j)=1./(1+(d/d0).^(2*n));  %2阶巴特沃斯低通滤波传递函数               
       end
end
Fc1=Fc.*HBLPF;   %2阶巴特沃斯低通滤波
F1=ifftshift(Fc1);
J=ifft2(F1);   %2阶巴特沃斯低通滤波后的二维离散傅里叶逆变换
imshow(real(J),[]);title('2阶巴特沃斯低通滤波后的图像')
figure,imshow(HBLPF);title('2阶巴特沃斯低通滤波的传递函数')


%（3）频域高斯低通滤波
%频域高斯低通滤波
clear all;
clc;
f = imread('boat.bmp'); %读取图像
F=fft2(f);
Fc=fftshift(F);
 [M N]=size(f);  %取图像大小
HGLPF= zeros(M,N); 
d0=50;
for i=1:M
       for j=1:N
           d=sqrt((i-M/2)^2+(j-N/2)^2);
           HGLPF(i,j)=exp(-(d.^2)/(2*d0.^2));  %高斯低通滤波器传递函数              
       end
end
Fc1=Fc.*HGLPF;  %频域高斯低通滤波
F1=ifftshift(Fc1);
J=ifft2(F1);   %频域高斯低通滤波后的二维离散傅里叶逆变换
imshow(real(J),[]);title('频域高斯低通滤波后的图像')
figure,imshow(HGLPF);title('频域高斯低通滤波的传递函数')



%（4）频域理想高通滤波
%理想高通滤波器处理
clear all;
clc;
f = imread('boat.bmp');   %读取图像
F=fft2(f);
Fc=fftshift(F); 
[M N]=size(f);    %取图像大小
HLPF= zeros(M,N);    
d0=50;
for i=1:M
       for j=1:N
           d=sqrt((i-M/2)^2+(j-N/2)^2);  %理想低通滤波器传递函数
           if d<=d0
           HLPF(i,j) = 1; 
           end           
       end
end
HHPF=1-HLPF;   %理想高通滤波器传递函数
Fc1=Fc.*HHPF;    %理想高通滤波
F1=ifftshift(Fc1);
J=ifft2(F1);    %理想高通滤波后的二维离散傅里叶逆变换
imshow(real(J),[]);title('频域理想高通滤波后的图像')
figure,imshow(HHPF);title('频域理想高通滤波的传递函数')


%（5）巴特沃斯高通滤波
%2阶巴特沃斯高通滤波
clear all;
clc;
f = imread('boat.bmp');   %读取图像
F=fft2(f);
Fc=fftshift(F); 
[M N]=size(f);   %取图像大小
HBLPF= zeros(M,N); 
d0=50;
n=2;
for i=1:M
       for j=1:N
           d=sqrt((i-M/2)^2+(j-N/2)^2);
           HBLPF(i,j)=1./(1+(d/d0).^(2*n));  %2阶巴特沃斯低通滤波传递函数                  
       end
end
HBHPF=1-HBLPF;   %2阶巴特沃斯高通滤波传递函数
Fc1=Fc.*HBHPF;    %2阶巴特沃斯高通滤波
F1=ifftshift(Fc1);
J=ifft2(F1);     %2阶巴特沃斯高通滤波后二维离散傅里叶逆变换
imshow(real(J),[]);title('2阶巴特沃斯高通滤波后的图像')
figure,imshow(HBHPF);title('2阶巴特沃斯高通滤波的传递函数')


%（6）频域高斯高通滤波
%频域高斯高通滤波
clear all;
clc;
f = imread('boat.bmp');  %读取图像
F=fft2(f);
Fc=fftshift(F);
[M N]=size(f);   %取图像大小
HGLPF= zeros(M,N);  
d0=50;
for i=1:M
       for j=1:N
           d=sqrt((i-M/2)^2+(j-N/2)^2);
           HGLPF(i,j)=exp(-(d.^2)/(2*d0.^2));  %频域高斯低通滤波器传递函数                  
       end
end
HGHPF=1-HGLPF;   %频域高斯高通滤波器传递函数
Fc1=Fc.*HGHPF;    %频域高斯高通滤波
F1=ifftshift(Fc1);
J=ifft2(F1);   %频域高斯高通滤波后二维离散傅里叶逆变换
imshow(real(J),[]);title('频域高斯高通滤波后的图像')
figure,imshow(HGHPF);title('频域高斯高通滤波的传递函数')
