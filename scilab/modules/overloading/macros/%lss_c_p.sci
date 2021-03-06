// Scilab ( http://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) INRIA
//
// This file must be used under the terms of the CeCILL.
// This source file is licensed as described in the file COPYING, which
// you should have received as part of this distribution.  The terms
// are also available at
// http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt

function [s]=%lss_c_p(s1,d2)
    //s=%lss_c_p(s1,d2)
    // u=[u1;u2]    y=y1+d2*u1
    // s=[s1,d2]

    [a1,b1,c1,d1,x1,dom1]=s1(2:7)
    [n1,m1]=size(b1);[p2,m2]=size(d2);
    s=tlist(["lss","A","B","C","D","X0","dt"],a1,[b1 0*ones(n1,m2)],c1,[d1 d2],x1,dom1)
endfunction
