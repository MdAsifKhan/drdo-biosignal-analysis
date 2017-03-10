clc
clear all
close all

load Data.mat

rg = (-500:500)';
sigmas = exp(log(2):.3:log(200));
gabors = exp(-.5*(rg.^2)*sigmas.^(-2)).*cos(rg*sigmas.^(-1)*2*pi*2);
%Analysis of nogo segemnt
for i=1:17,
    seg=eval(strcat('segment',num2str(i),'_nogo'));
    %EEGA Matching Pursuit
    eegA=seg(:,1);
    %Express signal as a sparse sum of Gabors
    [ws,r] = matchingP(eegA,gabors);
    t1=strcat('EEG A matching pursuit Basis',' ','nogo segment ',num2str(i));
    f1=figure;plot(gabors);title(t1);saveas(f1,t1,'jpg');
    
    t2=strcat('EEG A matching pursuit Signal Approximation',' ','nogo segment ',num2str(i));
    f2=figure;plot([eegA,r]);legend('signal','approximation');title(t2);saveas(f2,t2,'jpg');

    %the convolution here is to make the spikes visible
    f3=figure;imagesc(conv2(ws,exp(-rg.^2/2/20^2),'same')');
    xlabel('increasing time ->');
    ylabel('increasing frequency ->');
    legend('signal','approximation');
    t3=sprintf('EEG A matching pursuit nogo segment %d weights (%d non-zero weights)',i,nnz(ws(:)));
    title(t3);saveas(f3,t3,'jpg');
    save(strcat('Weight Matrix and Approximation nogo segment ',num2str(i),' EEGA'),'ws','r');

   
    %EEGB Matching Pursuit
    eegB=seg(:,2);
    %Express signal as a sparse sum of Gabors
    [ws1,r1] = matchingP(eegB,gabors);
    t1=strcat('EEG B matching pursuit Basis',' ','nogo segment ',num2str(i));
    f1=figure;plot(gabors);title(t1);saveas(f1,t1,'jpg');
    
    t2=strcat('EEG B matching pursuit Signal Approximation',' ','nogo segment ',num2str(i));
    f2=figure;plot([eegB,r1]);legend('signal','approximation');title(t2);saveas(f2,t2,'jpg');

    %the convolution here is to make the spikes visible
    f3=figure;imagesc(conv2(ws1,exp(-rg.^2/2/20^2),'same')');
    xlabel('increasing time ->');
    ylabel('increasing frequency ->');
    legend('signal','approximation');
    t3=sprintf('EEG A matching pursuit nogo segment %d weights (%d non-zero weights)',i,nnz(ws(:)));
    title(t3);saveas(f3,t3,'jpg');
    save(strcat('Weight Matrix and Approximation nogo segment ',num2str(i),' EEGB'),'ws1','r1');
    close all
end

for i=1:4,
    seg=eval(strcat('segment',num2str(i),'_go'));
    %EEGA Matching Pursuit
    eegA=seg(:,1);
    %Express signal as a sparse sum of Gabors
    [ws,r] = matchingP(eegA,gabors);
    t1=strcat('EEG A matching pursuit Basis',' ',' go segment ',num2str(i));
    f1=figure;plot(gabors);title(t1);saveas(f1,t1,'jpg');
    
    t2=strcat('EEG A matching pursuit Signal Approximation',' ','go segment ',num2str(i));
    f2=figure;plot([eegA,r]);legend('signal','approximation');title(t2);saveas(f2,t2,'jpg');

    %the convolution here is to make the spikes visible
    f3=figure;imagesc(conv2(ws,exp(-rg.^2/2/20^2),'same')');
    xlabel('increasing time ->');
    ylabel('increasing frequency ->');
    legend('signal','approximation');
    t3=sprintf('EEG A matching pursuit go segment %d weights (%d non-zero weights)',i,nnz(ws(:)));
    title(t3);saveas(f3,t3,'jpg');
    save(strcat('Weight Matrix and Approximation go segment ',num2str(i),' EEGA'),'ws','r');

   
    %EEGB Matching Pursuit
    eegB=seg(:,2);
    %Express signal as a sparse sum of Gabors
    [ws1,r1] = matchingP(eegB,gabors);
    t1=strcat('EEG B matching pursuit Basis',' ',' go segment ',num2str(i));
    f1=figure;plot(gabors);title(t1);saveas(f1,t1,'jpg');
    
    t2=strcat('EEG B matching pursuit Signal Approximation',' ',' go segment ',num2str(i));
    f2=figure;plot([eegB,r1]);legend('signal','approximation');title(t2);saveas(f2,t2,'jpg');

    %the convolution here is to make the spikes visible
    f3=figure;imagesc(conv2(ws1,exp(-rg.^2/2/20^2),'same')');
    xlabel('increasing time ->');
    ylabel('increasing frequency ->');
    legend('signal','approximation');
    t3=sprintf('EEG A matching pursuit go segment %d weights (%d non-zero weights)',i,nnz(ws(:)));
    title(t3);saveas(f3,t3,'jpg');
    save(strcat('Weight Matrix and Approximation go segment ',num2str(i),' EEGB'),'ws1','r1');
    close all
end


