// =============================================================================
// Scilab ( http://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2012 - SCILAB ENTERPRISES - Simon GARESTE
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
// <-- ENGLISH IMPOSED -->
// <-- CLI SHELL MODE -->

msgerr = msprintf(gettext("%s: Wrong number of input argument(s): 1 expected."), "h5isRef");
assert_checkerror("h5isRef()",msgerr,77);
assert_checkfalse(h5isRef("42"));
assert_checkfalse(h5isRef(42));

w = "testing";
x = list(1, "hello");
y = [1 2;3 4];
z = 1;
save(TMPDIR + "/w.sod", "w");
save(TMPDIR + "/x.sod", "x");
save(TMPDIR + "/y.sod", "y");
save(TMPDIR + "/z.sod", "z");

a = h5open(TMPDIR + "/w.sod", "r");
assert_checkfalse(h5isRef(a));
aw = a.root.w.data;
assert_checkfalse(h5isRef(aw));
h5close(a)

b = h5open(TMPDIR + "/x.sod", "r");
assert_checkfalse(h5isRef(b));
bx = b.root.x.data;
assert_checktrue(h5isRef(bx));
h5close(b)

c = h5open(TMPDIR + "/y.sod", "r");
assert_checkfalse(h5isRef(c));
cy = c.root.y.data;
assert_checkfalse(h5isRef(cy));
h5close(c)

d = h5open(TMPDIR + "/z.sod", "r");
assert_checkfalse(h5isRef(d));
dz = d.root.z.data;
assert_checkfalse(h5isRef(dz));
h5close(d)

