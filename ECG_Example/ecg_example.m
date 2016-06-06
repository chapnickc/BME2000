
ecg_wave = fakecg; % this is a function you should download
                    
%%
% see what it looks like
figure(1)
plot(ecg_wave)

%%

t_wave = ecg_wave(125:224);

% in this ex,
% our ventricular repolarization 
% (ie. T wave) lasts about 200 ms
time = 1:2:200;

% let's make it look a little
%more like a real t wave
t_wave = t_wave + 0.03*rand(1, length(t_wave));


%%
figure(1)
plot(time,t_wave,'blue'), grid
axis([0, 205, 0, 0.32])

%
%
%

%% ------ Finding the peak -------
%---------------------------------
%---------------------------------
%
% finding a peak?
threshold = 0.255;
possible_peaks = find(t_wave > threshold);

peak_sub = mean(possible_peaks);
peak_sub = round(peak_sub);

peak_time = time(peak_sub);
peak_value = t_wave(peak_sub);


figure(1)
plot(time,t_wave,'b',...
    peak_time, peak_value,'ro'), grid

axis([0, 205, 0, 0.32])

%% -------------------------------
%---------------------------------
%------------ polyfit() ----------
%---------------------------------

coeffs = polyfit(time,t_wave,2);

t_fit = polyval(coeffs, time);


%figure(1)
%plot(time,t_wave,'b',...
%    time, t_fit,'r'), grid
%axis([0, 205, 0, 0.32])



for order = 1:25 % high order
    coeffs = polyfit(time, t_wave, order);
    t_fit(order,:) = polyval(coeffs, time);
    t_fit_rms(order) = rms(t_wave - t_fit(order,:));
end



%
best_order = find(t_fit_rms == min(t_fit_rms))
best_fit = t_fit(best_order, :);

% Find the ceofficients of this polynomial. 
coeffs = polyfit( time, best_fit, best_order);



% Plot
figure(1)
p = plot(time,t_wave,'blue',...
         time, best_fit, 'black');

p(2).LineWidth = 0.8;
