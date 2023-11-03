function [reward] = getReward(At, A, enemy, mu, sigma)

    % get enemy's action
    At_enemy = actionEnemy(A, enemy, mu, sigma);

    % apply rule of game
    switch At
        case 1
            if (At_enemy == 2 || At_enemy == 4)
                reward = -1;
            elseif (At_enemy == At)
                reward = 0;
            else
                reward = +1;
            end
        case 2
            if (At_enemy == 3 || At_enemy == 5)
                reward = -1;
            elseif (At_enemy == At)
                reward = 0;
            else
                reward = +1;
            end
        case 3
            if (At_enemy == 1 || At_enemy == 4)
                reward = -1;
            elseif (At_enemy == At)
                reward = 0;
            else
                reward = +1;
            end
        case 4
            if (At_enemy == 2 || At_enemy == 5)
                reward = -1;
            elseif (At_enemy == At)
                reward = 0;
            else
                reward = +1;
            end
        case 5
            if (At_enemy == 1 || At_enemy == 3)
                reward = -1;
            elseif (At_enemy == At)
                reward = 0;
            else
                reward = +1;
            end
        otherwise
            error("Action not valid");
    end

end