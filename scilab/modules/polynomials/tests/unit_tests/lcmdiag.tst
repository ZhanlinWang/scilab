// =============================================================================
// Scilab ( http://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2013 - Scilab Enterprises - Paul Bignier
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- CLI SHELL MODE -->
// <-- ENGLISH IMPOSED -->

// Run with test_run('polynomials', 'lcmdiag', ['no_check_error_output'])

// Normal behavior of the function
s = poly(0, 's');
H = [1/s, (s+2)/s/(s+1)^2; 1/(s^2*(s+2)), 2/(s+2)];
[N, D] = lcmdiag(H);
N*D^(-1), H;

// Trying to call lcmdiag with wrong types
H = ["string"];
refMsg = msprintf(_("%s: Wrong type for argument #%d: Real Matrix of Polynomials expected.\n"), "lcmdiag", 1);
assert_checkerror("[N, D] = lcmdiag(H);", refMsg);
H = [1 2.3];
refMsg2 = msprintf(_("%s: Wrong type for argument #%d: Real Matrix of Polynomials expected.\n"), "lcmdiag", 1);
assert_checkerror("[N, D] = lcmdiag(H);", refMsg2);
H = [1/s, (s+2)/s/(s+1)^2; 1/(s^2*(s+2)), 2/(s+2)];
flag = [1 2.3];
refMsg3 = msprintf(_("%s: Wrong type for argument #%d: String expected.\n"), "lcmdiag", 2);
assert_checkerror("[N, D] = lcmdiag(H, flag);", refMsg3);
flag = "rows";
refMsg4 = msprintf(_("%s: Wrong value for argument #%d: %s or %s expected.\n"), "lcmdiag", 2, "row", "col");
assert_checkerror("[N, D] = lcmdiag(H, flag);", refMsg4);
