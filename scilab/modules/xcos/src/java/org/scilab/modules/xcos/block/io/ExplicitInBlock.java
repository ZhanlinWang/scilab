/*
 * Scilab ( http://www.scilab.org/ ) - This file is part of Scilab
 * Copyright (C) 2009-2009 - DIGITEO - Antoine ELIAS <antoine.elias@scilab.org>
 * Copyright (C) 2009-2010 - DIGITEO - Clement DAVID <clement.david@scilab.org>
 *
 * This file must be used under the terms of the CeCILL.
 * This source file is licensed as described in the file COPYING, which
 * you should have received as part of this distribution.  The terms
 * are also available at
 * http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt
 *
 */

package org.scilab.modules.xcos.block.io;

/**
 * Implement an explicit input point of a
 * {@link org.scilab.modules.xcos.block.SuperBlock}.
 */
public final class ExplicitInBlock extends ContextUpdate {

    private static final long serialVersionUID = -5872963017904352162L;

    /**
     * Constructor
     */
    public ExplicitInBlock() {
        super();
    }

    /**
     * Initialize the block with the default values
     */
    @Override
    protected void setDefaultValues() {
        super.setDefaultValues();
        setInterfaceFunctionName("IN_f");
        setSimulationFunctionName("input");
    }
}
