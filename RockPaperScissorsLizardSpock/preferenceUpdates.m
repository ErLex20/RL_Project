function At = preferenceUpdates(H)

    % compute distribution
    pref = softmax(H);
    
    % compute cumulative sum
    cum_pref = cumsum(pref);
    
    % extract action according to given probability
    At = find(rand < cum_pref, 1, "first");

end