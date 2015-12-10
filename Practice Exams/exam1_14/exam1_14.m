clear all

% Problem 1
x = 99:0.01:101;
a = 1;
b = 1;
c = 2;
d = 4.26394587779238964;
f = 0.001;

y = a*sqrt(b*abs(c*tan(d*exp(f*x))));

% Problem 2
y_max = max(y);
x_max = x(find(y == y_max));

%% Problem 3 
round(y_max, 2, 'significant')

%% Problem 4
figure(4)
plot(x, y, 'g',...
    'LineWidth', 2)
%% Problem 5
coefs = [1,1,1;...
        1,2,3;...
        3,2,2];
solns = [10;10;10];

s = coefs\solns;

disp(['s = ', num2str(s(1)),' + ',...
            num2str(s(2)), ' + ',...
            num2str(s(3)),'.'])
%% Problem 6
clear all
k = 0:2222;
h = k/13;

total = 0;
for i = 1:length(h)
    if h(i) == fix(h(i))
        total= total +1;
    end
end

%% Problem 7
total = sum(h == fix(h));

%% Problem 8
t = 0:0.1:7;
x = t.^2.*exp(-1.5*t);

for n = 1:length(x)
    if n == 1
    y(n) = 40*x(n+1);
    elseif n > 1 & n < length(x)
    y(n) = 40*x(n+1) - 40*x(n-1);
    elseif n == length(x)
        y(n) = -40*x(n-1);
    end
end

%% Problem 9
figure(9)
plot(t, x, t, y,...
    'LineWidth', 2), grid on
xlabel(' time (seconds)', 'FontSize', 14)
ylabel('values of x and y','FontSize', 14)
legend({'x vs.t', 'y vs. t'},...
    'Location', 'Best','FontSize', 14)
%% Problem 10 
clear all
x = rand(1, 1e3);
total = 0;

for i= 3:length(x)
    if x(i) > (x(i-2) + x(i-1))
        total = total + 1;
    end
end

%% Problem 11 
clear all
x = rand(1, 1e3);
largest = max(x);
larger = x(1);

for i= 1:length(x)
    if (x(i) > larger) & (x(i) < largest)
        larger = x(i);
    end
end

%% A check for number 11
x(find(x == largest)) = 0;
max(x)

%% Problem 12
clear all
a = zeros(401,401);

for i = 1:401
    a(i,402-i) = 1;
    a(i, i) = 1;
end
a(fix(401/2),:) = 1;
a(:, fix(401/2)) = 1;

%%
figure(12), colormap(gray)
imagesc(a)
truesize





    







