%9����ǩ  �����еĶ���֡�ͱ�ǩ�õ�

maindir = 'E:\shujuku\input'; %�Լ��޸���Ҫ��·��
  k = 1; 
  %%����ѵ����test�ļ���
  E = 1;
  %%�������Ե�train�ļ���
  e = 1;

  all2_C = zeros(28,28,3,640);
  
  A = 1;M =10;
% һ��SAMM �Ҷ�ͼ�� �ж���֡   
f=1;F = 2;  bian = 2;
for k1 = 1:31 
    subdir =  dir( maindir );
     if( isequal( subdir( k1 ).name, '.' ) ||  isequal( subdir( k1 ).name, '..' ) || ~subdir(k1 ).isdir )   % �������Ŀ¼����
        continue; 
     end  
     subpath = [ maindir,'\',subdir( k1 ).name];
    subsubdir = dir(subpath);

for i = 1 : length( subsubdir ) 
    if( isequal( subsubdir( i ).name, '.' ) ||  isequal( subsubdir( i ).name, '..' ) || ~subsubdir( i ).isdir )   % �������Ŀ¼����
        continue; 
    end      
    subsubdirpath = [ maindir,'\',subdir(k1).name '\',subsubdir(i).name,'\',subdir(k1).name,'_']; %�õ�ͼƬ������λ��
   %%�õ�����֡����ʼ֡Ϊ1.jpg
   [NUM1,TXT1,RAW1] = xlsread('E:\samm.xls');
   [subsubdirpath,num2str(NUM1(f,2)),'.jpg'] 
  Image2 = imresize(imread([subsubdirpath,num2str(NUM1(f,2)),'.jpg']),[28 28]);
  all2_C(:,:,1,e)= Image2;

  %%��ǩ
  all2_label(e,:) = [cell2mat(TXT1(F,5)),zeros(1,M-length(cell2mat(TXT1(F,5))))];
 
  e = e+1;
  f =f+1;
     %��ǩ
  F = F+1;
end

    
end

% e
% % ����SMIC ��ɫͼƬ  û�ж���֡
% B = 1;
% for k2 = 32:47 
%    
%     subdir =  dir( maindir ); 
%      if( isequal( subdir( k2 ).name, '.' ) ||  isequal( subdir( k2 ).name, '..' ) || ~subdir(k2 ).isdir )   % �������Ŀ¼����
%         continue; 
%      end  
%      subpath = [ maindir,'\',subdir( k2 ).name];
%     subsubdir = dir(subpath);
%      G(c)=length( subsubdir )-2;
%      c = c+1;
%  for i = 1 : length( subsubdir ) 
%     if( isequal( subsubdir( i ).name, '.' ) ||  isequal( subsubdir( i ).name, '..' ) || ~subsubdir( i ).isdir )   % �������Ŀ¼����
%         continue; 
%     end      
%     subsubdirpath = [ maindir,'\',subdir(k2).name '\',subsubdir(i).name,'\'];
%     all_imgs=dir([subsubdirpath,  '*.jpg']);
%     %%�õ���ʼ֡�Ͷ���֡
%     Imagepath2 = fullfile( subsubdirpath,  '*.jpg' );
%     images2 = dir( Imagepath2 );
%     N=length(images2); %ͼ��ĳ���
%     n = floor((N+1)/2);
%     %%�������
%     load opticalFlowTest;
%     imagepath3 = [subsubdirpath,all_imgs(1).name];
%     imagepath4 = [subsubdirpath, all_imgs(n).name];
%     Image3 = imread(imagepath3);
%     Image4 = imread(imagepath4);
%     [Vx,Vy]=opticalFlow(rgb2gray(Image3),rgb2gray(Image4),'smooth',1,'radius',10,'type','LK');
%     m = abs(sqrt(Vx^2+Vy^2));
%    [NUM2,TXT2,RAW2] = xlsread('E:\shujuku\SMIC.xls');
%     
%  
%   %%������Ϣ�ŵ�all
%   all_C(:,:,1,e)=Vx;
%   all_C(:,:,2,e)=Vy;
%   all_C(:,:,3,e)=m;
%   %%��ǩ
%   all_label(e,:) = cell2mat(TXT2(B,1));
%    e = e+1;
% 
%   B = B+1;
%  end
% 
% end
   

Maindir = 'E:\database\CASME2\CASME2_preprocessed_small_Li Xiaobai\input';
%����CASME2  �ж���֡  ��ʼ֡ ��ɫͼƬ
z = 1;
for k3 = 1:27
    subdir =  dir( Maindir ); 
     if( isequal( subdir( k3 ).name, '.' ) ||  isequal( subdir( k3 ).name, '..' ) || ~subdir(k3 ).isdir )   % �������Ŀ¼����
        continue; 
     end  
     subpath = [ Maindir,'\',subdir( k3 ).name];
    subsubdir = dir(subpath);

 for i = 1 : length( subsubdir ) 
    if( isequal( subsubdir( i ).name, '.' ) ||  isequal( subsubdir( i ).name, '..' ) || ~subsubdir( i ).isdir )   % �������Ŀ¼����
        continue; 
    end      
    subsubdirpath = [ Maindir,'\',subdir(k3).name '\',subsubdir(i).name,'\reg_img'];
   
    %%�õ�xlsx������м�֡����ǩ
    [NUM3,TXT3,RAW3] = xlsread('E:\casme2.xls');
    [subsubdirpath,num2str(NUM3(z,2)),'.jpg']
   
    Image6 = imresize(imread([subsubdirpath,num2str(NUM3(z,2)),'.jpg']),[28 28]);
    all2_C(:,:,:,e)= Image6;
    
     z = z+1;
  %%��ǩ
   all2_label(e,:) = [cell2mat(TXT3(z,4)),zeros(1,M-length(cell2mat(TXT3(z,4))))];
   e = e+1;
  end

 end



%�ġ�CASME �Ҷ�ͼ��
[NUM4,TXT4,RAW4] = xlsread('E:\database\CASME\CASME.xls');

maindir2 = 'E:\2\CASME';  
D = 1; 
for g = 2:190  
    subpath2 = [maindir2,'\','sub',num2str(NUM4(g-1,1)),'\', cell2mat(RAW4(g,2)),'\',cell2mat(RAW4(g,2)),'-',num2str(NUM4(g-1,4)),'.jpg']
    Image8 = imresize(imread(subpath2),[28 28]);  
    all2_C(:,:,1,e)= Image8;

  %%��ǩ
  all2_label(e,:) = [cell2mat(TXT4(g,5)),zeros(1,M-length(cell2mat(TXT4(g,5))))];
  e = e+1;
 end 

      

%%�塢CAS(ME)2 ��ɫͼ��
[NUM5,TXT5,RAW5] = xlsread('E:\database\CAS(ME)2\CAS(ME)2.xls');

maindir3 = 'E:\database\CAS(ME)2\cropped'; 
H = 1;
for h = 1:54
    subpath2 = [maindir3,'\',num2str(NUM5(h,1)),'\', cell2mat(RAW5(h,2)),'\img',num2str(NUM5(h,4)),'.jpg']
    Image10 = imresize(imread(subpath2),[28 28]);
   all2_C(:,:,:,e)= Image10;
     
  %%��ǩ
  all2_label(e,:) = [cell2mat(TXT5(h,5)),zeros(1,M-length(cell2mat(TXT5(h,5))))];
  e = e+1;
end 
%���ݿ��������

 %��д��Сд
for i = 1:640
    if all2_label(i)>='A' && all2_label(i)<='Z'
      all2_label(i)= char(all2_label(i)+32);
    end    
end
for i = 1:640
    if strncmp(all2_label(i,:),'others    ',4)
      all2_label(i,:)= 'other     ';
    end    
end

j = 1;
for i= 1:640
if strncmp(all2_label(i,:),'anger     ',5)|| strncmp(all2_label(i,:), 'sadness   ',5)|| strncmp(all2_label(i,:),'surprise  ',5)||strncmp(all2_label(i,:),'fear      ',4) || strncmp(all2_label(i,:),'other     ',5)|| strncmp(all2_label(i,:), 'happiness ',5)||strncmp(all2_label(i,:),'disgust   ',5) || strncmp(all2_label(i,:),'repression',5)|| strncmp(all2_label(i,:),'tense     ',5)
    all_label(j,:) = all2_label(i,:);
    all_C(:,:,:,j) = all2_C(:,:,:,i);
    j=j+1;   
end   
end    



