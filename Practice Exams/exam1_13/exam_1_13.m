%% probelm 1

x = 10:20;
total = 0;
for i = 2:2:length(x)
    total = total + x(i)^2;
end

%% Problem 2
total = sum([11:2:20].^2)

%% Problem 3

fib = [0, 1, zeros(1, 8)]

for i= 3:length(fib)
    fib(i) = fib(i-2) + fib(i-1)
end

%% Problem 4

t = -8:.1:8;
for i = 1:length(t)
    x(i) = exp(-4.*abs(t(i)));
end

figure(4)
plot(t, x), grid on
xlabel('Time (seconds)')
ylabel('Y values')
axis([-8.5, 8.5,...
    (min(x)-0.1), (max(x)+0.1)]) % not necessary

%% Problem 5

theta = 0:0.1:2*pi;
r = 4;
x = r*cos(theta) + 2;
y = r*sin(theta) +2 ;
figure(5)
plot(x,y, 'k'), grid on

%% Problem 6
x = -1:0.5:1
total = sum(abs(x))

%% Problem 6 check

x=-1:0.5:1;
for n=1:length(x)
if x(n)<0
y(n)=-x(n);
else
y(n)=x(n);
end
end
check = sum(y)

% are check and total == ?
if check == total
    disp('YEEEAH')
else 
    disp('Nope')
end

%% Problem 7

coefs = [10, -11, 12; ...
    15, 0, -13; ...
    16, -14, 17];

values = [3;2;1];

tuv = coefs\values ;
disp(['t is [', num2str(tuv(1)),'].'...
    ' u is [', num2str(tuv(2)),'].' ...
    ' v is [', num2str(tuv(3)), '].'])

%% Problem 8
ncols = 6;

for col= 1:ncols
    if col > 1 & col < ncols 
    M(col,col)= 1, M(col +1, col) = 1, M(col -1, col) = 1
    elseif col == 1
        M(col, col) = 1, M(col + 1, col) = 1
    elseif col == ncols
        M(col, col) =1 , M(col -1, col) = 1
    end
end

        
%% Problem 9 
% see grat135.m for function definition

N = 400;
matrix = grat135(N);

figure(9)
colormap(gray(256))
imagesc(matrix)


