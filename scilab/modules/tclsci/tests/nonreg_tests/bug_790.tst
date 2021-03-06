// =============================================================================
// Scilab ( http://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2005-2008 - INRIA - Allan CORNET <allan.cornet@inria.fr>
// Copyright (C) 2005-2008 - INRIA - Pierre MARECHAL <pierre .marechal@inria.fr>
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- Non-regression test for bug 790 -->
//
// <-- Bugzilla URL -->
// http://bugzilla.scilab.org/show_bug.cgi?id=790
//
// <-- Short Description -->
//    Scilab crashes when you enter findobj().
//    I know that it is not usefull but, the bug exists.

ierr = execstr("findobj()","errcatch");
msg = lasterror();
if ierr==0 | msg<>msprintf(gettext("%s: Wrong number of input arguments: %d expected.\n"), "findobj", 2) then
  pause
end
ierr = execstr("findobj(""test"")","errcatch");
msg = lasterror();
if ierr==0 | msg<>msprintf(gettext("%s: Wrong number of input arguments: %d expected.\n"), "findobj", 2) then
  pause
end
if execstr("findobj(""Param1"",""Param2"") == []","errcatch") <> 0 then pause,end
