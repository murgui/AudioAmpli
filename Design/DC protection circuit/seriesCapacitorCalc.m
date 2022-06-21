##Script demonstrating that using a capacitor for DC protection is not feasible due to the capacitance need to have a low impedance in the low frequency range
pkg load control
close all

C = 100e-6;

L = 2e-3;
R = 4;

s = tf('s')

figure
  DividerGain = s*L + R / (s*L + R + 1/(C*s));
  bode(DividerGain)

figure
  impedance = (s*L + R + 1/(C*s))
  [mag, pha, w] = bode(impedance, 25:1:1e3);
  plot(w, mag)

  