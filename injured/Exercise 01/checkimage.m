clc; clear all; close all;


A=imread('acercampestre01.jpg');

AR=A(:,:,1);
AG=A(:,:,2);
AB=A(:,:,3);
figure,imshow(A);

figure,imhist(AR);
title('Red histogram');
figure,imhist(AG);
title('Green histogram');

figure, imhist(AB);

title('Blue histogram');


Agray=rgb2gray(A);
figure,imshow(Agray);
% 
%  mean2, std2

Igray=Agray;
 level = graythresh(Igray);
BW = im2bw(Igray,level);
figure,imshow(BW)
 


[IDX,C] = kmeans(BW,2);


 ARmean=mean2(AR)
 
 ARstd=std2(AR)
 
 
 AGmean=mean2(AG)
 
 AGstd=std2(AG)
 
 
 ABmean=mean2(AB)
 
 ABstd=std2(AB)
 
 
 
 Greens=[];
 [m,n]=size(Igray);
 
 BW=imcomplement(BW);
 
 for i=1: m
     for j=1:n
         
         if BW(i,j)==1 
             Greens=[Greens AG(i,j)];
         end     
         
     end
 end
 
 
  
 SE = ones(5);
BW2 = imdilate(BW,SE);
increase = (bwarea(BW2) - bwarea(BW))/bwarea(BW)
 
 
bwarea(BW)
bwarea(BW2)

figure,imshow(BW2)
 
% % % bwconncomp computes connected components, as shown in the example:

 cc = bwconncomp(BW)
 
 labeled = labelmatrix(cc);

 
% % %  Create a pseudo-color image, where the label identifying each object
% % %  in the label matrix maps to a different color in the associated colormap matrix.
% % %  Use label2rgb to choose the colormap, the background color, and how objects 
% % %  in the label matrix map to colors in the colormap:



RGB_label = label2rgb(labeled, @copper, 'c', 'shuffle');
imshow(RGB_label,'InitialMagnification','fit')



 
 
 
 GreenArea=size(Greens,2)/(m*n) 
 
 print ('Green Area ');