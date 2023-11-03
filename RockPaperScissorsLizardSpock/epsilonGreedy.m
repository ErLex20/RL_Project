function At = epsilonGreedy(A, Q, eps)
    
    % with probability epsilon pick a random action
    if rand < eps
        At = randi(A);
    else
        At = find(Q == max(Q), 1, "first");
    end

end