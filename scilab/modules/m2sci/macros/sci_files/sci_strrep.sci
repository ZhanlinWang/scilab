// Scilab ( http://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2002-2004 - INRIA - Vincent COUVERT
//
// This file must be used under the terms of the CeCILL.
// This source file is licensed as described in the file COPYING, which
// you should have received as part of this distribution.  The terms
// are also available at
// http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt

function [tree]=sci_strrep(tree)
    // M2SCI function
    // Conversion function for Matlab strrep()
    // Input: tree = Matlab funcall tree
    // Ouput: tree = Scilab equivalent for tree
    // Emulation function: mtlb_strrep()

    [s1,s2,s3] = getrhs(tree)

    if s1.vtype==String & s2.vtype==String & s3.vtype==String then
        tree.name="strsubst"
        tree.lhs(1).dims=list(Unknown,Unknown)
        tree.lhs(1).type=Type(String,Real)
    else
        tree.name="mtlb_strrep"
        tree.lhs(1).dims=list(Unknown,Unknown)
        tree.lhs(1).type=Type(Unknown,Unknown)
    end
endfunction
