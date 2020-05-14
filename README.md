# ASD




The present submission introduces a simple function ASD.m that is inspired by [1] but includes also the possibility to use the double integration technique instead of the Discrete Fourier Transform (DFT) when transforming acceleration records to displacement records. The simple right-hand difference technique is also implemented as an alternative to the DFT for transforming displacement data to acceleration data.

The function also includes the possibility to compute the velocity histories from the acceleration of displacement records.

The submission contains three files:
- The function ASD.m, which is an acronym for Acceleration-Speed-Displacement.
- Two data file data_bridge.mat and data_beam.mat that contains the computed vertical acceleration, velocity and displacement response from a suspension bridge and a cantilever beam, respectively. The data set is created using [2]
- Two example files Example1.mlx and Example2.mlx, that illustrates how the function ASD.m can be called.

The is the second version of the submission, Several typos may still be present as well as bugs. Any suggestion, comment or question is welcomed. Credits for the present submission should also go to ref. [1] for the function iomega.

References:
[1] https://www.mathworks.com/matlabcentral/answers/21700-finding-the-velocity-from-displacement#answer_33902
[2] https://www.mathworks.com/matlabcentral/fileexchange/66016-response-of-a-line-like-structure-to-a-random-load

