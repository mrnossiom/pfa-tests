# Integrator/Pricer Testing Suite

This repository contains a testing suite for the `integrator` and `pricer` classes in GNU Octave. The `tests_integrator.m` and `tests_pricer.m` scripts provide a comprehensive set of tests for verifying the correctness of the integration methods, primitive calculations, and error estimation for `integrator`; and finance tests for the `pricer` part.

## Setup Instructions - Integrator
1. Ensure that both `tests_integrator.m` and `integrator.m` are in the same directory.
2. Change your method visibility to public, to test some funcs.
3. Open GNU Octave and navigate to the directory where these files are located.
4. Run the tests by entering the following command in the Octave interpreter:
   
   ```octave
   tests_integrator
   ```

## Setup Instructions - Pricer
1. Ensure that both `tests_pricer.m` and `pricer.m` are in the same directory.
2. Open GNU Octave and navigate to the directory where these files are located.
3. Run the tests by entering the following command in the Octave interpreter:
   
   ```octave
   tests_pricer
   ```

## Expected Output
For each test, the script will print:
- `[SUCCESS]` in green if the test passes.
- `[ERROR]` in red if the test fails.

At the end of the test suite, all tests should be completed without errors.

## Notes
- If you encounter errors, check that `integrator.m` and `pricer.m` are correctly implemented and all functions return expected results.
- Some functions require a sufficiently large number of intervals (`n`) for accurate results.
- If you have any questions, ask in MP discord to `shiro_1112`.

Happy coding!

