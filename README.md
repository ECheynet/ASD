# Converting acceleration to displacements records 

[![View Converting acceleration to displacements records  on File Exchange](https://www.mathworks.com/matlabcentral/images/matlab-file-exchange.svg)](https://se.mathworks.com/matlabcentral/fileexchange/74272-converting-acceleration-to-displacements-records)
[![DOI](https://zenodo.org/badge/263953927.svg)](https://zenodo.org/badge/latestdoi/263953927)


[![Donation](https://camo.githubusercontent.com/a37ab2f2f19af23730565736fb8621eea275aad02f649c8f96959f78388edf45/68747470733a2f2f77617265686f7573652d63616d6f2e636d68312e707366686f737465642e6f72672f316339333962613132323739393662383762623033636630323963313438323165616239616439312f3638373437343730373333613266326636393664363732653733363836393635366336343733326536393666326636323631363436373635326634343666366536313734363532643432373537393235333233303664363532353332333036313235333233303633366636363636363536353264373936353663366336663737363737323635363536653265373337363637)](https://www.buymeacoffee.com/echeynet)


## Summary

The present submission introduces a simple function ASD.m that is inspired by [1] but includes also the possibility to use the double integration technique instead of the Discrete Fourier Transform (DFT) when transforming acceleration records to displacement records. The simple right-hand difference technique is also implemented as an alternative to the DFT for transforming displacement data to acceleration data.

The function also includes the possibility to compute the velocity histories from the acceleration of displacement records.

## Content

The submission contains three files:
- The function ASD.m, which is an acronym for Acceleration-Speed-Displacement.
- Two data file data_bridge.mat and data_beam.mat that contains the computed vertical acceleration, velocity and displacement response from a suspension bridge and a cantilever beam, respectively. The data set is created using [2]
- Two example files Example1.mlx and Example2.mlx, that illustrates how the function ASD.m can be called.

The is the second version of the submission, Several typos may still be present as well as bugs. Any suggestion, comment or question is welcomed. Credits for the present submission should also go to ref. [1] for the function iomega.

## References:

[1] https://www.mathworks.com/matlabcentral/answers/21700-finding-the-velocity-from-displacement#answer_33902

[2] https://www.mathworks.com/matlabcentral/fileexchange/66016-response-of-a-line-like-structure-to-a-random-load

