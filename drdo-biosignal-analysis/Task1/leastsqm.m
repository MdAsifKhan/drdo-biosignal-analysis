function [h,y]=leastsqm(x,d,delta,N)
% h = estimated FIR filter
% y = output array y(n)
% x = input array x(n)
% d = desired array d(n), length must be same as
% delta = step size
% N = length of the FIR filter

    M = length(x);
    y = zeros(1.M);
    h = zeros(1,N);
    for n = N:M
        xl = x(n:-1:n-N+1);
        y = h *x1';
        e = d(n) - y;
        h = h + delta*e*xl;
    end
end