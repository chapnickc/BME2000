function number = DayOfYear(year, month, day)

days = [31,28,31,30,31,30,31,31,30,31,30,31];

if rem(abs(year-2000), 4) == 0 
    days(2) = 29;
end

if rem(year, 400) ~= 0 & rem(year, 100) ==0
    days(2) = 28; % there is a better way to do this, but this works
		  % with this I essentially change the number of days
		  % in february back to 28 if it meets the condition
end

number = sum(days(1:month-1)) + day;

if day > 31 | day <= 0 | month > 12 | month <= 0 % '|' is a logial 'or'
% Initially, I also added
%isfloat(year) == 0 | isfloat(month) == 0|isfloat(day) == 0
% This essential just checks if the arguments to the function
% are numbers 

number = 0;
end
end

