%% Without Icing
% see below for notes

N = 600;
M = zeros(N,N);

x_center = 300; y_center = 300;

for row = 1:N
    for col = 1:N
        r = sqrt( (row - x_center)^2 + (col - y_center)^2 );
        if r > (130 - 20*randn(1,1)) & r < (130 + 20*randn(1,1))
            M(row,col) = 2;
        end
    end
end


figure(5)
colormap(gray(2))
image(M)
truesize

%% With Icing

% cell array with available icings
icings = {'lime','raspberry','orange','none'};
% Format your question for the user
question = ['\nWhat kind of icing would you like?\n',...
            '(We have lime, raspberry, orange or, ',...
            'if you would like it plain, say none.)\n\n'];
% Ask the user what color the would like, and put their answer
% in a string.
user_color = lower(input(question, 's'));

% change the icing color depending on their answer
if sum(strcmpi(icings, user_color)) == 0 % checks if the answer is in the 
                                     % available icings
    disp(['Sorry we don''t have that. Please pick something else'])
    user_color = lower(input(question, 's')); % ask them again

% if they didn't pick anything, give them raspberry
elseif isempty(user_color) 
    icing_color = [0.6,0.2,1];
% if we have the icing, change the third level of the color map     
elseif  sum(strcmpi(icings, user_color)) > 0
    switch user_color
        case 'lime'
            icing_color = [0.5,1,0];
        case 'raspberry'
            icing_color = [0.6,0.2,1];
        case 'orange'
            icing_color = [1,0.5,0];
        case 'none'
            icing_color = [1,1,1];
    end
end

icing_map = [0,0,0;... % make the icing map with three levels
            1,1,1;...
            icing_color];
N = 600;
M = zeros(N,N); % make an zeros matrix

x_center = 300; y_center = 300; % center of your donut

for row = 1:N
    for col = 1:N
        % the distance from the center of the donut
        r = sqrt( (row - x_center)^2 + (col - y_center)^2 ); 
        
        % this is what makes it noisy
        if r > (130 - 20*randn(1,1)) & r < (130 + 20*randn(1,1))
            M(row,col) = 2;
            
        % make the icing color the third level of the color map 
        elseif r > (130 - 10*randn(1,1)) & r < (130 + 10*randn(1,1))
            M(row,col) = 3;
        end
        
    end
end


figure(5)
colormap(icing_map)
image(M)
truesize

