
clc
clear all
close all

load segments;
f=50; %Frequency to be filtered using notch filter
fs=256;%Sampling Frequency in Hz
q=35;% Quality factor
wo = f/(fs/2);  bw = wo/q;
[num,den] = iirnotch(wo,bw);

ch='A';ch1='B';
%Filtering Each Segment of EEGA and EEGB, to remove powerline interference of 50 Hz 
filt_seg1_EEGA=filter(num,den,segment1(:,1));
filt_seg1_EEGB=filter(num,den,segment1(:,2));
analysis(filt_seg1_EEGA,ch,1);
analysis(filt_seg1_EEGA,ch1,1);
close all
filt_seg2_EEGA=filter(num,den,segment2(:,1));
filt_seg2_EEGB=filter(num,den,segment2(:,2));
analysis(filt_seg2_EEGA,ch,2);
analysis(filt_seg2_EEGA,ch1,2);
close all
filt_seg3_EEGA=filter(num,den,segment3(:,1));
filt_seg3_EEGB=filter(num,den,segment3(:,2));
analysis(filt_seg3_EEGA,ch,3);
analysis(filt_seg3_EEGA,ch1,3);
close all
filt_seg4_EEGA=filter(num,den,segment4(:,1));
filt_seg4_EEGB=filter(num,den,segment4(:,2));
analysis(filt_seg4_EEGA,ch,4);
analysis(filt_seg4_EEGA,ch1,4);
close all
filt_seg5_EEGA=filter(num,den,segment5(:,1));
filt_seg5_EEGB=filter(num,den,segment5(:,2));
analysis(filt_seg5_EEGA,ch,5);
analysis(filt_seg5_EEGA,ch1,5);
close all
filt_seg6_EEGA=filter(num,den,segment6(:,1));
filt_seg6_EEGB=filter(num,den,segment6(:,2));
analysis(filt_seg6_EEGA,ch,6);
analysis(filt_seg6_EEGA,ch1,6);
close all
filt_seg7_EEGA=filter(num,den,segment7(:,1));
filt_seg7_EEGB=filter(num,den,segment7(:,2));
analysis(filt_seg7_EEGA,ch,7);
analysis(filt_seg7_EEGA,ch1,7);
close all
filt_seg8_EEGA=filter(num,den,segment8(:,1));
filt_seg8_EEGB=filter(num,den,segment8(:,2));
analysis(filt_seg8_EEGA,ch,8);
analysis(filt_seg8_EEGA,ch1,8);
close all
filt_seg9_EEGA=filter(num,den,segment9(:,1));
filt_seg9_EEGB=filter(num,den,segment9(:,2));
analysis(filt_seg9_EEGA,ch,9);
analysis(filt_seg9_EEGA,ch1,9);
close all
filt_seg10_EEGA=filter(num,den,segment10(:,1));
filt_seg10_EEGB=filter(num,den,segment10(:,2));
analysis(filt_seg10_EEGA,ch,10);
analysis(filt_seg10_EEGA,ch1,10);
close all
filt_seg11_EEGA=filter(num,den,segment11(:,1));
filt_seg11_EEGB=filter(num,den,segment11(:,2));
analysis(filt_seg11_EEGA,ch,11);
analysis(filt_seg11_EEGA,ch1,11);
close all
filt_seg12_EEGA=filter(num,den,segment12(:,1));
filt_seg12_EEGB=filter(num,den,segment12(:,2));
analysis(filt_seg12_EEGA,ch,12);
analysis(filt_seg12_EEGA,ch1,12);
close all

filt_seg13_EEGA=filter(num,den,segment13(:,1));
filt_seg13_EEGB=filter(num,den,segment13(:,2));
analysis(filt_seg13_EEGA,ch,13);
analysis(filt_seg13_EEGA,ch1,13);

filt_seg14_EEGA=filter(num,den,segment14(:,1));
filt_seg14_EEGB=filter(num,den,segment14(:,2));
analysis(filt_seg14_EEGA,ch,14);
analysis(filt_seg14_EEGA,ch1,14);

filt_seg15_EEGA=filter(num,den,segment15(:,1));
filt_seg15_EEGB=filter(num,den,segment15(:,2));
analysis(filt_seg15_EEGA,ch,15);
analysis(filt_seg15_EEGA,ch1,15);

filt_seg16_EEGA=filter(num,den,segment16(:,1));
filt_seg16_EEGB=filter(num,den,segment16(:,2));
analysis(filt_seg16_EEGA,ch,16);
analysis(filt_seg16_EEGA,ch1,16);

filt_seg17_EEGA=filter(num,den,segment17(:,1));
filt_seg17_EEGB=filter(num,den,segment17(:,2));
analysis(filt_seg17_EEGA,ch,17);
analysis(filt_seg17_EEGA,ch1,17);
