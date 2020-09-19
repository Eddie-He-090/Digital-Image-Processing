%ʵ����  ��ά��ɢ����Ҷ�任���ʺ�Ƶ���˲�

%�塢ʵ�鲽��
%1��ͼ��Ķ�ά��ɢ����Ҷ�任���ά��ɢ����Ҷ��任

%��1����ʾͼ�����ɢ����Ҷ�任��
clear all;
clc;
I=imread('cameraman1.tif'); %��ȡͼ��
J=fftshift(fft2(I));   %��ͼ��ĸ���Ҷ�任�ײ�����Ƶ�����Ļ�
imshow(I),title('ԭʼͼ��') ;
figure,imshow(log(1+abs(J)),[]);title('ԭʼͼ��ķ�����')  %���ö���������ʾԭͼ�ķ�����


%��2����ʾͼ�����ɢ����Ҷ�任�ķ����׺���λ��
clear all;
clc;
I=imread('lena.tif'); %��ȡͼ��
J=fftshift(fft2(I));   %��ͼ��ĸ���Ҷ�任�ײ�����Ƶ�����Ļ�
subplot(1,2,1),imshow(log(1+abs(J)),[]);title('ԭͼ��ķ�����')  %����������ʾԭͼ�ķ�����
subplot(1,2,2),imshow(angle(J)),title('ԭͼ����λ��') ;    %��ʾԭͼ����λ��


%��3����ʾ��˹��ͨ�˲����ͼ�ķ�����
clear all;
clc;
I=imread('cameraman1.tif'); %��ȡͼ��
J=fftshift(fft2(I));   %��ͼ��ĸ���Ҷ�任�ײ�����Ƶ�����Ļ�
h=fspecial('gaussian',21,2);   
K=imfilter(I,h);          %��ͼ��ĸ�˹��ͨ�˲�
L=fftshift(fft2(K));
subplot(1,2,1),imshow(log(1+abs(J)),[]);title('ԭʼͼ��ķ�����')  %����������ʾԭͼ������
subplot(1,2,2),imshow(log(1+abs(L)),[]);title('��˹��ͨ�˲����ͼ�ķ�����')  
%���ö���������ʾ��˹��ͨ�˲����ͼ�ķ�����


%��4����ά��ɢ����Ҷ��任
clear all;
clc;
I=imread('lena.tif'); %��ȡͼ��
J=fft2(I);   %��ͼ��ĸ���Ҷ�任��
K=ifft2(J);  %���ö�ά��ɢ����Ҷ��任�ع�ͼ��
subplot(1,2,1),imshow(I);title('ԭʼͼ��') ;
subplot(1,2,2),imshow(real(K),[]);title('����Ҷ�任�׵��ع�ͼ')  %����Ҷ�任�׵��ع�ͼ


%��5������Ҷ�任��ʵ���Ķ�ά��ɢ����Ҷ��任
clear all;
clc;
I=imread('lena.tif'); %��ȡͼ��
J=real(fft2(I));   %��ͼ����Ҷ�任�׵�ʵ��
K=ifft2(J);
subplot(1,2,1),imshow(I);title('ԭʼͼ��') ;
subplot(1,2,2),imshow(real(K),[]);title('����Ҷ�任��ʵ�����ع�ͼ') 
 %��ʾ����Ҷ�任��ʵ�����ع�ͼ	


 %��6������Ҷ�任��λ��Ϣ�Ķ�ά��ɢ����Ҷ��任
clear all;
clc;
I=imread('lena.tif'); %��ȡͼ��
J=fft2(I)./abs(fft2(I));   
K=ifft2(J);
subplot(1,2,1),imshow(I);title('ԭʼͼ��') ;
subplot(1,2,2),imshow(real(K),[]);title('����Ҷ�任��λ��Ϣ���ع�ͼ') 
 %��ʾ����Ҷ�任��λ��Ϣ���ع�ͼ	


%2��ͼ���ά��ɢ����Ҷ�任������

%��1����ά��ɢ����Ҷ�任�Ŀɷ�����
clear all;
clc;
I=imread('lena.tif'); %��ȡͼ��
[M,N]=size(I);
J=zeros(M,N);
K=zeros(M,N);
for i=1:M
    J(i,:)=fft(I(i,:));%��ִ���з���һάFFT
end
for j=1:N
    K(:,j)=fft(J(:,j));%����ִ���з����һάFFT
end
H=ifft2(K);  %��ͼ��ĸ���Ҷ�任��ִ�ж�ά��ɢ����Ҷ��任
subplot(1,2,1),imshow(log(1+abs(fftshift(K))),[]);title('ԭʼͼ��ķ�����') 
subplot(1,2,2),imshow(real(H),[]);title('����Ҷ�任�׵��ع�ͼ')


%��2����ά��ɢ����Ҷ�任����ת����
clear all;
clc;
I=imread('boat.bmp ');
J= imrotate(I,90);
K=fftshift(fft2(I)); 
L=fftshift(fft2(J)); 
subplot(1,2,1),imshow(log(1+abs(K)),[]);title('ԭʼͼ��ķ�����')
subplot(1,2,2),imshow(log(1+abs(L)),[]);title('ͼ����ת90�Ⱥ�ķ�����') 


%��3����ά��ɢ����Ҷ�任�Ĺ���Գ�����
clear all;
clc;
I=imread('lena.tif'); %��ȡͼ��
J=fft2(I);   
K=conj(J);  %�Ը���Ҷ�任������
H=ifft2(K); 
imshow(real(H),[]);title('����Ҷ�任���������ع�ͼ')


%��4����ά��ɢ����Ҷ�任��ƽ������
I=imread('cameraman1.tif');
J=fftshift(I);  %��ͼ��I����ѭ����λ
K=fftshift(fft2(I));   %��ԭͼ��ĸ���Ҷ�任�ײ�����Ƶ�����Ļ�
L=fftshift(fft2(J));   %��ƽ�ƺ�ͼ��ĸ���Ҷ�任�ײ�����Ƶ�����Ļ�
subplot(1,2,1),imshow(log(1+abs(K)),[]);title('ԭʼͼ��ķ�����')  
subplot(1,2,2),imshow(log(1+abs(L)),[]);title('ͼ��ƽ�ƺ�ķ�����')  


%��5����ά��ɢ����Ҷ�任�ľ���������ض���
%����������㣬ͨ��ģ��ƥ�����ı�ͼ���е��ַ�a,
clear all;
clc;
textimage = imread('text1.png');
a = textimage(32:45,88:98);   %�ַ�a��ģ��ͼ�� 
imshow(textimage);
figure, imshow(a);
C = real(ifft2(fft2(textimage) .* fft2(rot90(a,2),256,256)));    
figure, imshow(C,[]) 
thresh = 60;     % ������ط�ļ����ֵ
figure, imshow(C > thresh);   % ��������ֵ����ط壬���Ӧ��λ��Ϊ�ַ�a


%3��Ƶ���˲�

%��1��Ƶ�������ͨ�˲�
clear all;
clc;
f = imread('boat.bmp'); %��ȡͼ��
F=fft2(f);
Fc=fftshift(F);
[M N]=size(f);     %ȡͼ���С
HLPF= zeros(M,N); 
d0=50;
for i=1:M
       for j=1:N
           d=sqrt((i-M/2)^2+(j-N/2)^2);
           if d<=d0
           HLPF(i,j) = 1;  %�����ͨ�˲������ݺ���
           end           
       end
end
Fc1=Fc.*HLPF;  %Ƶ�������ͨ�˲���
F1=ifftshift(Fc1);
J=ifft2(F1);  %�����ͨ�˲�����ö�ά��ɢ����Ҷ��任�������ͼ��
imshow(real(J),[]);title('Ƶ�������ͨ�˲����ͼ��')
figure,imshow(HLPF);title('Ƶ�������ͨ�˲��Ĵ��ݺ���')


%��2��������˹��ͨ�˲�
%2�װ�����˹��ͨ�˲�
clear all;
clc;
f = imread('boat.bmp'); %��ȡͼ��
F=fft2(f);
Fc=fftshift(F);
 [M N]=size(f);  %ȡͼ���С
HBLPF= zeros(M,N); 
d0=50;
n=2;
for i=1:M
       for j=1:N
           d=sqrt((i-M/2)^2+(j-N/2)^2);
           HBLPF(i,j)=1./(1+(d/d0).^(2*n));  %2�װ�����˹��ͨ�˲����ݺ���               
       end
end
Fc1=Fc.*HBLPF;   %2�װ�����˹��ͨ�˲�
F1=ifftshift(Fc1);
J=ifft2(F1);   %2�װ�����˹��ͨ�˲���Ķ�ά��ɢ����Ҷ��任
imshow(real(J),[]);title('2�װ�����˹��ͨ�˲����ͼ��')
figure,imshow(HBLPF);title('2�װ�����˹��ͨ�˲��Ĵ��ݺ���')


%��3��Ƶ���˹��ͨ�˲�
%Ƶ���˹��ͨ�˲�
clear all;
clc;
f = imread('boat.bmp'); %��ȡͼ��
F=fft2(f);
Fc=fftshift(F);
 [M N]=size(f);  %ȡͼ���С
HGLPF= zeros(M,N); 
d0=50;
for i=1:M
       for j=1:N
           d=sqrt((i-M/2)^2+(j-N/2)^2);
           HGLPF(i,j)=exp(-(d.^2)/(2*d0.^2));  %��˹��ͨ�˲������ݺ���              
       end
end
Fc1=Fc.*HGLPF;  %Ƶ���˹��ͨ�˲�
F1=ifftshift(Fc1);
J=ifft2(F1);   %Ƶ���˹��ͨ�˲���Ķ�ά��ɢ����Ҷ��任
imshow(real(J),[]);title('Ƶ���˹��ͨ�˲����ͼ��')
figure,imshow(HGLPF);title('Ƶ���˹��ͨ�˲��Ĵ��ݺ���')



%��4��Ƶ�������ͨ�˲�
%�����ͨ�˲�������
clear all;
clc;
f = imread('boat.bmp');   %��ȡͼ��
F=fft2(f);
Fc=fftshift(F); 
[M N]=size(f);    %ȡͼ���С
HLPF= zeros(M,N);    
d0=50;
for i=1:M
       for j=1:N
           d=sqrt((i-M/2)^2+(j-N/2)^2);  %�����ͨ�˲������ݺ���
           if d<=d0
           HLPF(i,j) = 1; 
           end           
       end
end
HHPF=1-HLPF;   %�����ͨ�˲������ݺ���
Fc1=Fc.*HHPF;    %�����ͨ�˲�
F1=ifftshift(Fc1);
J=ifft2(F1);    %�����ͨ�˲���Ķ�ά��ɢ����Ҷ��任
imshow(real(J),[]);title('Ƶ�������ͨ�˲����ͼ��')
figure,imshow(HHPF);title('Ƶ�������ͨ�˲��Ĵ��ݺ���')


%��5��������˹��ͨ�˲�
%2�װ�����˹��ͨ�˲�
clear all;
clc;
f = imread('boat.bmp');   %��ȡͼ��
F=fft2(f);
Fc=fftshift(F); 
[M N]=size(f);   %ȡͼ���С
HBLPF= zeros(M,N); 
d0=50;
n=2;
for i=1:M
       for j=1:N
           d=sqrt((i-M/2)^2+(j-N/2)^2);
           HBLPF(i,j)=1./(1+(d/d0).^(2*n));  %2�װ�����˹��ͨ�˲����ݺ���                  
       end
end
HBHPF=1-HBLPF;   %2�װ�����˹��ͨ�˲����ݺ���
Fc1=Fc.*HBHPF;    %2�װ�����˹��ͨ�˲�
F1=ifftshift(Fc1);
J=ifft2(F1);     %2�װ�����˹��ͨ�˲����ά��ɢ����Ҷ��任
imshow(real(J),[]);title('2�װ�����˹��ͨ�˲����ͼ��')
figure,imshow(HBHPF);title('2�װ�����˹��ͨ�˲��Ĵ��ݺ���')


%��6��Ƶ���˹��ͨ�˲�
%Ƶ���˹��ͨ�˲�
clear all;
clc;
f = imread('boat.bmp');  %��ȡͼ��
F=fft2(f);
Fc=fftshift(F);
[M N]=size(f);   %ȡͼ���С
HGLPF= zeros(M,N);  
d0=50;
for i=1:M
       for j=1:N
           d=sqrt((i-M/2)^2+(j-N/2)^2);
           HGLPF(i,j)=exp(-(d.^2)/(2*d0.^2));  %Ƶ���˹��ͨ�˲������ݺ���                  
       end
end
HGHPF=1-HGLPF;   %Ƶ���˹��ͨ�˲������ݺ���
Fc1=Fc.*HGHPF;    %Ƶ���˹��ͨ�˲�
F1=ifftshift(Fc1);
J=ifft2(F1);   %Ƶ���˹��ͨ�˲����ά��ɢ����Ҷ��任
imshow(real(J),[]);title('Ƶ���˹��ͨ�˲����ͼ��')
figure,imshow(HGHPF);title('Ƶ���˹��ͨ�˲��Ĵ��ݺ���')
