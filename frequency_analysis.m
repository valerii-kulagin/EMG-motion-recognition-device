moves = [{'rest'}, {'grip'}, {'inward'}, {'outward'}];
data_ar = [];
count = 1;

for s = 1:12
    for p = 1:3
        for m = 1:4
            name = ['sub', num2str(s), '_place', num2str(p), '_', moves{m}, '_crop.mat'];
            file = load(name);
            data_ar(count, :) = (file.data)';
            count = count + 1;
        end
    end
end


% code works with a matrix of data arranged by subject, placement, with raw
% data placed in rows


% setup arrays to collect median frequences grouped by placement and action from all subjects 

freq_ar_place1_rest_all =[];
freq_ar_place1_grip_all = [];
freq_ar_place1_inward_all = [];
freq_ar_place1_outward_all = [];

freq_ar_place2_rest_all =[];
freq_ar_place2_grip_all = [];
freq_ar_place2_inward_all = [];
freq_ar_place2_outward_all = [];

freq_ar_place3_rest_all =[];
freq_ar_place3_grip_all = [];
freq_ar_place3_inward_all = [];
freq_ar_place3_outward_all = [];

%get the size of the array
[r, c] = size(data_ar);
fs = 6011/5;
%loop to compute median frequency and store it in appropriate arrays
for i = 1:r
    sample = data_ar(i,:);
    rms_value = rms(sample);
    sample = sample/rms_value;
 
    [pxx, f] = pspectrum(sample, fs);
    mask = ceil(length(f)/600*10);
    p = pxx(mask:end);
    ff = f(mask:end);
    
    freq = meanfreq(p, ff);
    
    if mod(i-1,12) == 0
        freq_ar_place1_rest_all = [freq_ar_place1_rest_all freq];
    elseif i>0 && mod(i-2, 12) == 0
        freq_ar_place1_grip_all = [freq_ar_place1_grip_all freq];
    elseif i>0 && mod(i-3, 12) == 0
        freq_ar_place1_inward_all = [freq_ar_place1_inward_all freq];
    elseif i>0 && mod(i-4, 12) == 0
        freq_ar_place1_outward_all = [freq_ar_place1_outward_all freq];

    elseif mod(i-5,12) == 0
        freq_ar_place2_rest_all = [freq_ar_place2_rest_all freq];
    elseif i>0 && mod(i-6, 12) == 0
        freq_ar_place2_grip_all = [freq_ar_place2_grip_all freq];
    elseif i>0 && mod(i-7, 12) == 0
        freq_ar_place2_inward_all = [freq_ar_place2_inward_all freq];
    elseif i>0 && mod(i-8, 12) == 0
        freq_ar_place2_outward_all = [freq_ar_place2_outward_all freq];
    
    elseif mod(i-9, 12) == 0
        freq_ar_place3_rest_all = [freq_ar_place3_rest_all freq];
    elseif i>0 && mod(i-10, 12) == 0
        freq_ar_place3_grip_all = [freq_ar_place3_grip_all freq];
    elseif i>0 && mod(i-11, 12) == 0
        freq_ar_place3_inward_all = [freq_ar_place3_inward_all freq];
    elseif i>0 && mod(i-12, 12) == 0
        freq_ar_place3_outward_all = [freq_ar_place3_outward_all freq];
    end
end



%create x axis
% len = length(freq_ar_place1_rest_all);
% 
% x = [];
% x(1:len) = 1;
% x(len+1:len*2) = 2;
% x(len*2+1:len*3) = 3;
% 
% %plot results
% figure 
% subplot(1,2,1)
% hold on
% %axis([0, 4, 9.55, 9.75])
% scatter(x(1:len), freq_ar_place1_inward_all, Marker='+', MarkerEdgeColor='b')
% scatter(x(len+1:len*2), freq_ar_place2_inward_all, Marker= '+', MarkerEdgeColor='b')
% scatter(x(len*2+1:len*3), freq_ar_place3_inward_all, Marker= '+', MarkerEdgeColor= 'b')
% 
% scatter(x(1:len)+0.2, freq_ar_place1_outward_all, Marker='o', MarkerEdgeColor='g')
% scatter(x(len+1:len*2)+0.2, freq_ar_place2_outward_all, Marker= 'o', MarkerEdgeColor='g')
% scatter(x(len*2+1:len*3)+0.2, freq_ar_place3_outward_all, Marker= 'o', MarkerEdgeColor= 'g')
% 
% scatter(x(1:len)-0.2, freq_ar_place1_rest_all, Marker='diamond', MarkerEdgeColor='c')
% scatter(x(len+1:len*2)-0.2, freq_ar_place2_rest_all, Marker= 'diamond', MarkerEdgeColor='c')
% scatter(x(len*2+1:len*3)-0.2, freq_ar_place3_rest_all, Marker= 'diamond', MarkerEdgeColor= 'c')
% 
% ylabel('median frequency, Hz')
% xticklabels({'placement 1', '', 'placement 2','', 'placement 3'})
% title('inward vs outward')
% legend('inward','','', 'outward', '', '', 'rest')
% axis([0.2,3.8,5,605])
% 
% hold off
% 
% 
% subplot(1,2,2) 
% hold on
% %axis([0, 4, 9.55, 9.75])
% scatter(x(1:len), freq_ar_place1_grip_all, Marker='*', MarkerEdgeColor='r')
% scatter(x(len+1:len*2), freq_ar_place2_grip_all, Marker= '*', MarkerEdgeColor='r')
% scatter(x(len*2+1:len*3), freq_ar_place3_grip_all, Marker= '*', MarkerEdgeColor= 'r')
% 
% scatter(x(1:len)+0.1, freq_ar_place1_inward_all, Marker='+', MarkerEdgeColor='b')
% scatter(x(len+1:len*2)+0.2, freq_ar_place2_inward_all, Marker= '+', MarkerEdgeColor='b')
% scatter(x(len*2+1:len*3)+0.2, freq_ar_place3_inward_all, Marker= '+', MarkerEdgeColor= 'b')
% 
% scatter(x(1:len)-0.2, freq_ar_place1_rest_all, Marker='diamond', MarkerEdgeColor='c')
% scatter(x(len+1:len*2)-0.2, freq_ar_place2_rest_all, Marker= 'diamond', MarkerEdgeColor='c')
% scatter(x(len*2+1:len*3)-0.2, freq_ar_place3_rest_all, Marker= 'diamond', MarkerEdgeColor= 'c')
% 
% ylabel('median frequency, Hz')
% xticklabels({'placement 1','', 'placement 2','', 'placement 3'})
% title('grip vs inward')
% legend('grip','','', 'inward', '', '', 'rest')
% axis([0.2,3.8,5,605])
% hold off

filename = 'excel_stat_new';

A = [freq_ar_place1_rest_all', freq_ar_place1_grip_all', freq_ar_place1_inward_all', freq_ar_place1_outward_all'];
B = [freq_ar_place2_rest_all', freq_ar_place2_grip_all',  freq_ar_place2_inward_all', freq_ar_place2_outward_all'];
C = [freq_ar_place3_rest_all',  freq_ar_place3_grip_all', freq_ar_place3_inward_all', freq_ar_place3_outward_all'];

xlswrite(filename, A, 1)
xlswrite(filename, B, 2)
xlswrite(filename, C, 3)






