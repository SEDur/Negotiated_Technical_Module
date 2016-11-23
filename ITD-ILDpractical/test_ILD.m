function [responses] = test_ILD    
    
    global LeftClicked; % comes from 'choose'
    global stim TestSoundIsOnRight;
    global toneAmp numTrialsEdit;
    responses=[];
    numTrials=length(stim.toTest);
    for nextStim=1:numTrials   % now test each of the ITDs in turn.
        set(numTrialsEdit,'string',num2str(nextStim))
        %  when debugging uncomment this: %  disp(sprintf('Trial %d of %d stimulus %g', nextStim, numTrials, stim.toTest(nextStim)));
        % Dan wants negative ILDs to be heard on the left.
        % So ILDs should be Right intestity minus Left Intensity
        ILDRight=stim.toTest(nextStim)/2; % separation of left and right ear
        ILDLeft=-ILDRight; % dB
        scaleLeft=10.^(ILDLeft./20);    % amplitude
        scaleRight=10.^(ILDRight./20);
        maxVal=max([abs(scaleLeft),abs(scaleRight)]).*toneAmp; 
        if maxVal > 1,
            warning('sounds may clip!');
        end;
        % here we assume that Matlab plays the first column to the right
        % ear, the second to the left. 
        if stim.frequencies(nextStim) == 1   % 1st frequency
            bitone=[stim.tone1.*scaleRight  ; stim.tone1.*scaleLeft ]';
        else   % 2nd frequency
            bitone=[stim.tone2.*scaleRight  ; stim.tone2.*scaleLeft ]';
        end
        % Factor in test tone to make sure sound matches headphone polarity
        if TestSoundIsOnRight,
            bitone = fliplr(bitone);
        end;
        sound(bitone,stim.fs);    % present sound
        LeftClicked=3;
        while LeftClicked==3, % when the user click, LeftClicked = 0 or LeftClicked=1
            pause(0.4);
        end;
        if LeftClicked==-1, % CANCEL code sent
            responses=[];
            return;
        end;
        pause(0.2);
        responses=[responses LeftClicked];  % collect and save response
      

    end
        
end