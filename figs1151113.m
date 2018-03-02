% produce figures 11.5 through 11.13
clear all; close all; clc
win = hamming(19);
[theta,patternr,patterng] = linear_array(19, 0.5, 0, -1, -1, -3);
figure(5)
plot(theta, patterng,'linewidth',1.5)
xlabel('Steering angle in degrees'); ylabel('Antenna gain pattern in dB')
title('N = 19; d = 0.5\lambda; \theta = 0 degrees; Perfect phase shifters')
grid on; axis tight
[theta, patternr, patterng] = linear_array(19, 0.5, 0, 1, win, -3);
figure(6)
plot(theta, patterng,'linewidth',1.5)
xlabel('Steering angle - degrees')
ylabel('Antenna gain pattern - dB')
title('N = 19; d = 0.5\lambda; \theta = 0 degrees; Perfect phase shifters; Hamming window')
grid on; axis tight
[theta, patternr, patterng] = linear_array(19, 0.5, -15, -1, -1, 3);
figure(7)
plot(theta, patterng,'linewidth',1.5)
xlabel('Steering angle in degrees'); ylabel('Antenna gain pattern in dB')
title('N = 19; d = 0.5\lambda; \theta = -15 degrees; 3-bits phase shifters')
grid on; axis tight
[theta, patternr, patterng] = linear_array(19, 0.5, 5, 1, win, 3);
figure(8)
plot(theta, patterng,'linewidth',1.5)
xlabel('Steering angle - degrees')
ylabel('Antenna gain pattern - dB')
title('N = 19; d = 0.5\lambda; \theta = 5 degrees; 3-bits phase shifters; Hamming window')
grid on; axis tight
[theta, patternr, patterng] = linear_array(19, 0.5, 25, 1, win, 3);
figure(9)
plot(theta, patterng,'linewidth',1.5)
xlabel('Steering angle in degrees')
ylabel('Antenna gain pattern - dB')
title('N = 19; d = 0.5\lambda; \theta = 25 degrees; 3-bits phase shifters; Hamming window')
grid on; axis tight
[theta, patternr, patterng] = linear_array(19, 1.5, 48, -1, -1, -3);
figure(10)
plot(theta, patterng,'linewidth',1.5)
xlabel('Steering angle in degrees'); ylabel('Antenna gain pattern in dB')
title('N = 19; d = 1.5\lambda; \theta = 48 degrees; Perfect phase shifters')
grid on; axis tight
[theta, patternr, patterng] = linear_array(19, 1.5, 48, 1, win, -3);
figure(11)
plot(theta, patterng,'linewidth',1.5)
xlabel('Steering angle in degrees'); ylabel('Antenna gain pattern in dB')
title('N = 19; d = 1.5\lambda; \theta = 48 degrees; Perfect phase shifters; Hamming window')
grid on; axis tight
[theta, patternr, patterng] = linear_array(19, 1.5, -53, -1, -1, 3);
figure(12)
plot(theta, patterng,'linewidth',1.5)
xlabel('Steering angle in degrees'); ylabel('Antenna gain pattern in dB')
title('N = 19; d = 1.5\lambda; \theta = -53 degrees; 3-bits phase shifters')
grid on; axis tight
[theta, patternr, patterng] = linear_array(19, 1.5, -33, 1, win, 3);
figure(13)
plot(theta, patterng,'linewidth',1.5)
xlabel('Steering angle in degrees')
ylabel('Antenna gain pattern - dB')
title('N = 19; d = 1.5\lambda; \theta = -33 degrees; 3-bits phase shifters; Hamming window')
grid on;
axis tight