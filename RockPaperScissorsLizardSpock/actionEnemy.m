function At_enemy = actionEnemy(A, enemy, mu, sigma)
    
    % enemy's action
    switch enemy
        case "uniform"
            At_enemy = randi([1 A]);
        case "gaussian"
            lower_limit = 1;
            upper_limit = 5;
            random_number = round(normrnd(mu, sigma));
            At_enemy = max(min(random_number, upper_limit), lower_limit);
        case "constant1"
            At_enemy = 1;
        case "constant2"
            At_enemy = 2;
        case "constant3"
            At_enemy = 3;
        case "constant4"
            At_enemy = 4;
        case "constant5"
            At_enemy = 5;
        otherwise
            error("Enemy's policy not valid");
    end

end