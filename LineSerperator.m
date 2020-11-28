function [YLines] = LineSerperator(CarrierLine)
    close all;
    clc;
  
    Filter = [1];
    CarrierLineImage = conv2(CarrierLine,Filter);
    CarrierLineImage = abs(CarrierLineImage);
    Acc = sum(CarrierLineImage>0,2);
    
    Acc = Acc > (max(Acc) - 10);
    bar(Acc);
    YLines = FindLines(Acc);
    imshow(CarrierLineImage);
    waitforbuttonpress;
    for i=1:10
        hold on;
        plot([1,100],[YLines(i),YLines(i)]);
    end %help regionprops
end