function [length]=CalculateLength(sx, sy, N)
    tt=(0:N)/N;
    length = 0;
    
    for k = 2:N
        vec = [ppval(sx,tt(k)) - ppval(sx,tt(k-1));ppval(sy,tt(k)) - ppval(sy,tt(k-1))];
        length = length + norm(vec);
    end
    
    length = length / 96;
end