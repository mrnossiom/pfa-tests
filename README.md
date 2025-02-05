# Integrator Testing Suite

This repository contains a testing suite for the `integrator` class in GNU Octave. The `tests.m` script provides a comprehensive set of tests for verifying the correctness of the integration methods, primitive calculations, and error estimation.

## Setup Instructions
1. Ensure that both `tests.m` and `integrator.m` are in the same directory.
2. Open GNU Octave and navigate to the directory where these files are located.
3. Run the tests by entering the following command in the Octave interpreter:
   
   ```octave
   tests
   ```

## Test Coverage
The `tests.m` script checks the following functionalities:
- **Constructor Tests**: Ensures the constructor initializes correctly, including copying an existing object.
- **Set & Get Tests**: Verifies that properties can be modified and retrieved correctly.
- **Integration Tests**: Tests various numerical integration methods such as:
  - Trapezoidal rule
  - Gauss-Legendre quadrature (2 and 3 points)
  - Midpoint rule
  - Integration of various functions including polynomials, trigonometric, and exponential functions.
- **Primitive Tests**: Checks the numerical computation of function primitives.
- **Integration Error Tests**: Evaluates the accuracy of integration methods and verifies the convergence model.

## Expected Output
For each test, the script will print:
- `[SUCCESS]` in green if the test passes.
- `[ERROR]` in red if the test fails.

At the end of the test suite, all tests should be completed without errors.

## Notes
- If you encounter errors, check that `integrator.m` is correctly implemented and all functions return expected results.
- Some functions require a sufficiently large number of intervals (`n`) for accurate results.

Happy coding!

