% Problem 1
A = 1000+100*randn(1,2000);
variance = var(A,1); 

meansq= reshape(A, [numel(A),1]);
meansq = mean(meansq.^2) ;

avg = mean(mean(A));


% Problem 2
variance= round(variance, 1,'decimal');
meansq = round(meansq, 1,'decimal');
avg = round(avg, 1,'decimal');

% Problem 3
meanvalsq = avg^2;
varcheck = (meansq - meanvalsq)
round(variance, 2, 'significant') == round(varcheck, 2, 'significant')

%% Problem 4
clear all, A=100+10*randn(4000,1); B=100+10*randn(4000,1);
A = round(A, 1, 'decimal');
B = round(B, 1,'decimal');

%% Problem 5
total = sum(A == B)

%% Problem 6
total = 0;
for i = 1:length(A)
    if A(i) == B(i)
        total = total + 1;
    end
end

%% Problem 7
% see gradecalc.m

%% Problem 8
num=[95, 91, 88, 85, 81, 78, 75, 71, 65, 55];

grades = gradecalc(num)

% Problem 9 ?
% Problem 10?
%Problem 11?
%Problem 12?

%% Problem 13

M = zeros(250,250);

for row = 50:75
    for col = 25:225
        M(row,col) = 1;
    end
end

for row = 75:225
    for col = 50:75
        M(row, col) = 1;
    end
end

for row = 75:225
    for col = 175:200
        M(row,col) = 1;
    end
end

figure(13)
colormap(gray)
imagesc(M)
truesize

% Problem 14 ?

%% problems 15-17? 
clear all
d = data15

%% Problem 18



