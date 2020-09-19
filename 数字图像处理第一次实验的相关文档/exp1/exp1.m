%实验一    图像处理的基本操作

%实验步骤
%1.图像的读写
 % (A)图像读
       I=imread('boat.bmp');
%  (B)图像写
       whos I
       imwrite(I, 'boat1.bmp');
 
%2.图像显示
% (A)灰度图像的显示

I=imread('boat.bmp');
imshow(I)
       
%(B)RGB图像的显示
RGB=imread('flower.tif');
imshow(RGB)
figure
imshow(RGB(:,:,3))			% 显示第3个颜色分量
     
%3、图像的基本运算
      
 %(A)图像的缩放
       A=imread('lena.tif');
       B1=imresize(A,0.5);   
       imshow(A);title('原图');
       figure,imshow(B1);title('比例缩小图');
       
       

% (B)图像的旋转
clear all;
clc;
I=imread('lena.tif ');
J=imrotate(I,90);         %图像进行逆时针旋转90度
 K=imrotate(I,180);  
subplot(1,3,1);imshow(I);title('原图');
subplot(1,3,2);imshow(J);title('旋转90度图');
subplot(1,3,3);imshow(K);title('旋转180度图');

%4、彩色图像分通道显示及常用的彩色空间的转换
  %(A)彩色图像的分通道显示
        %（1）彩色图像的分通道显示
clear all;
clc;
RGB=imread('peppers.bmp');
R=RGB(:,:,1);                   %R通道
G=RGB(:,:,2);                   %G通道
B=RGB(:,:,3);                   %B通道
subplot(2,2,1);imshow(RGB);title('原始图像');
subplot(2,2,2);imshow(R);title('R分量');
subplot(2,2,3);imshow(G);title('G分量');
subplot(2,2,4);imshow(B);title('B分量');

   %(B)常用的彩色空间的转换
clear all;
clc;
RGB=imread('peppers.bmp');
hsv_image = rgb2hsv(RGB);       %RGB空间转换为HSV空间
YCBCR = rgb2ycbcr(RGB);         %RGB空间转换为YCBCR空间
subplot(1,3,1);imshow(hsv_image(:,:,1));title('h分量图');
subplot(1,3,2);imshow(hsv_image(:,:,2));title('s分量图');
subplot(1,3,3);imshow(hsv_image(:,:,3));title('v分量图');
figure,
subplot(1,3,1);imshow(YCBCR(:,:,1));title('Y分量图');
subplot(1,3,2);imshow(YCBCR(:,:,2));title('cb分量图');
subplot(1,3,3);imshow(YCBCR(:,:,3));title('cr分量图');
