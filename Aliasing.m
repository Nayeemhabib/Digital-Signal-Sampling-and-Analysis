% =======================================================
% Task 2: Undersampling and Aliasing Demonstration
% =======================================================
clear; clc; close all;

% --- Sampling Parameters ---
Fs_values = [8e3, 5e3, 4e3]; % Sampling frequencies to analyze
N = 512;                     % Number of DFT points

% --- Signal Frequencies ---
f1 = 1e3;   % 1 kHz
f2 = 2e3;   % 2 kHz
f3 = 4e3;   % 4 kHz

% Loop over all sampling frequencies
for i = 1:length(Fs_values)
    Fs = Fs_values(i);
    Ts = 1/Fs;
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
    filename = ['spectrum_Fs' num2str(Fs/1000*1000) 'Hz.png']; % e.g., Fs8kHz.png
    saveas(fig, filename);
    close(fig);
    
    disp(['Plot for Fs=' num2str(Fs/1000) ' kHz saved as ' filename]);
end
