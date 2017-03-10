function alpha_beta(signal,ch,i)
   [c,l]=wavedec(signal,5,'haar');
    beta = wrcoef('d',c,l,'haar',3); %Beta 
    alpha = wrcoef('d',c,l,'haar',4); %Alpha 
    save(strcat('Alpha&Beta_EEG',ch,'segment',num2str(i)),'beta','alpha');
end   
