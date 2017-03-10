function [Hurst,stdH]=hurst(Data,q,maxT) 
% H=genhurst(S)
%Input:
% Data : 1xT data series (T>50 recommended)
% q    : the exponent,it can be a vector(default value q=1)
% maxT : maxT of the scaling window, default value maxT=19

%Output:
%
% H    : specifies hurst exponent
% stdH : estimates the standard deviation stdH(q)

if nargin < 2, q = 1; maxT = 19; end;if nargin < 3,  maxT = 19; end
if size(Data,1)==1 && size(Data,2)>1,
    Data = Data';
elseif size(Data,1)>1 && size(Data,2)>1,
    fprintf('S must be 1xT  \n');
    return;
end
if size(Data,1) < (maxT*4 | 60)
    warning('Data serie very short!');
end
L=length(Data);lq = length(q);
Hurst=[];k = 0;
for i=5:maxT
    k = k+1;
    x = 1:i;
    mcord = zeros(i,lq);
 	for tt = 1:i
        dV = Data((tt+1):tt:L)-Data(((tt+1):tt:L)-tt);
        VV = Data(((tt+1):tt:(L+tt))-tt)';
        N = length(dV)+1;
        X = 1:N;
        Y = VV;
        mx = sum(X)/N;
        SSxx = sum(X.^2)-N*mx^2;
        my   = sum(Y)/N;
        SSxy = sum(X.*Y)-N*mx*my;
        cc(1) = SSxy/SSxx;
        cc(2) = my-cc(1)*mx;
        ddVd  = dV-cc(1);
        VVVd  = VV-cc(1).*(1:N)-cc(2);
        for qq=1:lq
            mcord(tt,qq)=mean(abs(ddVd).^q(qq))/mean(abs(VVVd).^q(qq));
        end
    end
    mx = mean(log10(x));
    SSxx = sum(log10(x).^2) - i*mx^2;
    for qq=1:lq
        my = mean(log10(mcord(:,qq)));
        SSxy = sum(log10(x).*log10(mcord(:,qq))') - i*mx*my;
        Hurst(k,qq) = SSxy/SSxx;
    end
end
Hurst = mean(Hurst)'./q(:);
if nargout == 2
    stdH = std(Hurst)'./q(:);
elseif nargout == 1
    stdH = [];
end
end