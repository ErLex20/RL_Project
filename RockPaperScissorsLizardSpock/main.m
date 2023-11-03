clc
clear
close all

rng("shuffle");

% number of actions (rock, paper, scissors, spock, lizard)
A = 5;
actions = ["Rock", "Paper", "Scissors", "Spock", "Lizard"];

% methods (epsilonGreedy, preferenceUpdates, upperConfidenceBound)
method = "upperConfidenceBound";

% mode (diminishing, constant)
mode = "diminishing";

% enemy's actions (uniform, gaussian, constant1, constant2, constant3, constant4, constant5)
enemy = "gaussian";

% parameters
eps = 0.1;
c = 1;
alpha = 0.2;
beta = 0.1;

% set number of iterations
epochs = 1e6;

% play the game
[score, N, Q, qstar, mR] = multiArmBandit(A, epochs, eps, c, alpha, beta, method, mode, enemy);

%% Plots

fprintf("Final score: %d\n", score);

fprintf("Mean reward: %f\n", mR);

figure(1)
stem(N, "o", "MarkerSize", 12)
title("Action frequency distribution");
xlabel("Actions");
ylabel("Frequency of action");
for i = 1:numel(N)
    text(i, N(i), actions(i), "VerticalAlignment", "bottom", "HorizontalAlignment", "center");
end
grid on;

figure(2)
plot(qstar)
hold on;
plot(Q);
hold off;
title("Comparison between real values and estimated values of actions");
xlabel("Actions");
ylabel("Values");
legend("q*", "Q");
grid on;
