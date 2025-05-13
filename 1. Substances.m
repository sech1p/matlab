% Substances.m - analyze substances interaction and their toxicity
%
% Doses got from PsychonautWiki
%
% Half life time got from National Institutes of Health (NIH) for 3-MMC
% and from Wikipedia for Ketamine
%
% This script has been created for research and educational purposes only 
% Datas are example, this chart might be inaccurated
% as part of my Matlab learning, don't accurate strict on this script
% as it's is inappropiate
% DON'T TRY THIS AT HOME
%
% Created by sech1p on May 13, 2025
%

% Prompt which gathers dose of substances from user
prompt = {'Provide a dose of substance A (mg):', 'Provide a dose of substance B (mg):'};
title = 'Provide substance dosages';
dims = [1 35];
defaultValues = {'60', '75'}; % 60 mg is maximal common dosage for 3-MMC and 75 mg is maximal common dosage for Ketamine
answer = inputdlg(prompt, title, dims, defaultValues);

time = 0:0.1:24; % Time in hours
doseA = str2double(answer{1}); % Dosing of substance A (mg)
doseB = str2double(answer{2}); % Dosing of substance B (mg)

% Prompt which gathers half life time of substances from user
prompt = {'Provide a half life for substance A:', 'Provide a half life for substance B:'};
title = 'Provide half life of dosages';
dims = [1 35];
defaultValues = {'0.83', '2.5'}; % Example half life of substances, 0.83 hour for 3-MMC and 2.5 hours for Ketamine.
answer = inputdlg(prompt, title, dims, defaultValues);

halflifeA = str2double(answer{1}); % Half life time of substance A
halflifeB = str2double(answer{2}); % Half life time of substance B

% Prompt which gathering name of substances from user
prompt = {'Provide a name for substance A:', 'Provide a name for substance B:'};
title = 'Provide substance names';
defaultValues = {'4-CMC', 'Ketamine'};
answer = inputdlg(prompt, title, dims, defaultValues);

% Names of substances
substanceA = answer{1};
substanceB = answer{2};

% Elimination time speed
eliminationTimeA = log(2) / halflifeA;
eliminationTimeB = log(2) / halflifeB;

% In-blood substance concentracion
concentrationA = doseA * exp(-eliminationTimeA * time);
concentrationB = doseB * exp(-eliminationTimeB * time);

% Potential interaction (sum of toxicity)
interaction = concentrationA + 1.5 * concentrationB;

% Chart
plot(time, concentrationA, 'r', time, concentrationB, 'b', time, interaction, 'k--');
legend(substanceA, substanceB, 'Interaction');
xlabel('Time [h]');
ylabel('Concentration / Interaction');
grid on;
waitfor(gcf);
