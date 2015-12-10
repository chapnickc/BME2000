clear all
close all
%%
t = 0:0.1:10;
xvalues = [2,4,6,8,10];
vvalues = [6:4.6667:28];

figure('units','normalized','position',[0.01, 0.5, 0.5, .4])
h = [animatedline('Color', [1, 0.54902, 0], 'Marker','o','MarkerFaceColor','k');
    animatedline('Color', [0.196078, 0.803922, 0.196078], 'Marker','o','MarkerFaceColor','k');
    animatedline('Color', [0, 0.74902, 1], 'Marker','o','MarkerFaceColor','k');
    animatedline('Color', [0.545098, 0, 0.545098], 'Marker','o','MarkerFaceColor','k');
    animatedline('Color', [1, 0.270588, 0], 'Marker','o','MarkerFaceColor','k')]
axis([-0.2, 6, -1, 45]), grid on
ylabel('Position (m)'), xlabel('Time (seconds)')
title('The Great Pumpkin Launches')

% Their positions vs. time
for k=1:length(xvalues)
    
    x_o =  xvalues(k); %m 
    v_o = vvalues(k); %m/s
    a = -9.81;

    x = x_o + v_o.*t + 0.5*a*t.^2;
    
    for i = 1:length(x)
        if x(i) >= 0
            addpoints(h(k),t(i), x(i))
            drawnow
            pause(0.02)
        end
    end
end

%% Now their velocities 

figure('units','normalized','position',[0.01, 0, 0.5, .4])
j = [animatedline('Color', [1, 0.54902, 0], 'Marker','o','MarkerFaceColor','k');
    animatedline('Color', [0.196078, 0.803922, 0.196078], 'Marker','o','MarkerFaceColor','k');
    animatedline('Color', [0, 0.74902, 1], 'Marker','o','MarkerFaceColor','k');
    animatedline('Color', [0.545098, 0, 0.545098], 'Marker','o','MarkerFaceColor','k');
    animatedline('Color', [1, 0.270588, 0], 'Marker','o','MarkerFaceColor','k')]
axis([-0.2, 10, -30, 30]), grid on
ylabel('Velocity (m/s)'), xlabel('Time (seconds)')
title('The Great Pumpkin Velocities')

for k=1:length(xvalues)
    
    x_o =  xvalues(k); %m 
    v_o = vvalues(k); %m/s
    a = -9.81;

    x = x_o + v_o.*t + 0.5*a*t.^2;
    coefs = [-4.905, v_o, x_o];

    velocity = polyder(coefs);
    dxdt = velocity(1)*t + velocity(2);
    
    for i = 1:length(x)
        
        addpoints(j(k), t(i), dxdt(i))
        drawnow
        pause(0.02)

    end
end
