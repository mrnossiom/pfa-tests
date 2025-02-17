function tests_pricer()
    format long;
    clear all;
    clc;

    % ANSI color codes for terminal text formatting
    RED     = "\033[31m";
    GREEN   = "\033[32m";
    YELLOW  = "\033[33m";
    BLUE    = "\033[34m";
    MAGENTA = "\033[35m";
    CYAN    = "\033[36m";
    WHITE   = "\033[37m";

    DIM     = "\033[2m";
    RESET   = "\033[0m";

    fprintf([BLUE, "Tests made for PFA @EPITA\n", WHITE, "Contributors :\n", RESET, "   - Shiro G. (ST1)\n   - Eliott L. (C2)\n"]);
    fprintf([BLUE, "[DISCLAIMER] ", RED, "Tests are made by student, and are not by any mean official, please refer to the official moulinette for sure tests\n(06 32 92 20 67)\n\n\n", RESET]);

    fprintf([CYAN, "### RUNNING TESTS ###\n\n", RESET]);

    close_factor    = 1e-2;     % how close you have to be
    number_of_tests = 0;        % increments for each tests
    nb_correct      = 0;

    % update the score
    function upd_score(correct)
        if correct
            nb_correct = nb_correct+1;
        end
        number_of_tests = number_of_tests+1;
    end

    % Helper functions for colored output
    function print_result(name, success)
        if success
            fprintf([GREEN, "[SUCESS]\n", RESET]);
        else
            fprintf([RED, "[FAIL] :\n   ", RESET, name, "\n", RESET]);
        end
        upd_score(success);
    end
    function assert_in_range(name, current, expected)
        if abs(current-expected)<close_factor
            print_result([], 1);
        else
            print_result([name, DIM, "\n      - current  : ", WHITE, num2str(current), DIM, "\n      - expected : ", WHITE, num2str(expected), RESET], 0);
        end
    end
    function assert_lists(name, current, expected)
        if ~isequal(size(current), size(expected))
            print_result(name, 0)
            return;
        end
        print_result(name, all(all(abs(current - expected) < close_factor)));
    endfunction
    
    try
        fprintf([MAGENTA, "=====       f_logN TESTS      =====\n", RESET]);
        % Test 1: Standard Case (m=0, s=1)
        expected = [9.902386649591815e-04 2.815901890152683e-01 3.989422804014327e-01 2.185071483032721e-02 2.815901890152680e-03 3.790837692938267e-06 9.902386649591761e-08];
        value = pricer.f_logN(0, 1, [0.01, 0.1, 1, 5, 10, 50, 100]);
        assert_lists("Standard Case (m=0, s=1)", value, expected)
        % Test 2: Mean Shift (m=1, s=1)
        expected = [1.707930831120359e-02 2.419707245191434e-01 1.467778801534336e-01 1.707930831120357e-02 6.006101107306473e-06];
        value = pricer.f_logN(1, 1, [0.1, 1, 2.718, 10, 100]);
        assert_lists("Mean Shift (m=1, s=1)", value, expected)
        % Test 3: Higher Spread (m=0, s=2)
        expected = [1.028151074041252e+00 1.994711402007164e-01 1.028151074041252e-02 1.407950945076340e-04];
        value = pricer.f_logN(0, 2, [0.1, 1, 10, 100]);
        assert_lists("Higher Spread (m=0, s=2)", value, expected)
        % Test 4: Edge Cases
        value = pricer.f_logN(0, 1, [0, -1, NaN, Inf]);
        print_result("Edge Cases", value(1) == 0 && isnan(value(2)) && isnan(value(3)) && value(4) == 0)
        % Test 5: Very Small s=0.1
        expected = [2.962479925349095e-114 3.989422804014327e+00 2.962479925348759e-116];
        value = pricer.f_logN(0, 0.1, [0.1, 1, 10]);
        assert_lists("Very Small s=0.1", value, expected)

        fprintf([MAGENTA, "=====         Phi TESTS       =====\n", RESET]);

        fprintf([MAGENTA, "=====     price_call TESTS    =====\n", RESET]);

        fprintf([MAGENTA, "=====     price_put TESTS     =====\n", RESET]);

        fprintf([MAGENTA, "=====     f_sum_logN TESTS    =====\n", RESET]);

        fprintf([MAGENTA, "=====         F_S TESTS       =====\n", RESET]);


        fprintf("\n\n");
        
        fprintf([CYAN, "### ALL TESTS COMPLETED ###\n", RESET]);

        fprintf([WHITE, "Your note : "]);

        if (nb_correct == number_of_tests)
            fprintf([GREEN, "100p\n\n\n"]);
        else
            format short;
            fprintf([YELLOW, num2str(round(nb_correct/number_of_tests*100)), "p\n\n\n"]);
        end
    catch ME
        fprintf("\033[31m[ERROR]\033[0m Test failed: %s\n", ME.message);
    end
        fprintf([RESET])

end