# Digital-Signal-Sampling-and-Analysis.
## Project Overview.
This project demonstrates core concepts of Digital Signal Processing (DSP) through MATLAB simulations. It focuses on the analysis, reconstruction, and spectral characteristics of discrete-time signals.
The main objectives of this project are:-
1. To explore the impact of DFT size on spectral resolution
2. To study aliasing caused by undersampling
3. To analyze the frequency spectrum of complex signals, such as square waves
4. To understand signal interpolation and upsampling
Through this project, users gain hands-on experience with practical DSP tasks while reinforcing theoretical knowledge.
## Theoretical Background.
### Sampling and the Nyquist-Shannon Theorem:-
- A continuous-time signal can be perfectly reconstructed if sampled at a rate at least twice the highest frequency component (Nyquist rate).
- Under-sampling (< 2B) leads to aliasing, where high-frequency components fold back into the lower frequency range.
- Sampling theory is fundamental for digital communication, audio/video processing, and modern electronics.
### Discrete Fourier Transform (DFT):-
- The DFT converts a finite-duration discrete signal from the time domain to the frequency domain.
- DFT size (N):-
  - Small N → poor resolution, broad peaks, high spectral leakage.
  - Large N → sharp peaks, better resolution, reduced leakage.
 - Used in spectrum analysis, filter design, and signal diagnostics.
### Aliasing:-
- Occurs when the sampling frequency is below the Nyquist rate.
- High-frequency components appear as spurious low-frequency signals, making reconstruction impossible.
- Critical in digital audio, communications, and sensor signal processing.
## Fourier Series and Non-Sinusoidal Signals:-
- Complex periodic signals (e.g., square waves) can be decomposed into sum of sinusoids (Fourier series).
- Square waves contain odd harmonics of the fundamental frequency with amplitudes decreasing inversely with harmonic number.
- Understanding harmonic content is key for signal compression, harmonic distortion analysis, and waveform synthesis.
##  Interpolation / Upsampling:-
- Upsampling increases the sampling rate of a discrete signal to create a higher-resolution representation.
- Steps:-
  - Zero-padding: Insert zeros between samples.
  - Low-pass filtering: Remove spectral images, reconstruct smooth signal.
  - Applications: audio resampling, image resizing, digital communications, and anti-aliasing.
# Experiments & Key Observations.
## Effect of DFT Size on Spectral Resolution
- Observation:-
  - N = 16 → coarse spectrum, peaks broad and less distinct.
  - N = 32 → better, peaks more visible.
  - N = 128, 256, 512 → sharp peaks at 1 kHz, 2 kHz, 4 kHz.
- Insights:-
  - Increasing N → improves frequency resolution.
  - Larger DFT reduces spectral leakage and helps identify closely spaced frequency components.
  - Shows the trade-off between computational cost and spectral accuracy.
## Aliasing Due to Undersampling
- Observation:-
  - Fs = 8 kHz → minor distortion at 4 kHz component.
  - Fs = 5 kHz → 4 kHz aliases to 1 kHz, amplitude distortion observed.
  - Fs = 4 kHz → severe aliasing, higher frequency components misrepresente.
- Insights:-
  - Demonstrates the importance of Nyquist criterion in practical DSP.
  - Highlights how undersampling can lead to irreversible data loss.
  - Real-world relevance in audio recording, communications, and instrumentation.
##  Spectrum of a Square Wave:-
- Observation:-
 - Frequency spectrum contains only odd harmonics (1 kHz, 3 kHz, 5 kHz…)
 - Harmonics’ amplitude decreases inversely with harmonic order
 - Fundamental frequency dominates, higher-order harmonics gradually fade
- Insights:
 - Confirms Fourier series decomposition for periodic, non-sinusoidal signals.
 - Useful for harmonic distortion analysis, filter design, and waveform synthesis.
 - Visualizes spectral energy distribution in complex signals.
## Signal Interpolation (Upsampling).
- Observation:
 - Interpolated signal closely matches a directly sampled high-rate signal.
 - Zero-padding + low-pass filtering removes spectral replicas.
 - Smooth reconstructed waveform observed in time domain.
- Insights:-
 - Illustrates practical upsampling technique for signal reconstruction.
 - Shows how interpolation maintains signal integrity while increasing sample rate.
 - Applied in digital audio/video, communications, and sensor data processing.
 - Highlights the effect of Butterworth low-pass filter in eliminating unwanted spectral images.
## Code Structure:-
 ├── DFT_Resolution.m             # Analyze effect of DFT size on spectrum
 ├── Aliasing_Demonstration.m     # Study of undersampling and aliasing
 ├── SquareWave_Spectrum.m        # Frequency spectrum of square wave and harmonics
 ├── Upsampling_Interpolation.m   # Signal upsampling and interpolation
 └── README.md                    # Project overview, theory, and observations.
 - Each MATLAB script generates time-domain and frequency-domain plots.
 - Scripts are modular and independently executable.
 - Plots are automatically saved as PNG files for documentation.
## Tools & Libraries:-
 - MATLAB – computation, FFT, plotting.
 - Signal Processing Toolbox – for interpolation, filtering, and analysis.
## Key Learnings & Insights:-
- Proper sampling rate selection is essential to prevent aliasing
- DFT resolution depends on the number of points (N)
- Fourier analysis visualizes harmonic structure in non-sinusoidal signals
- Interpolation techniques allow for higher-resolution signal reconstruction
- Understanding trade-offs between time and frequency resolution
- Practical DSP skills: generating signals, plotting spectra, and filtering
  # Applications:-
- Audio and video signal processing – resampling, spectral analysis
- Digital communications – ensuring Nyquist compliance, avoiding aliasing
- Instrumentation – measuring and reconstructing sensor signals accurately
- Embedded systems – DSP in controllers, IoT devices, and signal acquisition
##Project Highlights
- Hands-on MATLAB simulations demonstrating real-world DSP concepts
- Emphasis on theory understanding and practical visualization
- Modular, clean, and ready-to-use scripts for experimentation
- Plot outputs provide clear visual feedback for learning DSP fundamentals
