% =======================================================
% Task 4: Signal Interpolation by Upsampling
% =======================================================
clear; clc; close all;

%% --- Parameters ---
Fs1 = 12000;        % Original sampling rate (Hz)
Fs2 = 24000;        % Target sampling rate after upsampling
Fc  = 6000;         % Low-pass filter cutoff frequency (Hz)
t   = 0:1/Fs1:0.01; % Time vector (0 to 10 ms)

%% --- Step 1: Original Bandlimited Signal ---
x = 10*cos(2*pi*1000*t) + 6*cos(2*pi*2000*t) + 2*cos(2*pi*4000*t);

fig1 = figure('Visible','off');
plot(t, x, 'LineWidth', 1.5);
xlabel('Time (s)');
ylabel('x(t)');
title('Original Signal (Time Domain)');
grid on;
saveas(fig1, 'original_signal.png');

%% --- Step 2: Upsample (Insert zeros, L = 2) ---
x_upsample = upsample(x, 2);
t_upsample = 0:1/Fs2:(length(x_upsample)-1)/Fs2;

fig2 = figure('Visible','off');
stem(t_upsample, x_upsample, 'filled');
xlabel('Time (s)');
ylabel('x_{upsample}(t)');
title('Upsampled Signal (Zero-Inserted)');
grid on;
saveas(fig2, 'upsampled_signal.png');

%% --- Step 3: Apply Butterworth Low-Pass Filter ---
[b, a] = butter(2, Fc/(Fs2/2));  % 2nd-order LPF
x_interp = filter(b, a, x_upsample);

fig3 = figure('Visible','off');
plot(t_upsample, x_interp, 'LineWidth', 1.5);
xlabel('Time (s)');
ylabel('x_{interp}(t)');
title('Interpolated Signal (After LPF)');
grid on;
saveas(fig3, 'interpolated_signal.png');

%% --- Step 4: Frequency Spectrum of Upsampled Signal ---
N_fft = length(x_upsample);
f_axis = Fs2*(0:N_fft-1)/N_fft;

X_upsample = abs(fft(x_upsample, N_fft));
fig4 = figure('Visible','off');
plot(f_axis, X_upsample, 'LineWidth', 1.5);
xlabel('Frequency (Hz)');
ylabel('|X_{upsample}(f)|');
title('Frequency Spectrum of Upsampled Signal');
xlim([0 Fs2/2]); grid on;
saveas(fig4, 'spectrum_upsample.png');

%% --- Step 5: Frequency Spectrum of Interpolated Signal ---
X_interp = abs(fft(x_interp, N_fft));
fig5 = figure('Visible','off');
plot(f_axis, X_interp, 'LineWidth', 1.5);
xlabel('Frequency (Hz)');
ylabel('|X_{interp}(f)|');
title('Frequency Spectrum After Interpolation (Butterworth)');
xlim([0 Fs2/2]); grid on;
saveas(fig5, 'spectrum_interpolated.png');

disp('All plots saved successfully!');
