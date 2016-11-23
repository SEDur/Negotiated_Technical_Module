function [toTest,frequencies,toneWindowed,toneWindowedbis] = initialisation(freq1,freq2,stimValues,numRepeats)
        
    global fs;
    
    toneAmp=0.5;
    toTest=[];
    frequencies=[];
    
    for ii=1:numRepeats, toTest=[toTest stimValues]; end;   % insert values to be tested in a matrix, size(matrix)=numel(stimValues)*numRepeats
    frequencies=[zeros(size(toTest)) ones(size(toTest))];   % 1->1st frequency and 0->2nd frequency, size(frequencies)=2*size(matrix)
    toTest=[toTest toTest]; % numel(stimValues)*numRepeats values for each frequencies
    mixMatrix=randperm(length(toTest));  % shuffle
    toTest=toTest(mixMatrix);  % random values
    frequencies=frequencies(mixMatrix); % random frequencies
    
    fs=48000;   % sample frequency
    duration = 0.4; % seconds
    numSamples=round(fs*duration);
    time=(1:numSamples)/fs;
    tone=sin(2*pi*freq1*time)*toneAmp;  % pure tone
    tonebis=sin(2*pi*freq2*time)*toneAmp;
    toneWindowed=tone.*hanning(length(tone))';  % hamming window
    toneWindowedbis=tonebis.*hanning(length(tonebis))';
    
end