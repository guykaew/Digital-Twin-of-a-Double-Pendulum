function [timediffarray] = CalcTimeDiff(data)
timediffarray = [];
for i = 1:10
        time_field = ['Time_' num2str(i)];
        if any(isnan(data.(time_field)))
            time_values = data.(time_field)(~isnan(data.(time_field)));
        else
            time_values = data.(time_field);
        end
        time_diffs = diff(time_values);
        timediffarray{i} = [time_diffs];
        
end

end