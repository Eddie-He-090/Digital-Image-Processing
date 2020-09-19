%1��ά��ɢ���ұ任�Ͷ�ά��ɢ������任
%��1����ʾͼ��Ķ�ά��ɢ���ұ任ϵ��
clc
clear all
close all
%��ɢ���ұ任
I = imread('lena.tif');%��ȡͼ��
J_all = dct2(I);%��ͼ�����������ɢ���ұ任
subplot(1,2,1),imshow(I,[ ]);title('ԭʼͼ��');
subplot(1,2,2),imshow(log(1+abs(J_all)),[ ]);title('��ά��ɢ����Ƶ��');

%��2����ά��ɢ���ұ任ϵ����ͼ���ع�
clc
clear all
close all
I = imread('lena.tif');%��ȡͼ��
J_all = dct2(I); %��ͼ�����������ɢ���ұ任
K=idct2(J_all);
subplot(1,2,1),imshow(I,[ ]);title('ԭʼͼ��');
subplot(1,2,2),imshow(K,[ ]);title('��ɢ���ұ任ϵ�����ع�ͼ��');


%��3��ֻ�ö�ά��ɢ���ұ任ϵ���ķ�����Ϣ�����ع�ͼ��
clear all
clc;

I = imread('lena.tif');%��ȡͼ��
J_all = dct2(I);%��ɢ���ұ任
K=sign(J_all);
L=idct2(K);
subplot(1,2,1),imshow(I,[ ]);title('ԭʼͼ��');
subplot(1,2,2),imshow(L,[ ]);title('ֻ��DCT������Ϣ�����ع�ͼ��');

%��4���������пɷ���ķ���ʵ�ֶ�ά��ɢ���ұ任ϵ��
clear all;
clc;
I=double(imread('lena.tif')); %��ȡͼ��
[M,N]=size(I);
J=zeros(M,N);
K=zeros(M,N);
for i=1:M
    J(i,:)=dct(I(i,:));%��ִ���з���һάDCT
end
for j=1:N
    K(:,j)=dct(J(:,j));%����ִ���з����һάDCT
end
H=idct2(K);  %��ͼ���DCT��ִ�ж�ά��ɢ������任
subplot(1,2,1),imshow(log(1+abs(K)),[]);title('ԭʼͼ�����ɢ���ұ任ϵ��') 
subplot(1,2,2),imshow(real(H),[]);title('��ɢ���ұ任ϵ�����ع�ͼ')

%��5����ʾͼ��ķֿ��ά��ɢ���ұ任ϵ��
%���ڷֿ����ɢ���ұ任
clear all
clc;
I = imread('lena.tif');%��ȡͼ��
J_block= blkproc(I,[8 8],@dct2);%ʹ��blkproc����ʵ�ֶ�ͼ��ֿ������ɢ���ұ任���ֿ��СΪ8*8
imshow(log(1+abs(J_block)),[ ]);title('�ֿ�DCT��');

%��6���ֿ��ά��ɢ���ұ任ϵ����ͼ���ع�
clear all
clc;
I = imread('lena.tif');%��ȡͼ��
J_block= blkproc(I,[8 8],@dct2);%ʹ��blkproc����ʵ�ֶ�ͼ��ֿ������ɢ���ұ任���ֿ��СΪ8*8
K=blkproc(J_block,[8 8],@idct2);%ʹ��blkproc����ʵ�ֶԷֿ���ɢ���ұ任ϵ������ͼ���ع����ֿ��СΪ8*8
subplot(1,2,1),imshow(log(1+abs(J_block)),[ ]);title('�ֿ�DCT��');
subplot(1,2,2),imshow(K,[]);title('�ֿ���ɢ���ұ任ϵ�����ع�ͼ')

%��7��ֻ���÷ֿ��ά��ɢ���ұ任ֱ��ϵ����ͼ���ع�
clear all
clc;
I = imread('lena.tif');%��ȡͼ��
J_block= blkproc(I,[8 8],@dct2);%ʹ��blkproc����ʵ�ֶ�ͼ��ֿ������ɢ���ұ任���ֿ��СΪ8*8
mask1=[1 0 0 0 0 0 0 0;
       0 0 0 0 0 0 0 0;
       0 0 0 0 0 0 0 0
       0 0 0 0 0 0 0 0
       0 0 0 0 0 0 0 0
       0 0 0 0 0 0 0 0
       0 0 0 0 0 0 0 0
       0 0 0 0 0 0 0 0];%ȡ��Ƶ����Ϊ1
J1_block=blkproc(J_block,[8 8],@(x) x.*mask1);
K=blkproc(J1_block,[8 8],@idct2);%ʹ��blkproc����ʵ�ֶԷֿ���ɢ���ұ任ϵ������ͼ���ع����ֿ��СΪ8*8
imshow(K,[]);title('�ֿ���ɢ���ұ任ֱ��ϵ�����ع�ͼ')


%2����ͼ�������ά��ɢ���ұ任��ͼ��ѹ��
%��1������������룬��ͼ�������ά��ɢ���ұ任ϵ���У�ֻ����Լ25%�ĵ�Ƶϵ��ʵ��ͼ��ѹ��������ʾ���ѹ�ع�ͼ�񲢼�����PSNR
clc
clear all
close all
%��ɢ���ұ任
I = imread('lena.tif');%��ȡͼ��
J_all = dct2(I);%��ͼ�����������ɢ���ұ任
mask_all=zeros(256,256);
mask_all(1:128,1:128)=1; 
J_mask=J_all.*mask_all; %ȡ��Լ25%�ĵ�Ƶϵ��
K_all=idct2(J_mask);%�ع�
subplot(1,2,1),imshow(I,[ ]);title('ԭʼͼ��');
subplot(1,2,2),imshow(K_all,[ ]);title('25%�ĵ�Ƶ��ɢ���ұ任ϵ�����ع�ͼ��');
PSNR_all=PSNR1(I,K_all),%�����ֵ�����PSNR
CR=(256*256)/(128*128),%����ѹ����

%��2������������룬��ͼ�������ά��ɢ���ұ任ϵ���У�ֻ����Լ50%�ĵ�Ƶϵ��ʵ��ͼ��ѹ��������ʾ���ѹ�ع�ͼ�񲢼�����PSNR
clc
clear all
close all
%��ɢ���ұ任
I = imread('lena.tif');%��ȡͼ��
J_all = dct2(I);%��ͼ�����������ɢ���ұ任
mask_all=zeros(256,256);
mask_all(1:181,1:181)=1; 
J_mask=J_all.*mask_all; %ȡ��Լ50%�ĵ�Ƶϵ��
K_all=idct2(J_mask);%�ع�
subplot(1,2,1),imshow(I,[ ]);title('ԭʼͼ��');
subplot(1,2,2),imshow(K_all,[ ]);title('50%�ĵ�Ƶ��ɢ���ұ任ϵ�����ع�ͼ��');
PSNR_all=PSNR1(I,K_all),%�����ֵ�����PSNR
CR=(256*256)/(181*181),%����ѹ����


%��3������������룬��ͼ�������ά��ɢ���ұ任ϵ���У�ֻ����Լ6.25%�ĵ�Ƶϵ��ʵ��ͼ��ѹ��������ʾ���ѹ�ع�ͼ�񲢼�����PSNR
clc
clear all
close all
%��ɢ���ұ任
I = imread('lena.tif');%��ȡͼ��
J_all = dct2(I);%��ͼ�����������ɢ���ұ任
mask_all=zeros(256,256);
mask_all(1:64,1:64)=1; 
J_mask=J_all.*mask_all; %ȡ��Լ6.25%�ĵ�Ƶϵ��
K_all=idct2(J_mask);%�ع�
subplot(1,2,1),imshow(I,[ ]);title('ԭʼͼ��');
subplot(1,2,2),imshow(K_all,[ ]);title('6.25%�ĵ�Ƶ��ɢ���ұ任ϵ�����ع�ͼ��');
PSNR_all=PSNR1(I,K_all),%�����ֵ�����PSNR
CR=(256*256)/(64*64),%����ѹ����


%��4���������ޱ��룬��ͼ�������ά��ɢ���ұ任ϵ���У�
%��ֵΪ10��ֻ�������ڵ�����ֵ��DCTϵ��ʵ��ͼ��ѹ��������ʾ���ѹ�ع�ͼ�񲢼�����PSNR
clc
clear all
close all
p=0;
%��ɢ���ұ任
I = imread('lena.tif');%��ȡͼ��
J_all = dct2(I);%��ͼ�����������ɢ���ұ任
[M,N]=size(I);
for i=1:M
    for j=1:N
        if abs(J_all(i,j))<10
           J_all(i,j)=0;
           p=p+1;
        end
    end
end
K_all=idct2(J_all);%�ع�
subplot(1,2,1),imshow(I,[ ]);title('ԭʼͼ��');
subplot(1,2,2),imshow(K_all,[ ]);title('����С��10��DCTϵ�����ع�ͼ��');
PSNR_all=PSNR1(I,K_all),%�����ֵ�����PSNR
(M*N-p)/(M*N),%����DCTϵ���ĸ���ռ�ܵ�DCTϵ�������İٷֱ�


%��5���������ޱ��룬��ͼ�������ά��ɢ���ұ任ϵ���У�
%��ֵΪ20��ֻ�������ڵ�����ֵ��DCTϵ��ʵ��ͼ��ѹ��������ʾ���ѹ�ع�ͼ�񲢼�����PSNR
clc
clear all
close all
p=0;
%��ɢ���ұ任
I = imread('lena.tif');%��ȡͼ��
J_all = dct2(I);%��ͼ�����������ɢ���ұ任
[M,N]=size(I);
for i=1:M
    for j=1:N
        if abs(J_all(i,j))<20
           J_all(i,j)=0;
           p=p+1;
        end
    end
end
K_all=idct2(J_all);%�ع�
subplot(1,2,1),imshow(I,[ ]);title('ԭʼͼ��');
subplot(1,2,2),imshow(K_all,[ ]);title('����С��20��DCTϵ�����ع�ͼ��');
PSNR_all=PSNR1(I,K_all),%�����ֵ�����PSNR
(M*N-p)/(M*N),%����DCTϵ���ĸ���ռ�ܵ�DCTϵ�������İٷֱ�



%��6���������ޱ��룬��ͼ�������ά��ɢ���ұ任ϵ���У�
%��ֵΪ40��ֻ�������ڵ�����ֵ��DCTϵ��ʵ��ͼ��ѹ��������ʾ���ѹ�ع�ͼ�񲢼�����PSNR
clc
clear all
close all
p=0;
%��ɢ���ұ任
I = imread('lena.tif');%��ȡͼ��
J_all = dct2(I);%��ͼ�����������ɢ���ұ任
[M,N]=size(I);
for i=1:M
    for j=1:N
        if abs(J_all(i,j))<40
           J_all(i,j)=0;
           p=p+1;
        end
    end
end
K_all=idct2(J_all);%�ع�
subplot(1,2,1),imshow(I,[ ]);title('ԭʼͼ��');
subplot(1,2,2),imshow(K_all,[ ]);title('����С��40��DCTϵ�����ع�ͼ��');
PSNR_all=PSNR1(I,K_all),%�����ֵ�����PSNR
(M*N-p)/(M*N),%����DCTϵ���ĸ���ռ�ܵ�DCTϵ�������İٷֱ�



%3����ͼ��ֿ��ά��ɢ���ұ任��ͼ��ѹ��
%��1������������룬��ͼ��8*8�ֿ��ά��ɢ���ұ任ϵ���У�
%ÿ��8*8�ֿ�ֻ����1����Ƶϵ��ʵ��ͼ��ѹ��������ʾ���ѹ�ع�ͼ�񲢼�����PSNR
clear all
close all
clc;
I = imread('lena.tif');%��ȡͼ��
J_block= blkproc(I,[8 8],@dct2);%ʹ��blkproc����ʵ�ֶ�ͼ��ֿ������ɢ���ұ任���ֿ��СΪ8*8
%ȡ��Ƶ
mask1=[1 0 0 0 0 0 0 0;
       0 0 0 0 0 0 0 0;
       0 0 0 0 0 0 0 0
       0 0 0 0 0 0 0 0
       0 0 0 0 0 0 0 0
       0 0 0 0 0 0 0 0
       0 0 0 0 0 0 0 0
       0 0 0 0 0 0 0 0];%ȡ��Ƶ����Ϊ1
J1_block=blkproc(J_block,[8 8],@(x) x.*mask1);
K_block=blkproc(J1_block,[8 8],@idct2);%ʹ��blkproc����ʵ�ֶ�ͼ��ֿ��������ɢ���ұ任���ֿ��СΪ8*8   
subplot(1,2,1),imshow(I,[ ]);title('ԭͼ��');
subplot(1,2,2),imshow(K_block,[ ]);title('8*8�ֿ�ֻ����1����Ƶϵ���ع�ͼ��');
PSNR_block=PSNR1(I,K_block),%�����ֵ�����PSNR
CR_block=64/1,%����ѹ����



%��2������������룬��ͼ��8*8�ֿ��ά��ɢ���ұ任ϵ���У�
%ÿ��8*8�ֿ�ֻ����6����Ƶϵ��ʵ��ͼ��ѹ��������ʾ���ѹ�ع�ͼ�񲢼�����PSNR
clear all
close all
clc;
I = imread('lena.tif');%��ȡͼ��
J_block= blkproc(I,[8 8],@dct2);%ʹ��blkproc����ʵ�ֶ�ͼ��ֿ������ɢ���ұ任���ֿ��СΪ8*8
%ȡ��Ƶ
mask2=[1 1 1 0 0 0 0 0;
       1 1 0 0 0 0 0 0;
       1 0 0 0 0 0 0 0
       0 0 0 0 0 0 0 0
       0 0 0 0 0 0 0 0
       0 0 0 0 0 0 0 0
       0 0 0 0 0 0 0 0
       0 0 0 0 0 0 0 0];%ȡ��Ƶ����Ϊ6
J1_block=blkproc(J_block,[8 8],@(x) x.*mask2);
K_block=blkproc(J1_block,[8 8],@idct2);%ʹ��blkproc����ʵ�ֶ�ͼ��ֿ��������ɢ���ұ任���ֿ��СΪ8*8   
subplot(1,2,1),imshow(I,[ ]);title('ԭͼ��');
subplot(1,2,2),imshow(K_block,[ ]);title('8*8�ֿ�ֻ����6����Ƶϵ���ع�ͼ��');
PSNR_block=PSNR1(I,K_block),%�����ֵ�����PSNR
CR_block=64/6,%����ѹ����

%��3������������룬��ͼ��8*8�ֿ��ά��ɢ���ұ任ϵ���У�
%ÿ��8*8�ֿ�ֻ����9����Ƶϵ��ʵ��ͼ��ѹ��������ʾ���ѹ�ع�ͼ�񲢼�����PSNR
clear all
close all
clc;
I = imread('lena.tif');%��ȡͼ��
J_block= blkproc(I,[8 8],@dct2);%ʹ��blkproc����ʵ�ֶ�ͼ��ֿ������ɢ���ұ任���ֿ��СΪ8*8
%ȡ��Ƶ
mask3 =[1 1 1 1 0 0 0 0;
       1 1 1 0 0 0 0 0;
       1 1 0 0 0 0 0 0
       0 0 0 0 0 0 0 0
       0 0 0 0 0 0 0 0
       0 0 0 0 0 0 0 0
       0 0 0 0 0 0 0 0
       0 0 0 0 0 0 0 0];%ȡ��Ƶ����Ϊ9
J1_block=blkproc(J_block,[8 8],@(x) x.*mask3);
K_block=blkproc(J1_block,[8 8],@idct2);%ʹ��blkproc����ʵ�ֶ�ͼ��ֿ��������ɢ���ұ任���ֿ��СΪ8*8   
subplot(1,2,1),imshow(I,[ ]);title('ԭͼ��');
subplot(1,2,2),imshow(K_block,[ ]);title('8*8�ֿ�ֻ����9����Ƶϵ���ع�ͼ��');
PSNR_block=PSNR1(I,K_block),%�����ֵ�����PSNR
CR_block=64/9,%����ѹ����

%��4������������룬��ͼ��8*8�ֿ��ά��ɢ���ұ任ϵ���У�
%ÿ��8*8�ֿ�ֻ����15����Ƶϵ��ʵ��ͼ��ѹ��������ʾ���ѹ�ع�ͼ�񲢼�����PSNR
clear all
close all
clc;
I = imread('lena.tif');%��ȡͼ��
J_block= blkproc(I,[8 8],@dct2);%ʹ��blkproc����ʵ�ֶ�ͼ��ֿ������ɢ���ұ任���ֿ��СΪ8*8
%ȡ��Ƶ
mask4=[1 1 1 1 1 0 0 0;
       1 1 1 1 0 0 0 0;
       1 1 1 0 0 0 0 0
       1 1 0 0 0 0 0 0
       1 0 0 0 0 0 0 0
       0 0 0 0 0 0 0 0
       0 0 0 0 0 0 0 0
       0 0 0 0 0 0 0 0];%ȡ��Ƶ����Ϊ15
J1_block=blkproc(J_block,[8 8],@(x) x.*mask4);
K_block=blkproc(J1_block,[8 8],@idct2);%ʹ��blkproc����ʵ�ֶ�ͼ��ֿ��������ɢ���ұ任���ֿ��СΪ8*8   
subplot(1,2,1),imshow(I,[ ]);title('ԭͼ��');
subplot(1,2,2),imshow(K_block,[ ]);title('8*8�ֿ�ֻ����15����Ƶϵ���ع�ͼ��');
PSNR_block=PSNR1(I,K_block),%�����ֵ�����PSNR
CR_block=64/15,%����ѹ����

%��5���������ޱ��룬��ͼ��8*8�ֿ��ά��ɢ���ұ任ϵ���У�
%��ֵΪ10��ֻ�������ڵ�����ֵ��DCTϵ��ʵ��ͼ��ѹ��������ʾ���ѹ�ع�ͼ�񲢼�����PSNR

clear all
close all
clc;
p=0;
I = imread('lena.tif');%��ȡͼ��
J_block=blkproc(I,[8 8],@dct2);%ʹ��blkproc����ʵ�ֶ�ͼ��ֿ������ɢ���ұ任���ֿ��СΪ8*8
[M,N]=size(I);

for i=1:M
    for j=1:N
        if abs(J_block(i,j))<10
           J_block(i,j)=0;
           p=p+1;
        end
    end
end

K_block=blkproc(J_block,[8 8],@idct2);%ʹ��blkproc����ʵ�ֶ�ͼ��ֿ��������ɢ���ұ任���ֿ��СΪ8*8   
subplot(1,2,1),imshow(I,[ ]);title('ԭͼ��');
subplot(1,2,2),imshow(K_block,[ ]);title('����С��10��8*8�ֿ�DCTϵ�����ع�ͼ��');
PSNR_block=PSNR1(I,K_block),%�����ֵ�����PSNR
(M*N-p)/(M*N),%����DCTϵ���ĸ���ռ�ܵ�DCTϵ�������İٷֱ�



%��6���������ޱ��룬��ͼ��8*8�ֿ��ά��ɢ���ұ任ϵ���У�
%��ֵΪ20��ֻ�������ڵ�����ֵ��DCTϵ��ʵ��ͼ��ѹ��������ʾ���ѹ�ع�ͼ�񲢼�����PSNR

clear all
close all
clc;
p=0;
I = imread('lena.tif');%��ȡͼ��
J_block=blkproc(I,[8 8],@dct2);%ʹ��blkproc����ʵ�ֶ�ͼ��ֿ������ɢ���ұ任���ֿ��СΪ8*8
[M,N]=size(I);

for i=1:M
    for j=1:N
        if abs(J_block(i,j))<20
           J_block(i,j)=0;
           p=p+1;
        end
    end
end

K_block=blkproc(J_block,[8 8],@idct2);%ʹ��blkproc����ʵ�ֶ�ͼ��ֿ��������ɢ���ұ任���ֿ��СΪ8*8   
subplot(1,2,1),imshow(I,[ ]);title('ԭͼ��');
subplot(1,2,2),imshow(K_block,[ ]);title('����С��20��8*8�ֿ�DCTϵ�����ع�ͼ��');
PSNR_block=PSNR1(I,K_block),%�����ֵ�����PSNR
(M*N-p)/(M*N),%����DCTϵ���ĸ���ռ�ܵ�DCTϵ�������İٷֱ�


%��7���������ޱ��룬��ͼ��8*8�ֿ��ά��ɢ���ұ任ϵ���У�
%��ֵΪ40��ֻ�������ڵ�����ֵ��DCTϵ��ʵ��ͼ��ѹ��������ʾ���ѹ�ع�ͼ�񲢼�����PSNR

clear all
close all
clc;
p=0;
I = imread('lena.tif');%��ȡͼ��
J_block=blkproc(I,[8 8],@dct2);%ʹ��blkproc����ʵ�ֶ�ͼ��ֿ������ɢ���ұ任���ֿ��СΪ8*8
[M,N]=size(I);

for i=1:M
    for j=1:N
        if abs(J_block(i,j))<40
           J_block(i,j)=0;
           p=p+1;
        end
    end
end

K_block=blkproc(J_block,[8 8],@idct2);%ʹ��blkproc����ʵ�ֶ�ͼ��ֿ��������ɢ���ұ任���ֿ��СΪ8*8   
subplot(1,2,1),imshow(I,[ ]);title('ԭͼ��');
subplot(1,2,2),imshow(K_block,[ ]);title('����С��40��8*8�ֿ�DCTϵ�����ع�ͼ��');
PSNR_block=PSNR1(I,K_block),%�����ֵ�����PSNR
(M*N-p)/(M*N),%����DCTϵ���ĸ���ռ�ܵ�DCTϵ�������İٷֱ�

