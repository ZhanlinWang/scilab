// =============================================================================
// Scilab ( http://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2008-2009 - INRIA - Michael Baudin
// Copyright (C) 2011 - DIGITEO - Michael Baudin
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
// <-- CLI SHELL MODE -->

// Test with 2 input arguments and all output arguments
A=[10,1;1,10];
b=[11;11];
[xcomputed, flag, err, iter, res]=pcg(A,b);
xexpected=[1;1];
assert_checkalmostequal ( xcomputed , xexpected , %eps);
assert_checkequal ( flag , 0);
assert_checkequal ( err , 0);
assert_checkequal ( iter, 1);
// Test with 3 input arguments and all output arguments
A=[10,1;1,10];
b=[11;11];
tol = 100*%eps;
[xcomputed, flag, err, iter, res]=pcg(A,b,tol);
xexpected=[1;1];
assert_checkalmostequal ( xcomputed , xexpected , %eps);
assert_checktrue ( err <= tol);
// Test with 4 input arguments and all output arguments
A=[10,1;1,10];
b=[11;11];
tol = 100*%eps;
maxit = 10;
[xcomputed, flag, err, iter, res]=pcg(A,b,tol,maxit);
xexpected=[1;1];
assert_checkalmostequal ( xcomputed,xexpected,%eps);
// Test with 5 input arguments and all output arguments
A=[10,1;1,10];
b=[11;11];
tol = 100*%eps;
maxit = 10;
M1=[1,0;0,1];
[xcomputed, flag, err, iter, res]=pcg(A,b,tol,maxit,M1);
xexpected=[1;1];
assert_checkalmostequal ( xcomputed , xexpected , %eps);
// Test with 6 input arguments and all output arguments
A=[10,1;1,10];
b=[11;11];
tol = 100*%eps;
maxit = 10;
M1=[1,0;0,1];
M2=[1,0;0,1];
[xcomputed, flag, err, iter, res]=pcg(A,b,tol,maxit,M1,M2);
xexpected=[1;1];
assert_checkalmostequal ( xcomputed , xexpected , %eps);
// Test with 7 input arguments and all output arguments
A=[10,1;1,10];
b=[11;11];
tol = 100*%eps;
maxit = 10;
M1=[1,0;0,1];
M2=[1,0;0,1];
x0=[1;1];
[xcomputed, flag, err, iter, res]=pcg(A,b,tol,maxit,M1,M2,x0);
xexpected=[1;1];
assert_checkalmostequal ( xcomputed , xexpected , %eps);
// Test with non-positionnal input parameters so that 0 iteration can happen
A=[100,1;1,10];
b=[101;11];
[xcomputed, flag, err, iter, res]=pcg(A,b,maxIter=0);
assert_checkequal ( iter , 0 );
// Test with non-positionnal input parameters so that 1 iteration is sufficient
A=[100,1;1,10];
b=[101;11];
[xcomputed, flag, err, iter, res]=pcg(A,b,tol=0.1);
assert_checkequal ( iter , 1 );
// Test with non-positionnal input parameters so that pre-conditionning is necessary
A=[100,1;1,0.0101];
b=[101;11];
M=A;
[xcomputed, flag, err, iter, res]=pcg(A,b,%M=M,maxIter=3,tol=%eps);
assert_checkequal ( flag , 0 );
// Test with non-positionnal input parameters so that good initialization generates 0 iterations
A=[100,1;1,10.];
b=[101;11];
[xcomputed, flag, err, iter, res]=pcg(A,b,x0=[1.;1.]);
assert_checkequal ( iter , 0 );
// Test the special case where b=0
A=[100,1;1,10.];
b=[0;0];
[xcomputed, flag, err, iter, res]=pcg(A,b);
xexpected=[0;0];
assert_checkalmostequal ( xcomputed , xexpected , %eps);
assert_checkequal ( flag , 0 );
assert_checktrue ( err <= %eps );
assert_checkequal ( iter , 0 );
// Try a hard case where preconditionning is necessary
// This is the Hilbert 5x5 matrix : A = 1/(testmatrix("hilb",5))
A = [
    1.                          0.5000000000000001110223    0.3333333333333334258519    0.2500000000000000555112    0.2000000000000000666134  
    0.4999999999999982236432    0.3333333333333319825620    0.2499999999999988897770    0.1999999999999990951682    0.1666666666666659080143  
    0.3333333333333320380731    0.2499999999999990563104    0.1999999999999992617017    0.1666666666666660745477    0.1428571428571423496123  
    0.2499999999999990285549    0.1999999999999993449684    0.1666666666666661855700    0.1428571428571424883902    0.1249999999999996808109  
    0.1999999999999991506794    0.1666666666666660745477    0.1428571428571424328791    0.1249999999999996669331    0.11111111111111082739    
];
b = ones(5,1);
M=A;
[xcomputed, flag, err, iter, res]=pcg(A,b,%M=M,tol=%eps,maxIter = 3 );
expected = [
    5.
  -120.
    630.
  -1120.
    630.
];
assert_checkalmostequal ( xcomputed , expected, 1.e8 * %eps );
assert_checkequal ( flag , 0 );
assert_checkequal ( iter , 2 );
// Try a difficult case where preconditionning is necessary
// Use two pre-conditionning matrices.
// This is the Hilbert 5x5 matrix : A = 1/(testmatrix("hilb",5))
A = [
    1.                          0.5000000000000001110223    0.3333333333333334258519    0.2500000000000000555112    0.2000000000000000666134  
    0.4999999999999982236432    0.3333333333333319825620    0.2499999999999988897770    0.1999999999999990951682    0.1666666666666659080143  
    0.3333333333333320380731    0.2499999999999990563104    0.1999999999999992617017    0.1666666666666660745477    0.1428571428571423496123  
    0.2499999999999990285549    0.1999999999999993449684    0.1666666666666661855700    0.1428571428571424883902    0.1249999999999996808109  
    0.1999999999999991506794    0.1666666666666660745477    0.1428571428571424328791    0.1249999999999996669331    0.11111111111111082739    
];
b = ones(5,1);
// This is the cholesky factorization of the matrix A : C = chol(A)
C = [
    1.    0.5000000000000001110223    0.3333333333333334258519    0.2500000000000000555112    0.2000000000000000666134  
    0.    0.288675134594810367528     0.2886751345948112557060    0.2598076211353305131624    0.2309401076758494653074  
    0.    0.                          0.0745355992499937836104    0.1118033988749897594817    0.1277753129999876502421  
    0.    0.                          0.                          0.0188982236504644136865    0.0377964473009222076683  
    0.    0.                          0.                          0.                          0.0047619047619250291087  
];
M1 = C';
M2 = C;
[xcomputed, flag, err, iter, res]=pcg(A,b , %M=M1 , %M2 = M2 , tol=%eps,maxIter = 3 );
expected = [
      5.
   -120.
    630.
  -1120.
    630.
];
assert_checkalmostequal ( xcomputed , expected, 1.e8 * %eps );
assert_checkequal ( flag , 0 );
assert_checkequal ( iter , 2 );

