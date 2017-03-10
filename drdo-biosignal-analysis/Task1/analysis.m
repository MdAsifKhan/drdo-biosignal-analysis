function analysis(signal,ch,i)
wavelet_fun='db1';
[C,L]=wavedec(signal,5,wavelet_fun);
%Calculation of the Details Vectors of every Band 
D1 = wrcoef('d',C,L,wavelet_fun,1); %NOISY 
D2 = wrcoef('d',C,L,wavelet_fun,2); %Gamma 
D3 = wrcoef('d',C,L,wavelet_fun,3); %Beta 
D4 = wrcoef('d',C,L,wavelet_fun,4); %Alpha 
D5 = wrcoef('d',C,L,wavelet_fun,5); %Theta 
A5 = wrcoef('a',C,L,wavelet_fun,5); %Delta

exponent_noisy = lyapunov(D1);t1=strcat('Lyapunov Exponent for each initial point (noisy band) EEG',ch,' segment ',num2str(i));
f1=figure;plot(exponent_noisy);title(t1);saveas(f1,t1,'jpg');

exponent_gamma = lyapunov(D2);
t2=strcat('Lyapunov Exponent for each initial point (gamma band) EEG',ch,' segment ',num2str(i));
f2=figure;plot(exponent_gamma);title(t2);saveas(f2,t2,'jpg');

exponent_beta = lyapunov(D3);
t3=strcat('Lyapunov Exponent for each initial point (beta band) EEG',ch,' segment ',num2str(i));
f3=figure;plot(exponent_beta);title(t3);saveas(f3,t3,'jpg');

exponent_alpha = lyapunov(D4);
t4=strcat('Lyapunov Exponent for each initial point (alpha band) EEG',ch,' segment ',num2str(i));
f4=figure;plot(exponent_alpha);title(t4);saveas(f4,t4,'jpg');

exponent_theta = lyapunov(D5);
t5=strcat('Lyapunov Exponent for each initial point (theta band) EEG',ch,' segment ',num2str(i));
f5=figure;plot(exponent_theta);title(t5);saveas(f5,t5,'jpg');

exponent_delta = lyapunov(A5);
t6=strcat('Lyapunov Exponent for each initial point (delta band) EEG',ch,' segment ',num2str(i));
f6=figure;plot(exponent_delta);title(t6);saveas(f6,t6,'jpg');
save(strcat('Lyapunov Exponents EEGA Segment ',num2str(i)),'exponent_noisy','exponent_gamma','exponent_beta','exponent_alpha','exponent_theta','exponent_delta');


[n,dfa_noisy]=DFA_main(D1);t1=strcat('DFA for each initial point (noisy band) EEG',ch,' segment ',num2str(i));
f7=figure;plot(log(n),log(dfa_noisy));xlabel('n');ylabel('F(n)');title(t1);saveas(f7,t1,'jpg');

[n,dfa_gamma]=DFA_main(D2);t1=strcat('DFA for each initial point (gamma band) EEG',ch,' segment ',num2str(i));
f7=figure;plot(log(n),log(dfa_gamma));xlabel('n');ylabel('F(n)');title(t1);saveas(f7,t1,'jpg');

[n,dfa_beta]=DFA_main(D3);t1=strcat('DFA for each initial point (beta band) EEG',ch,' segment ',num2str(i));
f7=figure;plot(log(n),log(dfa_beta));xlabel('n');ylabel('F(n)');title(t1);saveas(f7,t1,'jpg');

[n,dfa_alpha]=DFA_main(D4);t1=strcat('DFA for each initial point (alpha band) EEG',ch,' segment ',num2str(i));
f7=figure;plot(log(n),log(dfa_alpha));xlabel('n');ylabel('F(n)');title(t1);saveas(f7,t1,'jpg');

[n,dfa_theta]=DFA_main(D5);t1=strcat('DFA for each initial point (theta band) EEG',ch,' segment ',num2str(i));
f7=figure;plot(log(n),log(dfa_theta));xlabel('n');ylabel('F(n)');title(t1);saveas(f7,t1,'jpg');

[n,dfa_delta]=DFA_main(A5);t1=strcat('DFA for each initial point (delta band) EEG',ch,' segment ',num2str(i));
f7=figure;plot(log(n),log(dfa_delta));xlabel('n');ylabel('F(n)');title(t1);saveas(f7,t1,'jpg');

save(strcat('DFA Analysis of EEGA Segment ',num2str(i)),'dfa_noisy','dfa_gamma','dfa_beta','dfa_alpha','dfa_theta','dfa_delta');

end