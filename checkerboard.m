clear all

N=50;
M=N*8;
x=1:M;
s=square(2*pi*4/(M+1)*x);  % square wave; values in [-1,1]
s=0.5*(s+1);  % rescale to [0,1]
figure(1)
plot(s)
axis([1,M,-0.1,1.1]), grid

%%
for row=1:50
    m(row,:)=s;
    m(row+50,:)=1-s;
end
figure(2), colormap(gray)
imagesc(m)
truesize

%%
for row=101:M
    m(row,:)=m(row-100,:);
end

figure(3), colormap(gray)
imagesc(m)
truesize

%%



figure(4), colormap(gray)
imagesc(m)
truesize, axis off
