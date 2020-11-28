function [YLines] = FindLines(Acc)
    close all;
    clc;

    Lines = find(Acc);
    YLines = zeros(10,1);
    Counter = 1;
    
    for i = 2:length(Lines)
        if (Lines(i) - Lines(i-1)) > 2
            YLines(Counter) = Lines(i-1);
            Counter = Counter + 1;
        end
    end
    YLines(Counter) = Lines(length(Lines));
end
