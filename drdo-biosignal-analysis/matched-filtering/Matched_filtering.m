function [output]=Matched_filtering(signal)
    
% Specify the waveform.
hwav = phased.LinearFMWaveform('PulseWidth',1e-4,'PRF',5e3,...
    'SampleRate',256,'OutputFormat','Pulses','NumPulses',1,...
    'SweepBandwidth',1e5);
w = getMatchedFilter(hwav);
% Create a matched filter with no spectrum weighting, and a
% matched filter that uses a Taylor window for spectrum
% weighting.
hmf = phased.MatchedFilter('Coefficients',w,'SpectrumWindow','Hamming');
output = step(hmf,signal);
end