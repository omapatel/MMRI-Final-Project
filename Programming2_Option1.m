%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% MMRI – Programming Stream Project
% Programming with MATLAB Project – Option 1

% Name: Om Patel
% MACID: patelo7
% Student #: 400378073
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

X = 2; % approximation to this value of x
h = 0.1; % step-size
N = X/h; % steps required

x = zeros(1,round(N)+1); % used for each function variant
x(1) = 0;

y_euler = zeros(1,round(N)+1); % setup for Euler method
y_euler(1) = 0;

y_runge_kutta = zeros(1,round(N)+1); % setup for Runge-Kutta method
y_runge_kutta(1) = 0;

% The ODE used for this project is the following: y' = 7x + y

for n = 1:round(N) % Euler method loop
    x(n+1) = x(n) + h;
    y_euler(n+1) = y_euler(n) + h*(7*x(n)+y_euler(n));
end

for n = 1:round(N) % Runge-Kutta method loop
    k1 = 7*x(n) + y_runge_kutta(n);
    k2 = 7*(x(n)+h/2) + (y_runge_kutta(n)+h*(k1/2));
    k3 = 7*(x(n)+h/2) + (y_runge_kutta(n)+h*(k2/2));
    k4 = 7*(x(n)+h) + (y_runge_kutta(n)+h*k3);

    y_runge_kutta(n+1) = y_runge_kutta(n) + (h/6)*(k1+2*k2+2*k3+k4);
    x(n+1) = x(n) + h;
end

%%% plotting the functions
yExact = 7.*exp(x)-7.*x-7; % exact function
plot(x,yExact,'r',x,y_euler,'g',x,y_runge_kutta,'b'); % plotting
title('Euler Method and Runge-Kutta Method Compared to Exact Solution'); % figure's title
legend('Exact Solution','Euler Method','Runge-Kutta Method'); % legend
xlabel('x'); ylabel('y'); % and axis labels

%%% percent error calculations completed on word file