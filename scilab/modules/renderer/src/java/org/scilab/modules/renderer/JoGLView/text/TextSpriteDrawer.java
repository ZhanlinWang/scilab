/*
 * Scilab ( http://www.scilab.org/ ) - This file is part of Scilab
 * Copyright (C) 2009-2010 - DIGITEO - Pierre Lando
 * Copyright (C) 2012 - Scilab Enterprises - Bruno JOFRET
 * 
 * This file must be used under the terms of the CeCILL.
 * This source file is licensed as described in the file COPYING, which
 * you should have received as part of this distribution.  The terms
 * are also available at
 * http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt
 */

package org.scilab.modules.renderer.JoGLView.text;

import org.scilab.forge.scirenderer.shapes.appearance.Appearance;
import org.scilab.forge.scirenderer.shapes.appearance.Color;
import org.scilab.forge.scirenderer.sprite.SpriteDrawer;
import org.scilab.forge.scirenderer.sprite.SpriteManager;
import org.scilab.modules.graphic_objects.figure.ColorMap;
import org.scilab.modules.graphic_objects.textObject.Text;
import org.scilab.modules.renderer.JoGLView.util.ColorFactory;
import org.scilab.modules.renderer.JoGLView.util.GenericTextSpriteDrawer;

/**
 * A {@see SpriteDrawer} who draw a Scilab {@see Text} object.
 * @author Pierre Lando
 */
class TextSpriteDrawer extends GenericTextSpriteDrawer implements SpriteDrawer {

    /**
     * Default constructor.
     * @param spriteManager the sprite manager to use.
     * @param colorMap the color map to use.
     * @param textObject the scilab {@see Text} to draw.
     */
    TextSpriteDrawer(final SpriteManager spriteManager, final ColorMap colorMap, final Text textObject) {
        super(spriteManager, colorMap, textObject);
        setAlignmentFactor(computeAlignmentFactor(textObject));
        Appearance appearance = computeAppearance(colorMap, textObject);
        
        setAppearance(appearance);
        setThickness((int) Math.ceil(appearance.getLineWidth()));
    }
    
    /**
     * Compute and return an {@see Appearance} adapted to the given scilab text.
     * @param colorMap the current scilab color map.
     * @param text the given text.
     * @return an appearance adapted to the given scilab text.
     */
    private Appearance computeAppearance(final ColorMap colorMap, final Text text) {
        Appearance a = new Appearance();

        if (text.getBox() && text.getFillMode()) {
            Color fillColor = ColorFactory.createColor(colorMap, text.getBackground());
            a.setFillColor(fillColor);
        } else {
            a.setFillColor(new Color(0, 0, 0, 0));
        }

        if (text.getBox() && text.getLineMode()) {
            Color lineColor = ColorFactory.createColor(colorMap, text.getLineColor());
            a.setLineColor(lineColor);
            a.setLineWidth(1);
        } else {
            a.setLineWidth(0);
        }

        return a;
    }
}