// =============================================================================
// Scilab ( http://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2008 - DIGITEO - Allan CORNET
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- ENGLISH IMPOSED -->
// <-- CLI SHELL MODE -->

// <-- Non-regression test for bug 3191 -->
//
// <-- Bugzilla URL -->
// http://bugzilla.scilab.org/show_bug.cgi?id=3191
//

ilib_verbose(0);

test_path = get_absolute_file_path('bug_3191.tst');

currentpath = pwd();

cd TMPDIR;
cd ../;
OS_TMP_DIR = pwd();


mkdir(OS_TMP_DIR,'bug_3191');
TEST_DIR = OS_TMP_DIR + filesep() + 'bug_3191';

copyfile(SCI+'/modules/dynamic_link/tests/nonreg_tests/bug_3191.c' , TEST_DIR + filesep() + 'bug_3191.c');

chdir(TEST_DIR);

files=['bug_3191.c'];
ilib_build('libc_fun',['c_fun','c_intfun'],files,[]);

// load the shared library 
exec loader.sce;

chdir(currentpath);

//using the new primitive
if c_fun(3,8) <> 3+8 then pause,end

// ulink() all libraries
ulink();

//remove TMP_DIR
rmdir(TEST_DIR,'s');
// =============================================================================
