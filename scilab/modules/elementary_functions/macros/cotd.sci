// Scilab ( http://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) INRIA, Serge Steer
// Copyright (C) - 2010 - DIGITEO - Michael Baudin
// Copyright (C) DIGITEO - 2011 - Allan CORNET
//
// This file must be used under the terms of the CeCILL.
// This source file is licensed as described in the file COPYING, which
// you should have received as part of this distribution.  The terms
// are also available at
// http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt
function y = cotd(x)
    //Cotangent of argument in degrees.
    rhs = argn(2);
    if rhs <> 1 then
        error(msprintf(gettext("%s: Wrong number of input argument(s): %d expected.\n"),"cotd", 1));
    end

    if ~isreal(x) then
        error(msprintf(gettext("%s: Wrong type for input argument #%d: Real matrix expected.\n"),"cotd",1));
    end
    y = ones(x)./tand(x);
endfunction

