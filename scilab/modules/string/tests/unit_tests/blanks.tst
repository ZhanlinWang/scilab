// =============================================================================
// Scilab ( http://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2007-2008 - INRIA - Allan CORNET <allan.cornet@inria.fr>
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- CLI SHELL MODE -->

//==============================================================================
// blank unit tests
//==============================================================================

disp(['xxx' blanks(20) 'yyy']);

// Test 1
//LEN_MAX = 20000000; too slow

LEN_MAX = 2000;
r = blanks(LEN_MAX);
l = length(r);
if ( l <> LEN_MAX) then pause,end

// Test 2
// check first and last characters

FIRST_CHAR = part(r,1);
LAST_CHAR = part(r,LEN_MAX);
if (FIRST_CHAR <> " ") then pause,end
if (LAST_CHAR <> " ") then pause,end

// Test 3

A = floor(abs(2^8  * rand()));
B = floor(abs(2^16 * rand()));
C = floor(abs(2^16 * rand()));

D = floor(abs(2^7  * rand()));
E = floor(abs(2^15 * rand()));
F = floor(abs(2^15 * rand()));

if blanks(A) <> blanks(uint8(A))  then pause, end
if blanks(B) <> blanks(uint16(B)) then pause, end
if blanks(C) <> blanks(uint32(C)) then pause, end

if blanks(D) <> blanks(int8(D))  then pause, end
if blanks(E) <> blanks(int16(E)) then pause, end
if blanks(F) <> blanks(int32(F)) then pause, end
