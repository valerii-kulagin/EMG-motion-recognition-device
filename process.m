sub = 3:4;
place = 1:3;
motion = [{'rest'}, {'grip'}, {'inward'}, {'outward'}];
process_data(sub, place, motion)
process_data_crop(sub, place, motion)

function process_data(subs, places, motions)
%sub = subject number
%place = placement number 1-3
%motion = rest, grip, inward,outward (should be lowercase string)
    for i = 1:2
        for j = 1:3
            for k = 1:4

                filename = ['sub' num2str(subs(i)) '_place' num2str(places(j)) '_' motions{k} '.mat'];
                load(filename)
                data = data*1023/5;
                save([filename(1:end-4), '_fix','.mat'],"data");

            end
        end
    end
    
end


function process_data_crop(subs, places, motions)
%sub = subject number
%place = placement number 1-3
%motion = rest, grip, inward,outward (should be lowercase string)
    for i = 1:2
        for j = 1:3
            for k = 1:4

                filename2 = ['sub' num2str(subs(i)) '_place' num2str(places(j)) '_' motions{k} '_crop' '.mat'];
                load(filename2)
                data = data(end-6011, end);
                save([filename2],"data");

            end
        end
    end
    
end
