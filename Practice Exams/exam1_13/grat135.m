function M = grat135(N)
% help file here

f = 4/N;
v = N;
h = N;
M = zeros(v,h);

for v=1:N;
    for h=1:N;
        M(v,h) = cos(3*pi*((f.*v)+(f.*h)));
    end
end

end