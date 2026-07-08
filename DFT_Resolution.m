% =======================================================
% Task 1: Effect of DFT Size on Spectral Resolution
% =======================================================
clear; clc; close all;

% --- Sampling Parameters ---
Fs = 12e3;                        % Sampling frequency (Hz)
Ts = 1/Fs;                        % Sampling interval
N_values = [16, 32, 128, 256, 512]; % DFT points to analyze

% --- Signal Frequencies ---
f1 = 1e3;   % 1 kHz
f2 = 2e3;   % 2 kHz
f3 = 4e3;   % 4 kHz

% Loop over all DFT sizes
for i = 1:length(N_values)
    N = N_values(i);
    t = (0:N-1)*Ts;   % Time vector
    
    % Generate signal: sum of three cosines
    x = 10*cos(2*pi*f1*t) + 6*cos(2*pi*f2*t) + 2*cos(2*pi*f3*t);
    
    % Compute N-point FFT
    X = fft(x, N);
    X_shifted = fftshift(abs(X));   % Shift zero frequency to center
    
    % Frequency vector
    f = (-N/2 : N/2-1)*(Fs/N);
    
    % Plot spectrum
    fig = figure('Visible','off');
    stem(f, X_shifted, 'filled');
    xlabel('Frequency (Hz)');
    ylabel('Magnitude |X(f)|');
    title(['Spectrum of x(t), Fs = ' num2str(Fs/1000) ' kHz, N = ' num2str(N)]);
    grid on;
    
    % Save plot
    filename = ['spectrum_N' num2str(N) '.png'];
    saveas(fig, filename);
    close(fig);
    
    disp(['Plot for N=' num2str(N) ' saved as ' filename]);
end
