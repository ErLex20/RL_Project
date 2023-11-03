function [qstar, mu, sigma] = initializeEnemy(A, enemy)

    % real value of actions
    switch enemy
        case "uniform"
            qstar = ones(A, 1)/A;
            fprintf("Enemy's policy is uniform\n");
        case "gaussian"
            mu = randi([1 A]);
            sigma = rand();
            if (mu == 1)
                qstar = [0; 1; -1; 1; -1];
            elseif (mu == 2)
                qstar = [-1; 0; 1; -1; 1];
            elseif (mu == 3)
                qstar = [1; -1; 0; 1; -1];
            elseif (mu == 4)
                qstar = [-1; 1; -1; 0; 1];
            elseif (mu == 5)
                qstar = [1; -1; 1; -1; 0];
            end
            fprintf("Enemy's policy is a gaussian with μ = %d and σ = %f\n", mu, sigma);
        case "constant1"
            qstar = [0; 1; -1; 1; -1];
            fprintf("Enemy's policy is always 1\n");
        case "constant2"
            qstar = [-1; 0; 1; -1; 1];
            fprintf("Enemy's policy is always 2\n");
        case "constant3"
            qstar = [1; -1; 0; 1; -1];
            fprintf("Enemy's policy is always 3\n");
        case "constant4"
            qstar = [-1; 1; -1; 0; 1];
            fprintf("Enemy's policy is always 4\n");
        case "constant5"
            qstar = [1; -1; 1; -1; 0];
            fprintf("Enemy's policy is always 5\n");
        otherwise
            error("Enemy's policy not valid");
    end

end