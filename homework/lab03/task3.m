[in_t, fs] = audioread ('./Test_music.wav');
smps = 10000;
% fft the input audio 
in_f = fft(in_t, smps);


% plot the input audio's frequency
figure(1);
subplot(2,1,1);
plot(abs(in_f), '.-.');
title("The abs of the audio\'s frequency");
subplot(2,1,2);
plot(angle(in_f), '.-.');
title("The angle of the audio\'s frequency");