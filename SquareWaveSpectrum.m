% =======================================================
% Task 3: Spectrum of a Square Wave
% =======================================================
clear; clc; close all;

% --- Signal Parameters ---
Fs = 20000;           % Sampling frequency in Hz
f_fund = 1000;        % Fundamental frequency of square wave in Hz
N = 256;              % Number of DFT points

% --- Time vector ---
t = (0:N-1)/Fs;

% --- Generate square wave ---
x = square(2*pi*f_fund*t);

% --- Compute FFT and normalize ---
X = fft(x, N);
X_shifted = fftshift(abs(X)/N);    % Magnitude spectrum
f_axis = (-N/2:N/2-1)*(Fs/N);     % Frequency axis centered at zero

% --- Plot frequency spectrum ---
fig = figure('Visible','off');
plot(f_axis, X_shifted, 'LineWidth', 1.5);
xlabel('Frequency (Hz)');
ylabel('|X(f)| / N');
title(['Magnitude Spectrum of Square Wave (Fs = ' num2str(Fs/1000) ' kHz, N = ' num2str(N) ')']);
grid on;
xlim([-10000 10000]); % Focus on first few harmonics

% --- Save plot ---
saveas(fig, 'spectrum_square_wave.png');
disp('Plot saved as spectrum_square_wave.png');
