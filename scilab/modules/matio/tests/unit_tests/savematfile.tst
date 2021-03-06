// =============================================================================
// Scilab ( http://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2008 - INRIA - Vincent Couvert <vincent.couvert@inria.fr>
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// This Scilab script saves MAT-files to test the MATIO module

chdir("SCI/modules/matio/tests/unit_tests/")

clear
names=who('local');
//
// TESTS FOR CELL ARRAYS
//
//--emptycell = cell();
scalarcell = makecell([1 1], 1.23);
//--rowcell = makecell([1 3], "abc", [1.23+7.89*%i 4.56-1.23*%i 7.89+4.56*%i], 1.23);
//--colcell = makecell([3 1], [1.23+7.89*%i 4.56-1.23*%i 7.89+4.56*%i], "abc", 1.23);
//--arraycell = makecell([2 3], "a", [1.23+7.89*%i 4.56-1.23*%i 7.89+4.56*%i], int8(1), "abc", 1.23, eye(100,100));
//--stringcell = makecell([2 3], "abc", "def", "ghi", "jkl", "mno", "pqr");

//
// TESTS FOR STRUCTURE ARRAYS
//
//--emptystruct = struct();
//--scalarstruct = struct('f1', 10, 'ftwo', 'Hello', 'field3', int8(12));
//--rowstruct = struct('field1', 10, 'field2', 'Hello', 'field3', int8(12));
//--rowstruct(1,2).field1 = 'test';
//--rowstruct(1,2).field2 = eye(10, 10);
//--rowstruct(1,3).field2 = 'a f*%ield contents';
//--rowstruct(1,3).field3 = 1.23+4.56*%i;
//--colstruct = struct('name', 10, 'phone', 'Hello', 'address', int8(12));
//--colstruct(2,1).name = 'test';
//--colstruct(2,1).phone = eye(10, 10);
//--colstruct(3,1).phone = 'a f*%ield contents';
//--colstruct(3,1).address = 1.23+4.56*%i;
//--arraystruct = struct('field1', 10, 'field2', 'Hello', 'field3', int8(12));
//--arraystruct(1,2).field1 = 'test';
//--arraystruct(1,2).field2 = eye(10, 10);
//--arraystruct(1,3).field2 = 'a field contents';
//--arraystruct(1,3).field3 = 1.23+4.56*%i;
//--arraystruct(2,1).name = 'test';
//--arraystruct(2,1).phone = eye(10, 10);
//--arraystruct(3,1).phone = 'a field contents';
//--arraystruct(3,1).address = 1.23+4.56*%i;

//
// TESTS FOR OBJECTS
//

// TODO

//
// TESTS FOR CHARACTER ARRAYS
//

//--emptystringmatrix = ''; // Fails with -v7
//--stringscalar = 'a'; // Fails with -v4
//--stringrowvector = ['a' 'b' 'c']; // Fails with -v4
//--stringcolvector = ['a';'b';'c']; // Fails with -v4
//--stringmatrix = ['a' 'b' 'c';'d' 'e' 'f']; // Fails with -v4

//
// TESTS FOR DOUBLE PRECISION ARRAYS
//

emptydoublematrix = [];

realdoublescalar = 1.23;
cplxdoublescalar = 1.23 + 4.56*%i;

realdoublerowvector = [1.23 -4.56 7.89];
cplxdoublerowvector = [1.23+7.89*%i 4.56-1.23*%i 7.89+4.56*%i];

realdoublecolvector = [1.23;-4.56;7.89];
cplxdoublecolvector = [1.23+7.89*%i;4.56-1.23*%i;7.89+4.56*%i];

realdoublematrix = [1.23 -4.56 7.89;9.87 6.54 -3.21];
cplxdoublematrix = [1.23+7.89*%i 4.56-1.23*%i 7.89+4.56*%i;9.87+3.21*%i 6.54+9.87*%i 3.21-6.54*%i];

//
// TESTS FOR SINGLE PRECISION ARRAYS
//

// TODO

//
// TESTS FOR SPARSE MATRICES
//
// Tests for complex matr*%ices are not done because of a bug *%in MATIO

emptysparse = sparse([]);

//realscalarsparse = sparse(1.23);
//cplxscalarsparse = sparse(1.23 + 4.56*%i);

//--realrowvectorsparse = sparse([1.23 0 7.89]);
//cplxrowvectorsparse = sparse([1.23+7.89*%i 0 7.89+4.56*%i]);

//--realcolvectorsparse = sparse([1.23;0;7.89]);
//cplxcolvectorsparse = sparse([1.23+7.89*%i;0;7.89+4.56*%i]);

//--realmatrixsparse = sparse([1.23 0 7.89;0 6.54 -3.21]);
//cplxmatrixsparse = sparse([1.23+7.89*%i 0 7.89+4.56*%i;0 6.54+9.87*%i 3.21-6.54*%i]);

//
// TESTS FOR 8-BITS SIGNED INTEGERS
//

emptyint8matrix = int8([]);
int8scalar = int8(1);
int8rowvector = int8([1 -4 7]);
int8colvector = int8([1;-4;7]);
int8matrix = int8([1 -4 7;-9 6 -3]);

//
// TESTS FOR 16-BITS SIGNED INTEGERS
//

emptyint16matrix = int16([]);
int16scalar = int16(1);
int16rowvector = int16([1 -4 7]);
int16colvector = int16([1;-4;7]);
int16matrix = int16([1 -4 7;-9 6 -3]);

//
// TESTS FOR 32-BITS SIGNED INTEGERS
//

emptyint32matrix = int32([]);
int32scalar = int32(1);
int32rowvector = int32([1 -4 7]);
int32colvector = int32([1;-4;7]);
int32matrix = int32([1 -4 7;-9 6 -3]);

// TODO: int64 tests ?

//
// TESTS FOR 8-BITS UNSIGNED INTEGERS
//

emptyuint8matrix = uint8([]);
uint8scalar = uint8(1);
uint8rowvector = uint8([1 -4 7]);
uint8colvector = uint8([1;-4;7]);
uint8matrix = uint8([1 -4 7;-9 6 -3]);

//
// TESTS FOR 16-BITS UNSIGNED INTEGERS
//

emptyuint16matrix = uint16([]);
uint16scalar = uint16(1);
uint16rowvector = uint16([1 -4 7]);
uint16colvector = uint16([1;-4;7]);
uint16matrix = uint16([1 -4 7;-9 6 -3]);

//
// TESTS FOR 32-BITS UNSIGNED INTEGERS
//

emptyuint32matrix = uint32([]);
uint32scalar = uint32(1);
uint32rowvector = uint32([1 -4 7]);
uint32colvector = uint32([1;-4;7]);
uint32matrix = uint32([1 -4 7;-9 6 -3]);

// TODO: uint64 tests ?

//
// TESTS FOR ND-ARRAYS
//
//emptyNDarray = matrix([], 0, 0, 0);
//realdoubleNDarray = matrix(1:24, 2, 3, 4);
//complexdoubleNDarray = matrix((1:24) + (1:24)*%i, 2, 3, 4);

//
// MISC
//
eye100x100 = eye(100,100);

//
// Create files
//
varNames = who("local");
varNames = varNames(1:($-size(names,"*")-1));
varNames(grep(varNames,"%")) = [];
varNames(varNames=="makecell") = [];
varNames(varNames=="struct") = [];
binFormats = ["-v4";"-v6";"-v7"];
for varIndex=1:size(varNames,"*")
  for formatIndex=1:size(binFormats,"*")
    // Integers and NDarrays not saved in -v4 format
    if formatIndex>1 | ...
	(formatIndex==1 & isempty(strindex(varNames(varIndex), "int")) ...
	& isempty(strindex(varNames(varIndex), "NDarray")) & isempty(strindex(varNames(varIndex), "cell")) & isempty(strindex(varNames(varIndex), "struct")) & isempty(strindex(varNames(varIndex), "sparse")))

        // Save data in Matlab format
        filename = TMPDIR+filesep()+varNames(varIndex)+binFormats(formatIndex)+"-scilab.mat";
	saveCmd = "savematfile "+filename+" "+varNames(varIndex)+" "+binFormats(formatIndex);
        execstr(saveCmd);
	// Read saved file
	execstr("sci"+varNames(varIndex)+"="+varNames(varIndex)); // Save variable for comparison
	execstr("clear "+varNames(varIndex)); // Clear variable
	execstr("loadmatfile "+filename); // Load file contaning variable
	execstr("compareOK=and(sci"+varNames(varIndex)+"=="+varNames(varIndex)+")"); // Compare
	if ~compareOK then pause;end // Stop execution if necessary
	clear compareOK
	mdelete(filename)
    end
  end
end

// TODO: save all variables in a single file ?
