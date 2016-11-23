function [responses] = test_ITD     

    global LeftClicked numTrialsEdit stim TestSoundIsOnRight;
    
    responses=[];
    
    numTrials=length(stim.toTest);
    for nextStim=1:numTrials   % now test each of the ITDs in turn.
%        disp(sprintf('trial %d of %d, presenting ITD %g',nextStim,numel(stim.toTest),stim.toTest(nextStim)));
        set(numTrialsEdit,'string',num2str(nextStim))
        if stim.frequencies(nextStim) == 1   
            nextTone=stim.tone1; % 1st frequency
        else
            nextTone=stim.tone2; % 2nd frequency
        end;
        delayTaps=round(stim.fs/1000*stim.toTest(nextStim));
        if delayTaps<0, delayTaps=-delayTaps; end;
        silence=zeros(1,delayTaps);
        % here we assume that Matlab plays the first column to the right
        % ear, the second to the left. That seems to be the case on my
        % windows laptop. Dan also wants negative ITDs to be associated
        % with left sounds. So values must reflect Right - Left, or first
        % column minus 2nd column.
        if stim.toTest(nextStim) < 0,
            % ITD value is negative. Left ear should be leading.
            % That means right ear (first column) must be delayed
            bitone=[[silence nextTone]; [nextTone silence]]';
        else
            % ITD positive. Second column must be delayed
            bitone=[[nextTone silence]; [silence nextTone]]';
        end;
        % Factor in test tone to make sure sound matches headphone polarity
        if TestSoundIsOnRight,
            bitone = fliplr(bitone);
        end;
        sound(bitone,stim.fs);    % present sound
        LeftClicked=3;
        while LeftClicked==3, % LeftClicked is set to 0 or 1 by choose.m when user makes choice.
            pause(0.4);
        end;
        if LeftClicked==-1, % CANCEL code sent
            responses=[];
            return;
        end;
        pause(0.2);
        responses=[responses LeftClicked];   % collect and save response     
    end 
end