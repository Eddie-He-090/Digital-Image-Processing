%1二维离散余弦变换和二维离散余弦逆变换
%（1）显示图像的二维离散余弦变换系数
clc
clear all
close all
%离散余弦变换
I = imread('lena.tif');%读取图像
J_all = dct2(I);%对图像整体进行离散余弦变换
subplot(1,2,1),imshow(I,[ ]);title('原始图像');
subplot(1,2,2),imshow(log(1+abs(J_all)),[ ]);title('二维离散余弦频谱');

%（2）二维离散余弦变换系数的图像重构
clc
clear all
close all
I = imread('lena.tif');%读取图像
J_all = dct2(I); %对图像整体进行离散余弦变换
K=idct2(J_all);
subplot(1,2,1),imshow(I,[ ]);title('原始图像');
subplot(1,2,2),imshow(K,[ ]);title('离散余弦变换系数的重构图像');


%（3）只用二维离散余弦变换系数的符号信息进行重构图像
clear all
clc;

I = imread('lena.tif');%读取图像
J_all = dct2(I);%离散余弦变换
K=sign(J_all);
L=idct2(K);
subplot(1,2,1),imshow(I,[ ]);title('原始图像');
subplot(1,2,2),imshow(L,[ ]);title('只用DCT符号信息进行重构图像');

%（4）采用行列可分离的方法实现二维离散余弦变换系数
clear all;
clc;
I=double(imread('lena.tif')); %读取图像
[M,N]=size(I);
J=zeros(M,N);
K=zeros(M,N);
for i=1:M
    J(i,:)=dct(I(i,:));%先执行行方向一维DCT
end
for j=1:N
    K(:,j)=dct(J(:,j));%接着执行列方向的一维DCT
end
H=idct2(K);  %对图像的DCT谱执行二维离散余弦逆变换
subplot(1,2,1),imshow(log(1+abs(K)),[]);title('原始图像的离散余弦变换系数') 
subplot(1,2,2),imshow(real(H),[]);title('离散余弦变换系数的重构图')

%（5）显示图像的分块二维离散余弦变换系数
%基于分块的离散余弦变换
clear all
clc;
I = imread('lena.tif');%读取图像
J_block= blkproc(I,[8 8],@dct2);%使用blkproc函数实现对图像分块进行离散余弦变换，分块大小为8*8
imshow(log(1+abs(J_block)),[ ]);title('分块DCT谱');

%（6）分块二维离散余弦变换系数的图像重构
clear all
clc;
I = imread('lena.tif');%读取图像
J_block= blkproc(I,[8 8],@dct2);%使用blkproc函数实现对图像分块进行离散余弦变换，分块大小为8*8
K=blkproc(J_block,[8 8],@idct2);%使用blkproc函数实现对分块离散余弦变换系数进行图像重构，分块大小为8*8
subplot(1,2,1),imshow(log(1+abs(J_block)),[ ]);title('分块DCT谱');
subplot(1,2,2),imshow(K,[]);title('分块离散余弦变换系数的重构图')

%（7）只采用分块二维离散余弦变换直流系数的图像重构
clear all
clc;
I = imread('lena.tif');%读取图像
J_block= blkproc(I,[8 8],@dct2);%使用blkproc函数实现对图像分块进行离散余弦变换，分块大小为8*8
mask1=[1 0 0 0 0 0 0 0;
       0 0 0 0 0 0 0 0;
       0 0 0 0 0 0 0 0
       0 0 0 0 0 0 0 0
       0 0 0 0 0 0 0 0
       0 0 0 0 0 0 0 0
       0 0 0 0 0 0 0 0
       0 0 0 0 0 0 0 0];%取低频个数为1
J1_block=blkproc(J_block,[8 8],@(x) x.*mask1);
K=blkproc(J1_block,[8 8],@idct2);%使用blkproc函数实现对分块离散余弦变换系数进行图像重构，分块大小为8*8
imshow(K,[]);title('分块离散余弦变换直流系数的重构图')


%2基于图像整体二维离散余弦变换的图像压缩
%（1）采用区域编码，在图像整体二维离散余弦变换系数中，只保留约25%的低频系数实现图像压缩，并显示其解压重构图像并计算其PSNR
clc
clear all
close all
%离散余弦变换
I = imread('lena.tif');%读取图像
J_all = dct2(I);%对图像整体进行离散余弦变换
mask_all=zeros(256,256);
mask_all(1:128,1:128)=1; 
J_mask=J_all.*mask_all; %取出约25%的低频系数
K_all=idct2(J_mask);%重构
subplot(1,2,1),imshow(I,[ ]);title('原始图像');
subplot(1,2,2),imshow(K_all,[ ]);title('25%的低频离散余弦变换系数的重构图像');
PSNR_all=PSNR1(I,K_all),%计算峰值信噪比PSNR
CR=(256*256)/(128*128),%计算压缩比

%（2）采用区域编码，在图像整体二维离散余弦变换系数中，只保留约50%的低频系数实现图像压缩，并显示其解压重构图像并计算其PSNR
clc
clear all
close all
%离散余弦变换
I = imread('lena.tif');%读取图像
J_all = dct2(I);%对图像整体进行离散余弦变换
mask_all=zeros(256,256);
mask_all(1:181,1:181)=1; 
J_mask=J_all.*mask_all; %取出约50%的低频系数
K_all=idct2(J_mask);%重构
subplot(1,2,1),imshow(I,[ ]);title('原始图像');
subplot(1,2,2),imshow(K_all,[ ]);title('50%的低频离散余弦变换系数的重构图像');
PSNR_all=PSNR1(I,K_all),%计算峰值信噪比PSNR
CR=(256*256)/(181*181),%计算压缩比


%（3）采用区域编码，在图像整体二维离散余弦变换系数中，只保留约6.25%的低频系数实现图像压缩，并显示其解压重构图像并计算其PSNR
clc
clear all
close all
%离散余弦变换
I = imread('lena.tif');%读取图像
J_all = dct2(I);%对图像整体进行离散余弦变换
mask_all=zeros(256,256);
mask_all(1:64,1:64)=1; 
J_mask=J_all.*mask_all; %取出约6.25%的低频系数
K_all=idct2(J_mask);%重构
subplot(1,2,1),imshow(I,[ ]);title('原始图像');
subplot(1,2,2),imshow(K_all,[ ]);title('6.25%的低频离散余弦变换系数的重构图像');
PSNR_all=PSNR1(I,K_all),%计算峰值信噪比PSNR
CR=(256*256)/(64*64),%计算压缩比


%（4）采用门限编码，在图像整体二维离散余弦变换系数中，
%阈值为10，只保留大于等于阈值的DCT系数实现图像压缩，并显示其解压重构图像并计算其PSNR
clc
clear all
close all
p=0;
%离散余弦变换
I = imread('lena.tif');%读取图像
J_all = dct2(I);%对图像整体进行离散余弦变换
[M,N]=size(I);
for i=1:M
    for j=1:N
        if abs(J_all(i,j))<10
           J_all(i,j)=0;
           p=p+1;
        end
    end
end
K_all=idct2(J_all);%重构
subplot(1,2,1),imshow(I,[ ]);title('原始图像');
subplot(1,2,2),imshow(K_all,[ ]);title('舍弃小于10的DCT系数的重构图像');
PSNR_all=PSNR1(I,K_all),%计算峰值信噪比PSNR
(M*N-p)/(M*N),%保留DCT系数的个数占总的DCT系数个数的百分比


%（5）采用门限编码，在图像整体二维离散余弦变换系数中，
%阈值为20，只保留大于等于阈值的DCT系数实现图像压缩，并显示其解压重构图像并计算其PSNR
clc
clear all
close all
p=0;
%离散余弦变换
I = imread('lena.tif');%读取图像
J_all = dct2(I);%对图像整体进行离散余弦变换
[M,N]=size(I);
for i=1:M
    for j=1:N
        if abs(J_all(i,j))<20
           J_all(i,j)=0;
           p=p+1;
        end
    end
end
K_all=idct2(J_all);%重构
subplot(1,2,1),imshow(I,[ ]);title('原始图像');
subplot(1,2,2),imshow(K_all,[ ]);title('舍弃小于20的DCT系数的重构图像');
PSNR_all=PSNR1(I,K_all),%计算峰值信噪比PSNR
(M*N-p)/(M*N),%保留DCT系数的个数占总的DCT系数个数的百分比



%（6）采用门限编码，在图像整体二维离散余弦变换系数中，
%阈值为40，只保留大于等于阈值的DCT系数实现图像压缩，并显示其解压重构图像并计算其PSNR
clc
clear all
close all
p=0;
%离散余弦变换
I = imread('lena.tif');%读取图像
J_all = dct2(I);%对图像整体进行离散余弦变换
[M,N]=size(I);
for i=1:M
    for j=1:N
        if abs(J_all(i,j))<40
           J_all(i,j)=0;
           p=p+1;
        end
    end
end
K_all=idct2(J_all);%重构
subplot(1,2,1),imshow(I,[ ]);title('原始图像');
subplot(1,2,2),imshow(K_all,[ ]);title('舍弃小于40的DCT系数的重构图像');
PSNR_all=PSNR1(I,K_all),%计算峰值信噪比PSNR
(M*N-p)/(M*N),%保留DCT系数的个数占总的DCT系数个数的百分比



%3基于图像分块二维离散余弦变换的图像压缩
%（1）采用区域编码，在图像8*8分块二维离散余弦变换系数中，
%每个8*8分块只保留1个低频系数实现图像压缩，并显示其解压重构图像并计算其PSNR
clear all
close all
clc;
I = imread('lena.tif');%读取图像
J_block= blkproc(I,[8 8],@dct2);%使用blkproc函数实现对图像分块进行离散余弦变换，分块大小为8*8
%取低频
mask1=[1 0 0 0 0 0 0 0;
       0 0 0 0 0 0 0 0;
       0 0 0 0 0 0 0 0
       0 0 0 0 0 0 0 0
       0 0 0 0 0 0 0 0
       0 0 0 0 0 0 0 0
       0 0 0 0 0 0 0 0
       0 0 0 0 0 0 0 0];%取低频个数为1
J1_block=blkproc(J_block,[8 8],@(x) x.*mask1);
K_block=blkproc(J1_block,[8 8],@idct2);%使用blkproc函数实现对图像分块进行逆离散余弦变换，分块大小为8*8   
subplot(1,2,1),imshow(I,[ ]);title('原图像');
subplot(1,2,2),imshow(K_block,[ ]);title('8*8分块只保留1个低频系数重构图像');
PSNR_block=PSNR1(I,K_block),%计算峰值信噪比PSNR
CR_block=64/1,%计算压缩比



%（2）采用区域编码，在图像8*8分块二维离散余弦变换系数中，
%每个8*8分块只保留6个低频系数实现图像压缩，并显示其解压重构图像并计算其PSNR
clear all
close all
clc;
I = imread('lena.tif');%读取图像
J_block= blkproc(I,[8 8],@dct2);%使用blkproc函数实现对图像分块进行离散余弦变换，分块大小为8*8
%取低频
mask2=[1 1 1 0 0 0 0 0;
       1 1 0 0 0 0 0 0;
       1 0 0 0 0 0 0 0
       0 0 0 0 0 0 0 0
       0 0 0 0 0 0 0 0
       0 0 0 0 0 0 0 0
       0 0 0 0 0 0 0 0
       0 0 0 0 0 0 0 0];%取低频个数为6
J1_block=blkproc(J_block,[8 8],@(x) x.*mask2);
K_block=blkproc(J1_block,[8 8],@idct2);%使用blkproc函数实现对图像分块进行逆离散余弦变换，分块大小为8*8   
subplot(1,2,1),imshow(I,[ ]);title('原图像');
subplot(1,2,2),imshow(K_block,[ ]);title('8*8分块只保留6个低频系数重构图像');
PSNR_block=PSNR1(I,K_block),%计算峰值信噪比PSNR
CR_block=64/6,%计算压缩比

%（3）采用区域编码，在图像8*8分块二维离散余弦变换系数中，
%每个8*8分块只保留9个低频系数实现图像压缩，并显示其解压重构图像并计算其PSNR
clear all
close all
clc;
I = imread('lena.tif');%读取图像
J_block= blkproc(I,[8 8],@dct2);%使用blkproc函数实现对图像分块进行离散余弦变换，分块大小为8*8
%取低频
mask3 =[1 1 1 1 0 0 0 0;
       1 1 1 0 0 0 0 0;
       1 1 0 0 0 0 0 0
       0 0 0 0 0 0 0 0
       0 0 0 0 0 0 0 0
       0 0 0 0 0 0 0 0
       0 0 0 0 0 0 0 0
       0 0 0 0 0 0 0 0];%取低频个数为9
J1_block=blkproc(J_block,[8 8],@(x) x.*mask3);
K_block=blkproc(J1_block,[8 8],@idct2);%使用blkproc函数实现对图像分块进行逆离散余弦变换，分块大小为8*8   
subplot(1,2,1),imshow(I,[ ]);title('原图像');
subplot(1,2,2),imshow(K_block,[ ]);title('8*8分块只保留9个低频系数重构图像');
PSNR_block=PSNR1(I,K_block),%计算峰值信噪比PSNR
CR_block=64/9,%计算压缩比

%（4）采用区域编码，在图像8*8分块二维离散余弦变换系数中，
%每个8*8分块只保留15个低频系数实现图像压缩，并显示其解压重构图像并计算其PSNR
clear all
close all
clc;
I = imread('lena.tif');%读取图像
J_block= blkproc(I,[8 8],@dct2);%使用blkproc函数实现对图像分块进行离散余弦变换，分块大小为8*8
%取低频
mask4=[1 1 1 1 1 0 0 0;
       1 1 1 1 0 0 0 0;
       1 1 1 0 0 0 0 0
       1 1 0 0 0 0 0 0
       1 0 0 0 0 0 0 0
       0 0 0 0 0 0 0 0
       0 0 0 0 0 0 0 0
       0 0 0 0 0 0 0 0];%取低频个数为15
J1_block=blkproc(J_block,[8 8],@(x) x.*mask4);
K_block=blkproc(J1_block,[8 8],@idct2);%使用blkproc函数实现对图像分块进行逆离散余弦变换，分块大小为8*8   
subplot(1,2,1),imshow(I,[ ]);title('原图像');
subplot(1,2,2),imshow(K_block,[ ]);title('8*8分块只保留15个低频系数重构图像');
PSNR_block=PSNR1(I,K_block),%计算峰值信噪比PSNR
CR_block=64/15,%计算压缩比

%（5）采用门限编码，在图像8*8分块二维离散余弦变换系数中，
%阈值为10，只保留大于等于阈值的DCT系数实现图像压缩，并显示其解压重构图像并计算其PSNR

clear all
close all
clc;
p=0;
I = imread('lena.tif');%读取图像
J_block=blkproc(I,[8 8],@dct2);%使用blkproc函数实现对图像分块进行离散余弦变换，分块大小为8*8
[M,N]=size(I);

for i=1:M
    for j=1:N
        if abs(J_block(i,j))<10
           J_block(i,j)=0;
           p=p+1;
        end
    end
end

K_block=blkproc(J_block,[8 8],@idct2);%使用blkproc函数实现对图像分块进行逆离散余弦变换，分块大小为8*8   
subplot(1,2,1),imshow(I,[ ]);title('原图像');
subplot(1,2,2),imshow(K_block,[ ]);title('舍弃小于10的8*8分块DCT系数的重构图像');
PSNR_block=PSNR1(I,K_block),%计算峰值信噪比PSNR
(M*N-p)/(M*N),%保留DCT系数的个数占总的DCT系数个数的百分比



%（6）采用门限编码，在图像8*8分块二维离散余弦变换系数中，
%阈值为20，只保留大于等于阈值的DCT系数实现图像压缩，并显示其解压重构图像并计算其PSNR

clear all
close all
clc;
p=0;
I = imread('lena.tif');%读取图像
J_block=blkproc(I,[8 8],@dct2);%使用blkproc函数实现对图像分块进行离散余弦变换，分块大小为8*8
[M,N]=size(I);

for i=1:M
    for j=1:N
        if abs(J_block(i,j))<20
           J_block(i,j)=0;
           p=p+1;
        end
    end
end

K_block=blkproc(J_block,[8 8],@idct2);%使用blkproc函数实现对图像分块进行逆离散余弦变换，分块大小为8*8   
subplot(1,2,1),imshow(I,[ ]);title('原图像');
subplot(1,2,2),imshow(K_block,[ ]);title('舍弃小于20的8*8分块DCT系数的重构图像');
PSNR_block=PSNR1(I,K_block),%计算峰值信噪比PSNR
(M*N-p)/(M*N),%保留DCT系数的个数占总的DCT系数个数的百分比


%（7）采用门限编码，在图像8*8分块二维离散余弦变换系数中，
%阈值为40，只保留大于等于阈值的DCT系数实现图像压缩，并显示其解压重构图像并计算其PSNR

clear all
close all
clc;
p=0;
I = imread('lena.tif');%读取图像
J_block=blkproc(I,[8 8],@dct2);%使用blkproc函数实现对图像分块进行离散余弦变换，分块大小为8*8
[M,N]=size(I);

for i=1:M
    for j=1:N
        if abs(J_block(i,j))<40
           J_block(i,j)=0;
           p=p+1;
        end
    end
end

K_block=blkproc(J_block,[8 8],@idct2);%使用blkproc函数实现对图像分块进行逆离散余弦变换，分块大小为8*8   
subplot(1,2,1),imshow(I,[ ]);title('原图像');
subplot(1,2,2),imshow(K_block,[ ]);title('舍弃小于40的8*8分块DCT系数的重构图像');
PSNR_block=PSNR1(I,K_block),%计算峰值信噪比PSNR
(M*N-p)/(M*N),%保留DCT系数的个数占总的DCT系数个数的百分比

