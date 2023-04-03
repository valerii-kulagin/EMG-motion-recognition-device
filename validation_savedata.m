function validation_savedata(dataArrays, sub, place, motion)
%sub = subject number
%place = placement number 1-3
%motion = rest, grip, inward,outward (should be lowercase string)
    filename = ['sub' num2str(sub) '_place' num2str(place) '_' motion '.mat'];
%% raw data
    data = dataArrays{1}(:,2); % index out the data coloum only (2nd column)
    save(filename,"data");% save it as mat file
%% collect 6010 samples> 5.05 seconds
    data = data((end-6010):end);
    save([filename(1:end-4), '_crop','.mat'],"data");
end
% call this function in command window to save data after use the app (each
% trial)
%example: validation_savedata(dataArrays, 1, 2, 'rest')
