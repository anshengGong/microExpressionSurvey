%��ȡ����ͼƬ�Ķ���֡
%ÿ��for������һ�����ݿ�

maindir = 'E:\shujuku\input'; %�Լ��޸���Ҫ��·��
  k = 1; 
  %%����ѵ����test�ļ���
  E = 1;
  %%�������Ե�train�ļ���
  e = 1;
 
  all_C = zeros(28,28,3,804);
  
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

  all_C(:,:,1,e)=Image2;
 
  %%��ǩ
  if strcmp(cell2mat(TXT1(F,5)),'Happiness')==1
     all_label(e,:) = 'positive';
  elseif strcmp(cell2mat(TXT1(F,5)),'Other')==1
     all_label(e,:) = 'Other   ';
  elseif strcmp(cell2mat(TXT1(F,5)),'Surprise')==1
     all_label(e,:) = 'surprise'; 
  else
     all_label(e,:) = 'negative';
  end
  e = e+1;
  f =f+1;
     %��ǩ
    F = F+1;
end
    
end


% ����SMIC ��ɫͼƬ  û�ж���֡
B = 1;
for k2 = 32:47 
   
    subdir =  dir( maindir ); 
     if( isequal( subdir( k2 ).name, '.' ) ||  isequal( subdir( k2 ).name, '..' ) || ~subdir(k2 ).isdir )   % �������Ŀ¼����
        continue; 
     end  
     subpath = [ maindir,'\',subdir( k2 ).name];
    subsubdir = dir(subpath);
 

 for i = 1 : length( subsubdir ) 
    if( isequal( subsubdir( i ).name, '.' ) ||  isequal( subsubdir( i ).name, '..' ) || ~subsubdir( i ).isdir )   % �������Ŀ¼����
        continue; 
    end      
    subsubdirpath = [ maindir,'\',subdir(k2).name '\',subsubdir(i).name,'\'];
    all_imgs=dir([subsubdirpath,  '*.jpg']);
   
    Imagepath2 = fullfile( subsubdirpath,  '*.jpg' );
    images2 = dir( Imagepath2 );
    N=length(images2); %ͼ��ĳ���
    n = floor((N+1)/2);
    imagepath4 = [subsubdirpath, all_imgs(n).name];
    disp(imagepath4);
    Image4 = imread(imagepath4);

   [NUM2,TXT2,RAW2] = xlsread('E:\shujuku\SMIC.xls');
    
   all_C(:,:,:,e)=Image4;

  %%��ǩ
  all_label(e,:) = cell2mat(TXT2(B,1));
   e = e+1;

  B = B+1;
 end

end
   
   
   

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
   
    %%�õ�xlsx����ĳ�ʼ֡���м�֡����ǩ
    [NUM3,TXT3,RAW3] = xlsread('E:\casme2.xls');

    
    [subsubdirpath,num2str(NUM3(z,2)),'.jpg']
    Image6 = imresize(imread([subsubdirpath,num2str(NUM3(z,2)),'.jpg']),[28 28]);
 
 
     z = z+1;
   all_C(:,:,:,e)=Image6;

  %%��ǩ
  if strcmp(cell2mat(TXT3(z,4)),'happiness')==1
     all_label(e,:) = 'positive';
  elseif strcmp(cell2mat(TXT3(z,4)),'others')==1
     all_label(e,:) = 'Other   ';
  elseif strcmp(cell2mat(TXT3(z,4)),'surprise')==1
     all_label(e,:) = 'surprise'; 
  else
     all_label(e,:) = 'negative';
  end
  e = e+1;
  end

 end




%�ġ�CASME �Ҷ�ͼ��
[NUM4,TXT4,RAW4] = xlsread('E:\database\CASME\CASME.xls');


  bi = 1;
 
maindir2 = 'E:\2\CASME';  
D = 1; 
for g = 2:190  
    
    subpath2 = [maindir2,'\','sub',num2str(NUM4(g-1,1)),'\', cell2mat(RAW4(g,2)),'\',cell2mat(RAW4(g,2)),'-',num2str(NUM4(g-1,4)),'.jpg']
 
    Image8 = imresize(imread(subpath2),[28 28]);
  

   all_C(:,:,1,e)=Image8;

  %%��ǩ
  if strcmp(cell2mat(TXT4(g,5)),'happiness')==1
     all_label(e,:) = 'positive';
  elseif strcmp(cell2mat(TXT4(g,5)),'others')==1
     all_label(e,:) = 'Other   ';
  elseif strcmp(cell2mat(TXT4(g,5)),'surprise')==1
     all_label(e,:) = 'surprise'; 
  else
     all_label(e,:) = 'negative';
  end
 e = e+1;
 end 

      

%%�塢CAS(ME)2 ��ɫͼ��
[NUM5,TXT5,RAW5] = xlsread('E:\database\CAS(ME)2\CAS(ME)2.xls');

maindir3 = 'E:\database\CAS(ME)2\cropped'; 
H = 1;
for h = 1:54
 
    subpath2 = [maindir3,'\',num2str(NUM5(h,1)),'\', cell2mat(RAW5(h,2)),'\img',num2str(NUM5(h,4)),'.jpg']
 
    Image10 = imresize(imread(subpath2),[28 28]);
   
    all_C(:,:,:,e)=Image10;
   
  %%��ǩ
  if strcmp(cell2mat(TXT5(h,5)),'happiness')==1
     all_label(e,:) = 'positive';
  elseif strcmp(cell2mat(TXT5(h,5)),'others')==1
     all_label(e,:) = 'Other   ';
  elseif strcmp(cell2mat(TXT5(h,5)),'surprise')==1
     all_label(e,:) = 'surprise'; 
  else
     all_label(e,:) = 'negative';
  end

  e = e+1;
 end 



