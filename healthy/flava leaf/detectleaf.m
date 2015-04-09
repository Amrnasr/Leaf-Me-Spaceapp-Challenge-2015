clc; clear all; close all;


A=imread('Aesculus_flava-leaf.jpg');

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
 
 
 
 
 
 GreenArea=size(Greens,2)/(m*n) 
 
 print ('Green Area ');
 
 
 