% This exercise uses fake data from a natural movie to pracice obtaining an
% STRF using the least mean square analytical solution
%% preliminary stuff: get the directory we're in
% and add the proper subdirectories to the path
cpath = which('directfit_tutorial');
[rootDir, name, ext] = fileparts(cpath);
spath = fullfile(rootDir, 'strflab');
addpath(genpath(spath));
dfpath = fullfile(rootDir, 'direct_fit');
addpath(dfpath);
vpath = fullfile(rootDir, 'validation');
addpath(vpath);
ppath = fullfile(rootDir, 'preprocessing');
addpath(ppath);
dataDir = fullfile(rootDir, '..', 'data'); %contains stim/response pairs
stimsDir = fullfile(dataDir, 'all_stims'); %contains the .wav files

%% load a 20x20x20000 natural movie
load (strcat(dataDir,'/mov.mat'));
% let's only take a part of it 
tlength = 15000;
rawStim = single(mov(1:10,1:10,1:tlength));  % single converts to single precision
rawStim = rawStim - mean(mean(mean(rawStim))); % Subtract mean.

% Exercise 1. Using subplot plot the first 10 images.  Then plot images
% 10, 100, 1000, 10000.  Using these pictures comment on the temporal and spatial correlations.


%% let's create some fake data for a simple cell V1 with a 2D Gabor filter
% First we are going to make a Gabor filter
gparams = [.5 .5 0 5.5 0 .0909 .3 0]';
[gabor, gabor90] = make3dgabor([10 10 1], gparams); 

% Exercise 2. Plot the Gabor filter.


%% Convolve the Gabor filter with the stimulus and add Gaussian noise to get a response with an SNR of 1
SNR = 1;
gabor_vector = reshape(gabor, [10*10 1]);
rawStim_vector = reshape(rawStim, [10*10 tlength]);
resp = dotdelay(gabor_vector, rawStim_vector);
resp_pow = var(resp);
resp = resp + sqrt(resp_pow/SNR)*randn(tlength,1);


%% now we're going to get estimate the gabor using the analytical solution. the stimulus and response
%
% Exercise 3. First cross-correlate the response and the stimulus.  In this case there
% is no time component.


% Plot the cross product and compare to the filter


%% Now calculate the stimulus auto-correlation and image it. What do you see?


%% Now normalize the cross-correlation by the auto-correlation to recover the filter
% Try first using the matrix division operator


%% Excercise 4. Now we are going to try regularizing.
% Find the solution using PCA regression also called subspace
% regression.  Also display the eigenvectors of the stimulus
% auto-correlation.





% Find the solution using ridge regression look at different values for
% lambda.



