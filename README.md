# Artistic Image Filter with MATLAB

This project applies a creative filter to input images using pure MATLAB. It combines brush stroke effects, Sobel edge detection, image aging noise, contrast adjustment, and a half-negative effect to give the image a unique artistic appearance.

## Effects Implemented
- **Brush Stroke Effect:** Random block-wise average blur applied to simulate brush painting.
- **Edge Detection:** Sobel filter applied on all RGB channels for enhanced structure emphasis.
- **Aging/Noise Effect:** Gaussian-like noise added to simulate vintage photo aesthetics.
- **Contrast Adjustment:** Controlled using `imadjust` for faded visual feel.
- **Negative Overlay:** Right half of the image is converted to negative for modern-art contrast.

## Goals
- Understand the fundamentals of image manipulation using raw matrix operations.
- Create artistic filters without relying on advanced libraries or toolboxes.
- Explore how edge and color transformations affect perception.

## Tools Used
- MATLAB (no external toolboxes)
- Custom implementations of Sobel filters and block operations

## How to Run
1. Open `main.m` in MATLAB.
2. Make sure `input (1).jpg` is in the same directory.
3. Run the script to view original and final results.

## Authors
- Suat Deniz
- Abdulkadir Dağlar 
- Berkay Caplık 

## Course
*Introduction to Computer Vision – 2024-2025 Fall*  
Izmir Democracy University, Electrical and Electronics Engineering Department

