// =============================================================================
// Scilab ( http://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2008 - INRIA - Michael Baudin
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- CLI SHELL MODE -->

// Numerical tests
// Case where A is sparse
A=[ 94  0   0   0    0   28  0   0   32  0
0   59  13  5    0   0   0   10  0   0
0   13  72  34   2   0   0   0   0   65
0   5   34  114  0   0   0   0   0   55
0   0   2   0    70  0   28  32  12  0
28  0   0   0    0   87  20  0   33  0
0   0   0   0    28  20  71  39  0   0
0   10  0   0    32  0   39  46  8   0
32  0   0   0    12  33  0   8   82  11
0   0   65  55   0   0   0   0   11  100];
b = [154.
87.
186.
208.
144.
168.
158.
135.
178.
231.];
Asparse = sparse(A);
// With the default 10 iterations, the algorithm performs well
[xcomputed, fail, err, iter, res]=pcg(Asparse,b);
xexpected=ones(10,1);
if norm(xcomputed-xexpected)>10**3*%eps then pause,end
if fail<>0 then pause,end
if iter<>10 then pause,end
if err > 10**3*%eps then pause,end

