/*
 * Scilab ( http://www.scilab.org/ ) - This file is part of Scilab
 * Copyright (C) 2010 - DIGITEO - Manuel JULIACHS
 *
 * This file must be used under the terms of the CeCILL.
 * This source file is licensed as described in the file COPYING, which
 * you should have received as part of this distribution.  The terms
 * are also available at
 * http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt
 *
 */

package org.scilab.modules.graphic_objects.imageplot;

import org.scilab.modules.graphic_objects.graphicObject.IVisitor;

/**
 * Matplot class
 * @author Manuel JULIACHS
 */
public class Matplot extends Imageplot {
	//	 Methods: to be done
	
	/** Constructor */
	public Matplot() {
		super();
	}

    @Override
    public void accept(IVisitor visitor) {
        visitor.visit(this);
    }

    /**
	 * @return Type as String
	 */
	public String getType() {
		return "Matplot";
	}

}