%ʵ��һ    ͼ����Ļ�������

%ʵ�鲽��
%1.ͼ��Ķ�д
 % (A)ͼ���
       I=imread('boat.bmp');
%  (B)ͼ��д
       whos I
       imwrite(I, 'boat1.bmp');
 
%2.ͼ����ʾ
% (A)�Ҷ�ͼ�����ʾ

I=imread('boat.bmp');
imshow(I)
       
%(B)RGBͼ�����ʾ
RGB=imread('flower.tif');
imshow(RGB)
figure
imshow(RGB(:,:,3))			% ��ʾ��3����ɫ����
     
%3��ͼ��Ļ�������
      
 %(A)ͼ�������
       A=imread('lena.tif');
       B1=imresize(A,0.5);   
       imshow(A);title('ԭͼ');
       figure,imshow(B1);title('������Сͼ');
       
       

% (B)ͼ�����ת
clear all;
clc;
I=imread('lena.tif ');
J=imrotate(I,90);         %ͼ�������ʱ����ת90��
 K=imrotate(I,180);  
subplot(1,3,1);imshow(I);title('ԭͼ');
subplot(1,3,2);imshow(J);title('��ת90��ͼ');
subplot(1,3,3);imshow(K);title('��ת180��ͼ');

%4����ɫͼ���ͨ����ʾ�����õĲ�ɫ�ռ��ת��
  %(A)��ɫͼ��ķ�ͨ����ʾ
        %��1����ɫͼ��ķ�ͨ����ʾ
clear all;
clc;
RGB=imread('peppers.bmp');
R=RGB(:,:,1);                   %Rͨ��
G=RGB(:,:,2);                   %Gͨ��
B=RGB(:,:,3);                   %Bͨ��
subplot(2,2,1);imshow(RGB);title('ԭʼͼ��');
subplot(2,2,2);imshow(R);title('R����');
subplot(2,2,3);imshow(G);title('G����');
subplot(2,2,4);imshow(B);title('B����');

   %(B)���õĲ�ɫ�ռ��ת��
clear all;
clc;
RGB=imread('peppers.bmp');
hsv_image = rgb2hsv(RGB);       %RGB�ռ�ת��ΪHSV�ռ�
YCBCR = rgb2ycbcr(RGB);         %RGB�ռ�ת��ΪYCBCR�ռ�
subplot(1,3,1);imshow(hsv_image(:,:,1));title('h����ͼ');
subplot(1,3,2);imshow(hsv_image(:,:,2));title('s����ͼ');
subplot(1,3,3);imshow(hsv_image(:,:,3));title('v����ͼ');
figure,
subplot(1,3,1);imshow(YCBCR(:,:,1));title('Y����ͼ');
subplot(1,3,2);imshow(YCBCR(:,:,2));title('cb����ͼ');
subplot(1,3,3);imshow(YCBCR(:,:,3));title('cr����ͼ');
