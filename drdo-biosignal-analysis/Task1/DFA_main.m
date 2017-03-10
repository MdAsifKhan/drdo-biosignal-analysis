function [n,F_n]=DFA_main(DATA)
%A is the alpha 
%D is the dimension of the DATA
%n can be changed to your interest
n=100:100:1000;
N1=length(n);
F_n=zeros(N1,1);
 for i=1:N1
     F_n(i)=DFA(DATA,n(i),1);
 end

 n=n';
 
%  A=polyfit(log(n(1:end)),log(F_n(1:end)),1);
%  Alpha1=A(1);
%  D=3-A(1);
end