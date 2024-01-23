% Define PID constants
Kp = 1;
Ki = 1;
Kd = 1;

% Initialize previous error and integral of error
previous_error = 0;
integral_error = 0;

% Desired value
U_desired = 1;

% Define nested function for PID controller
function dxdt = pid_controller(t, X)
    % Calculate error
    error = U_desired - X;

    % Proportional term
    P = Kp * error;

    % Integral term
    integral_error = integral_error + error * (t - previous_time);
    I = Ki * integral_error;

    % Derivative term
    D = Kd * (error - previous_error) / (t - previous_time);

    % Update previous error and time
    previous_error = error;
    previous_time = t;

    % PID output
    U = P + I + D;

    % Calculate dxdt using mod_submaDOF6
    dxdt = mod_submaDOF6(t, X, U);
end

% Time span
tspan = [0 10];

% Initial conditions
X0 = [0 0 0 0 0 0];

% Solve ODE using ode45
[t, X] = ode45(@pid_controller, tspan, X0);