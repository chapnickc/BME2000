% how to find the intersection of two lines
% using a few different methods. In particular, using
% linear equations, the fsolve function, and
% the find function.
% %
% Fist I'll set up the two lines
% we are looking at, show you a new
% synax for changing aesthetics when using
% the plot function, and how to find the 
% intersection using the find function
%
%
%
% so consider the lines
% y = 3x + 2
% y = -2x + 7
%
% evaluate them from 0 to 2 in steps of 0.1
dx = 0.1;
x = 0:dx:2;

y1 = 3.*x + 2;
y2 = -2.*x +7;


% the way we use this new syntax is
figure(1)
p = plot(x, y1,
         x, y2);

% wanted to change the linestyle of y1
p(1).LineStyle = '--'

% change the linewidth of y2
p(2).LineWidth = 2

% can be useful if you want to heavily
% customize your graphs
%%
% let's see if there are any points where 
%y1 is exactly equal to y2
%
% using the any() function
any(y1 == y2)

% so we know that they intersect at a point
% if you watched my other video on how to find
% the intersection of two lines, you would know
% that this doesn't always occur, but in this
% case we are lucky
%
%
% so let's find the subscript at which 
% the two functions are equal. can use this
% becuase the two vectors are equal length

sub = find(y1 == y2)

 

%%

%y1(sub) == y2(sub)
x_intersect = x(sub);
intersect_pt = y1(sub);


figure(1)
p = plot(x, y1,...
         x, y2,...
         x_intersect, intersect_pt,'ko');

p(3).LineWidth = 1.5; p(3).MarkerSize = 6


%%
% going to cover how to find the intesection 
% point using linear equations.
% 
% previousy we found the x,y coordinates
% of the intersection using the find function
%
% when we use linear equations we put the coefficients of
% our variables of our equations into a matrix
% and the solutions in a column matrix
%
% note that we should have the same number of equations
% as we do unknown variables, and therefore the coefficients
% matrix should be a square matrix with the same # of rows
% and colmns as the number of variables we have
%
% Since we knoew ahead of time that our two lines 
% intersect we could rewrite our functions as 
% y1 would be y - 3x = 2
% y2 would be y + 2x = 7
%
% and use a linear equation to find the x and y values
% at this intersection 
%
%
A = [1, -3; % [y1, x1,
     1, 2]; % y2, x2];
      
B = [2; % soln 1
     7]; %soln 2
 

% 
%
% the next step can be thought of mathematically as 
% doing matrix division of A into B
% which is similar of taking the inverse of A and
% multiplying the matrix B... although
% the matlab documentation says this is not quite
% how the algorithm works
%
%
% so the way we do this is 
soln = A\B;

y = soln(1) % since this was the variable in the first
            % col of our coeffs
x = soln(2)



%%
% can check this 
% by multiplying the two matricies
% to see if we get the solns to our original eqns
A*soln 

% and we get them back!
%
% next is fsolve
%% -----------
% an example using fsolve 
% we have the equations
% y - 3x = 2
% y + 2x = 7
% using fsolve is a function that can solve systems of
% both linear and nonlinear equations of many variables
%
% in this example I will show you how to linear equations
% but it is easily adapted to nonlinear, as shown below

% going to show you how to use fsolve to find the
% intersection of two lines. 

% so the way this works is you write a function
% the has the eqautions you are working with 
% the whos input is a vector containing your variables.
% in this case it will be y and x 
% 
% writing an internal function. can also be done using
% an external.
% 

% have to write equations 
% in like so
%  y - 3x -2 = 0
% y - 3x - 7 = 0

                % y      % x     % soln
func = @(var) [var(1) - 3*var(2) - 2;
               var(1) + 2*var(2) - 7];
 
initial = [0;0];

solns = fsolve(func, initial,...
               optimoptions('fsolve', 'Display', 'off'));
           
%%
y_intersect = solns(1)
x_intersect = solns(2)

% if we were to plot this
% let's define our equations
dx = 0.1;
x = 0:dx:2;

y1 = 3.*x + 2;
y2 = -2.*x +7;

figure(1)
plot(x,y1,...
    x,y2,...
    x_intersect,y_intersect,'ko')


%% slightly more complicated example
% i'll show you how to find when a nonlinear
% equation interesects a line using fsolve.

% going to define an expontial function
% multiplied by x^2
dx = 0.1
x = 0:dx:7;
y = (x).^2 .*exp(-x);

threshold = 0.25;
thresh_line = repmat(threshold, 1, length(x));

figure(1)
plot(x,y,...
     x, thresh_line), grid


%% 
% first going to show you how to find one intersection
% using fsolve
%
% Above, I showed how to do this
% using an internal function, but now i will show you
% how to do it using an external function. 
%
% so we know that to use the fsolve our function
% must have the 'general outline' of what
% our functions are
% 
% so we are looking when
% x.^2 - e^-x = 0.25
% will write it like
% x.^2 - e^-x - 0.25
 


clear all

% going to use threshold in our fn so we need to 
% define it as a global variable
 
global threshold
threshold = 0.25;

%% ---- write this in another file called my_fun.m
function output = my_func(var)

% say we are going ot use the global variable
% called threshold
global threshold
            %x1              %x1
output = [(var(1).^2 .*exp(-var(1))-threshold);
          (var(2)^2 .*exp(-var(2))-threshold)];
                    %x2         x2
end

%%
beta = [0.5; 3];

%  @ symbol allows you to call function
intersect =fsolve(@my_func, beta,...
    % so stuff wont print
    optimoptions('fsolve','Display','off'))
    
% look at graph after both to see if its reasonable 

%%

dx = 0.1
x = 0:dx:7;
y = (x).^2 .*exp(-x);

threshold = 0.25;
thresh_line = repmat(threshold, 1, length(x));

figure(1)
plot(x,y,...
     x, thresh_line,...
     intersect(1), threshold,'ro',...
     intersect(2), threshold,'ro'), grid

