
/*
 * Scilab ( http://www.scilab.org/ ) - This file is part of Scilab
 * Copyright (C) INRIA - Sylvestre LEDRU
 *
 * This file must be used under the terms of the CeCILL.
 * This source file is licensed as described in the file COPYING, which
 * you should have received as part of this distribution.  The terms
 * are also available at
 * http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt
 *
 */

/*--------------------------------------------------------------------------*/
#ifndef __GENCUSUM_H__
#define __GENCUSUM_H__
#include "dynlib_integer.h"
#include "machine.h"
#include "def.h"

/**
 * TODO : comment
 * @param typ
 * @param n
 * @param w
 * @param iw
 * @return
 */
INTEGER_IMPEXP int C2F(gencusum)(int *typ, int *n, void *in, void *out, int *iw);
INTEGER_IMPEXP int C2F(gencusumasdouble)(int *typ, int *n, void *in, double * out, int *iw);
#endif /* __GENCUSUM_H__ */
