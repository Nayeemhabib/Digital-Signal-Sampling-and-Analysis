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
