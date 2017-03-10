clc
clear all
close all

load Data.mat


%Analysis of nogo segemnt
sampleEntropy_nogo_A=zeros(17,1);
sampleEntropy_nogo_B=zeros(17,1);
morder=12;
for i=1:17,
    seg=eval(strcat('segment',num2str(i),'_nogo'));
    %EEGA Matched Filter
    [output]=Matched_filtering(seg(:,1));
    output=real(output);
    %EEGA alpha beta coefficient
    alpha_beta(output,'A_nogo',i);

    %EEGB Matched Filter
    [output1]=Matched_filtering(seg(:,2));
    output1=real(output1);
    %EEGA alpha beta coefficient
    alpha_beta(output1,'B_nogo',i);
   
    % PSD of Filtered Signal
    [Pxx,F]=pyulear(output,morder,[],256);
    t1=strcat('Pyuclear PSD Estimate EEG_A','nogo_segment_',num2str(i));
    f1=figure;plot(F,10*log10(Pxx));title(t1);saveas(f1,t1,'jpg');
    [Pxx1,F1]=pyulear(output1,morder,[],256);
    t2=strcat('Pyuclear PSD Estimate EEG_B','nogo_segment_',num2str(i));
    f2=figure;plot(F1,10*log10(Pxx1));title(t2);saveas(f2,t2,'jpg');
    
    
    %Sample Entropy EEGA
    sa = SampEn(1,0.2*std(output),output);
    sampleEntropy_nogo_A(i)=sa;
    %Sample Entropy EEGB
    sb= SampEn(1,0.2*std(output),output1);
    sampleEntropy_nogo_B(i)=sb;
    close all
end
save('SampleEntropy_nogo','sampleEntropy_nogo_A','sampleEntropy_nogo_B');

sampleEntropy_go_A=zeros(9,1);
sampleEntropy_go_B=zeros(9,1);

for i=1:9,
    seg=eval(strcat('segment',num2str(i),'_nogo'));
    %EEGA Matched Filter
    [output]=Matched_filtering(seg(:,1));
    output=real(output);
    %EEGA alpha beta coefficient
    alpha_beta(output,'A_go',i);

    %EEGB Matched Filter
    [output1]=Matched_filtering(seg(:,2));
    output1=real(output1);
    %EEGA alpha beta coefficient
    alpha_beta(output1,'B_go',i);
   
    % PSD of Filtered Signal
    [Pxx,F]=pyulear(output,morder,[],256);
    t1=strcat('Pyuclear PSD Estimate EEG_A','go_segment_',num2str(i));
    f1=figure;plot(F,10*log10(Pxx));title(t1);saveas(f1,t1,'jpg');
    [Pxx1,F1]=pyulear(output1,morder,[],256);
    t2=strcat('Pyuclear PSD Estimate EEG_B','go_segment_',num2str(i));
    f2=figure;plot(F1,10*log10(Pxx1));title(t2);saveas(f2,t2,'jpg');
    
    
    %Sample Entropy EEGA
    sa = SampEn(1,0.2*std(output),output);
    sampleEntropy_go_A(i)=sa;
    %Sample Entropy EEGB
    sb= SampEn(1,0.2*std(output),output1);
    sampleEntropy_go_B(i)=sb;
    close all
end
save('SampleEntropy_nogo','sampleEntropy_go_A','sampleEntropy_go_B');


