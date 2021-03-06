// ============================================================================
// Scilab ( http://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2008 - Bruno PINCON
//
//  This file is distributed under the same license as the Scilab package.
// ============================================================================

// <-- CLI SHELL MODE -->

// this is the test matrix from UMFPACK
A = sparse( [ 2  3  0  0  0;
              3  0  4  0  6; 
              0 -1 -3  2  0; 
              0  0  1  0  0; 
              0  4  2  0  1] );
Lup = umf_lufact(A);
[OK, nrow, ncol, lnz, unz, udiag_nz, it] = umf_luinfo(Lup);  // OK must be %t, nrow=ncol = 5, 

if OK <> %t then pause, end
if nrow <> 5 then pause, end
if ncol <> 5 then pause, end
if lnz <> 9 then pause, end
if unz <> 9 then pause, end
if udiag_nz <> 5 then pause, end
if it <> 0 then pause, end

[L,U,p,q,R] = umf_luget(Lup);
if nnz(L) <> lnz then pause, end
if nnz(U) <> unz then pause, end
umf_ludel(Lup) // clear memory
