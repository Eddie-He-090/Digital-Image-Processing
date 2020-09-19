
%ʵ���� ͼ��ָ���ͼ����������

%1.������ֵ����ͼ��ָ�ͱ�Ե���
%(1)�鿴ͼ���ֱ��ͼ��ȷ�����ʵ���ֵ����ͼ��ָ�
clear all;
clc;
I = imread('rice3.png');
imshow(I,[]);title('ԭͼ')
figure,imhist(I,256);title('ԭͼ��ֱ��ͼ')
T=125;
level=T/255;
BW1=im2bw(I,level);
figure,imshow(BW1,[]);title('��ֵ����ͼ��ָ�')
T,

%(2)���������䷽����ֵ������ͼ��ָ�
clear all;
clc;
I = imread('rice3.png');
imshow(I,[]);title('ԭͼ')
figure,imhist(I,256);title('ԭͼ��ֱ��ͼ')
level = graythresh(I);  %ȡ�����䷽����ֵ
BW1=im2bw(I,level);     %ͼ���ֵ��
figure,imshow(BW1,[]);title('�����䷽����ֵ����ͼ��ָ�')
T=level*255;
T,

%(3)������ȷ����ֵ������ͼ��ָ�

clear all;
clc;
I = imread('rice3.png');
imshow(I,[]);title('ԭͼ')
figure,imhist(I,256);title('ԭͼ��ֱ��ͼ')
T1=0.5*(double(min(I(:)))+double(max(I(:))));
done=false;
while ~done
    g=I>=T1;
    T2=0.5*(mean(I(g))+mean(I(~g)));   %������ȷ����ֵ��
    done=abs(T1-T2)<0.5;
    T1=T2;
   end
level=T1/255;
BW1=im2bw(I,level);
figure,imshow(BW1,[]);title('������ȷ����ֵ��ͼ��ָ�')
T1,

%(4)�Ƚ�prewitt������canny�ı�Ե���Ч��
clear all;
clc;
I = imread('circuit1.tif');
BW1 = edge(I,'prewitt');
BW2 = edge(I,'canny');
imshow(I);title('ԭͼ')
figure,imshow(BW1);title('prewitt��Ե���')
figure, imshow(BW2);title('canny��Ե���')


%(5)�Ƚ�sobel������canny�ı�Ե���Ч��
clear all;
clc;
I = imread('circuit1.tif');
BW1 = edge(I,'sobel');
BW2 = edge(I,'canny');
imshow(I);title('ԭͼ')
figure,imshow(BW1);title('sobel��Ե���')
figure, imshow(BW2);title('canny��Ե���')

%(6)�Ƚ�LOG������canny�ı�Ե���Ч��
clear all;
clc;
I = imread('circuit1.tif');
BW1 = edge(I,'log');
BW2 = edge(I,'canny');
imshow(I);title('ԭͼ')
figure,imshow(BW1);title('log��Ե���')
figure, imshow(BW2);title('canny��Ե���')

%2.����ص���״��������
%(1)��ȡ��״�Ĳ��������,�Ƚ�ԭĿ����Ŀ����ת�����״������
clear all;
clc;
H=imread('horse1.gif');
imshow(H,[ ]);
F1=invmoments(H);
J=imrotate(H,90);
F2=invmoments(J);
K=imrotate(H,180);
F3=invmoments(K);
F1,
F2,
F3,

%(2)Ŀ����С���Ƚ�ԭĿ����Ŀ����С�����״������
clear all;
clc;
I=imread('horse1.gif');
H=imresize(I,0.5);
J=imresize(I,0.25);
imshow(H,[ ]);
F1=invmoments(I);
F2=invmoments(H);
F3=invmoments(J);
F1,
F2,
F3,


%(3)Ŀ����С����ת���Ƚ�ԭĿ����Ŀ����С����ת�����״������
clear all;
clc;
I=imread('horse1.gif');
H=imresize(I,0.25);
imshow(H,[ ]);
F1=invmoments(I);
J=imrotate(H,90);
F2=invmoments(J);
K=imrotate(H,180);
F3=invmoments(K);
F1,
F2,
F3,


%(4)Ŀ�����ҷ�ת���Ƚ�ԭĿ����Ŀ�����ҷ�ת�����״������
clear all;
clc;
I=imread('horse1.gif');
H=fliplr(I);
imshow(H,[ ]);
F1=invmoments(I);
F2=invmoments(H);
F1,
F2,

%(5)Ŀ�����ҷ�ת����С���Ƚ�ԭĿ����Ŀ�����ҷ�ת����С�����״������
clear all;
clc;
I=imread('horse1.gif');
H1=fliplr(I);
H=imresize(H1,0.5);
imshow(H,[ ]);
F1=invmoments(I);
F2=invmoments(H);
F1,
F2,

%(6)Ŀ�����·�ת���Ƚ�ԭĿ����Ŀ�����·�ת�����״������
clear all;
clc;
I=imread('horse1.gif');
H=flipud(I);
imshow(H,[ ]);
F1=invmoments(I);
F2=invmoments(H);
F1,
F2,

%3.����Ƶ�׷�������ͼ����������  
%�Ծ��в�ͬ�����ںͷ��������ͼ����ʾ��Ƶ����Ϣ��
%ͨ�������׵ľ���ͽ���ķֲ�������������ͼ������ںͷ���
 
%(1)����ͼ��1��Ƶ�׷���������
 clear all;
 clc;
 close all;
 f1=imread('texture1.tif');
 [srad1,sang1,s1]=specxture(f1);             %����ͼ���Ƶ�ף�s(r),s(a)
imshow(f1);title('����ͼ��1');
figure,imshow(s1,[]);title('����ͼ��1��Ƶ��');
figure,plot(srad1); title('����ͼ��1��s(r)����');
figure,plot(sang1); title('����ͼ��1��s(a)����');


%(2)����ͼ��2��Ƶ�׷���������
 clear all;
 clc;
 close all;
 f1=imread('texture2.gif');
 [srad1,sang1,s1]=specxture(f1);             %����ͼ���Ƶ�ף�s(r),s(a)

imshow(f1);title('����ͼ��2');
figure,imshow(s1,[]);title('����ͼ��2��Ƶ��');
figure,plot(srad1); title('����ͼ��2��s(r)����');
figure,plot(sang1); title('����ͼ��2��s(a)����');


  %(3)����ͼ��3��Ƶ�׷���������
 clear all;
 clc;
 close all;
 f1=imread('texture3.gif');
 [srad1,sang1,s1]=specxture(f1);              %����ͼ���Ƶ�ף�s(r),s(a)

imshow(f1);title('����ͼ��3');
figure,imshow(s1,[]);title('����ͼ��3��Ƶ��');
figure,plot(srad1); title('����ͼ��3��s(r)����');
figure,plot(sang1); title('����ͼ��3��s(a)����');


%(4)������ͬ,����ͬ������ͼ���Ƶ�׷���������
 clear all;
 clc;
 close all;
 f1=imread('texture4.bmp');
 f2=imread('texture5.bmp');
 [srad1,sang1,s1]=specxture(f1);             %����ͼ���Ƶ�ף�s(r),s(a)
 [srad2,sang2,s2]=specxture(f2); 
 
subplot(2,1,1),imshow(f1);title('����ͼ��4');
subplot(2,1,2),imshow(f2);title('����ͼ��5');
figure,subplot(2,1,1),plot(srad1); title('����ͼ��4��s(r)����');
subplot(2,1,2),plot(srad2); title('����ͼ��5��s(r)����')
figure,subplot(2,1,1),plot(sang1); title('����ͼ��4��s(a)����');
subplot(2,1,2),plot(sang2); title('����ͼ��5��s(a)����');


%(5)���ڲ�ͬ��������ͬ,����ͼ���Ƶ�׷���������
 clear all;
 clc;
 close all;
 f1=imread('texture5.bmp');
 f2=imread('texture6.bmp');
 [srad1,sang1,s1]=specxture(f1);             %����ͼ���Ƶ�ף�s(r),s(a)
 [srad2,sang2,s2]=specxture(f2); 
 
subplot(2,1,1),imshow(f1);title('����ͼ��5');
subplot(2,1,2),imshow(f2);title('����ͼ��6');
figure,subplot(2,1,1),plot(srad1); title('����ͼ��5��s(r)����');
subplot(2,1,2),plot(srad2); title('����ͼ��6��s(r)����')
figure,subplot(2,1,1),plot(sang1); title('����ͼ��5��s(a)����');
subplot(2,1,2),plot(sang2); title('����ͼ��6��s(a)����');



%(6)���ڲ�ͬ������ͬ,����ͼ���Ƶ�׷���������
 clear all;
 clc;
 close all;
 f1=imread('texture4.bmp');
 f2=imread('texture6.bmp');
 [srad1,sang1,s1]=specxture(f1);             %����ͼ���Ƶ�ף�s(r),s(a)
 [srad2,sang2,s2]=specxture(f2); 
 
subplot(2,1,1),imshow(f1);title('����ͼ��4');
subplot(2,1,2),imshow(f2);title('����ͼ��6');
figure,subplot(2,1,1),plot(srad1); title('����ͼ��4��s(r)����');
subplot(2,1,2),plot(srad2); title('����ͼ��6��s(r)����')
figure,subplot(2,1,1),plot(sang1); title('����ͼ��4��s(a)����');
subplot(2,1,2),plot(sang2); title('����ͼ��6��s(a)����');

