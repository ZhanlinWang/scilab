// Scilab ( http://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) INRIA - Vincent Couvert
//
// This file must be used under the terms of the CeCILL.
// This source file is licensed as described in the file COPYING, which
// you should have received as part of this distribution.  The terms
// are also available at
// http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt

function M=generic_i_ce(varargin)
    // Generic function for insertion of any type of data in a cell
    error(msprintf(_("%s: Invalid assignement: for insertion in cell, use e.g. x(i,j).entries=y.\n"),"generic_i_ce"));
endfunction
