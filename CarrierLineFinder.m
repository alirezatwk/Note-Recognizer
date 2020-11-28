function [CarrierLines] = CarrierLineFinder()
    close all;
    clc;
    
    %Variable Definition
    i = 0;
    Noise = 0.5;
    BlurDegree = 3;
    Location = 'Note.jpg';
    CarrierLines = cell(1,4);
    Counter = 1;
    %Image Call

    
    PicBlur = CallImage(Location,Noise);
    PicMain = 1 - double(imread(Location))/255;
    PicMain = (mean(PicMain,3));
    

    %Edge detection
    PicBlur = Blur(PicBlur,BlurDegree);
    
    %Process
    while(size(PicBlur,1) > 1)
        Acc = sum(PicBlur,2);
        Acc=conv(Acc,ones(1,20)/20,'same');
        Acc2 = find(Acc < 50);
        Acc3 = find(Acc > 50);
        FileName = ['CarrierLines/CarrierLine' num2str(i/2) '.png'];
        if (size(PicBlur,1) > 30)
        if  (mod(i,2))
            PicBlur = PicBlur((Acc3(1)+1):end,:);
            PicMain = PicMain((Acc3(1)+1):end,:);
        else 
            Cropped = PicMain(1:(Acc2(1)+1),:);
            if (size(Cropped,1) > 150) 
                CarrierLines{Counter} = Cropped;
                imwrite(Cropped,FileName,'png');
                Counter = Counter + 1;
            end
            PicBlur = PicBlur((Acc2(1)+1):end,:);
            PicMain = PicMain((Acc2(1)+1):end,:);
        end
        else
            return;
        end
        imshow(PicBlur);
        i = i + 1;
        drawnow;
    end
end

function [FilterPic] = Blur(Pic,Filter)
    Filt = ones(Filter) / Filter * Filter; 
    FilterPic = conv2(Pic,Filt);
end

function [Answer] = CallImage (location,Noise)
    Answer = 1 - double(imread(location))/255;
    Answer = (mean(Answer,3));
    Answer = double (Answer >= Noise);
end