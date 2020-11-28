function Show(Input)
for i = 1:numel(Input)
    imshow(Input{i});
    waitforbuttonpress;
end
end