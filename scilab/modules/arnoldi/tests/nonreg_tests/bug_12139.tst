// =============================================================================
// Scilab ( http://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2013 - Scilab Enterprises - Sylvestre Ledru
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- CLI SHELL MODE -->

// <-- Non-regression test for bug 12139 -->
//
// <-- Bugzilla URL -->
// http://bugzilla.scilab.org/show_bug.cgi?id=12139
//
// <-- Short Description -->
//    eigs run out of memory for sparse matrices.
// =============================================================================

A = speye(100000,100000);
assert_checkalmostequal(eigs(A), [1;1;1;1;1;1]);
