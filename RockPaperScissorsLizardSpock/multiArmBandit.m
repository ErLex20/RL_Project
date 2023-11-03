function [score, N, Q, qstar, mR] = multiArmBandit(A, epochs, eps, c, alpha, beta, method, mode, enemy)
    
    % estimate of the value of actions
    Q = randn(A, 1);
    
    % number of times an actions has been taken
    N = zeros(A, 1);
    
    % preferences
    H = zeros(A, 1);

    % final score
    score = 0;
    
    % mean reward
    mR = 0;

    % initialize data in function of enemy's policy
    [qstar, mu, sigma] = initializeEnemy(A, enemy);
    
    % counter for iterations
    counter = 1;
    
    while counter < epochs

        % action
        if (strcmp(method, "epsilonGreedy"))
            At = epsilonGreedy(A, Q, eps);
        elseif (strcmp(method, "preferenceUpdates"))
            At = preferenceUpdates(H);
        elseif (strcmp(method, "upperConfidenceBound"))
            At = upperConfidenceBound(Q, N, c, counter);
        end
    
        % get reward
        reward = getReward(At, A, enemy, mu, sigma);
        Rt = qstar(At) + reward;
    
        % update score
        score = score + reward;
    
        % update estimates of Q
        N(At) = N(At) + 1;
        if (strcmp(mode, "diminishing"))
            Q(At) = Q(At) + 1/N(At)*(Rt - Q(At));
            mR = mR + 1/counter*(Rt - mR);
        elseif (strcmp(mode, "constant"))
            Q(At) = Q(At) + alpha*(Rt - Q(At));
            mR = mR + beta*(Rt - mR);
        end

        % update preferences if the method chosen is preferenceUpdates
        if (strcmp(method, "preferenceUpdates"))
            pi = softmax(H);
            H(At) = H(At) + alpha*(Rt - mR)*(1 - pi(At));
            for a = 1:A
                if a ~= At
                    H(a) = H(a) - alpha*(Rt - mR)*pi(a);
                end
            end
        end
    
        % increment counter
        counter = counter + 1;
    
    end
end