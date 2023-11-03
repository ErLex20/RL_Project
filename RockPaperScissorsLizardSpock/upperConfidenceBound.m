function At = upperConfidenceBound(Q, N, c, counter)

    % define new value function
    Qmod = Q + c.*sqrt(counter./(1+N));
    
    % take action that maximize Qmod
    At = find(Qmod == max(Qmod), 1, "first");

end