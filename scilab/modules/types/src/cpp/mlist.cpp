/*
 *  Scilab ( http://www.scilab.org/ ) - This file is part of Scilab
 *  Copyright (C) 2010-2010 - DIGITEO - Antoine ELIAS
 *
 *  This file must be used under the terms of the CeCILL.
 *  This source file is licensed as described in the file COPYING, which
 *  you should have received as part of this distribution.  The terms
 *  are also available at
 *  http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt
 *
 */

#include <sstream>
#include "mlist.hxx"

#ifndef NDEBUG
#include "inspector.hxx"
#endif

namespace types
{
    /**
    ** Constructor & Destructor (public)
    */
    MList::MList() : List()
    {
#ifndef NDEBUG
        Inspector::addItem(this);
#endif
    }

    MList::~MList()
    {
#ifndef NDEBUG
        Inspector::removeItem(this);
#endif
    }
}