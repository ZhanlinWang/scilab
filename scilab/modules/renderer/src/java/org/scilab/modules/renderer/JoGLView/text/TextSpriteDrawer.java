/*
 * Scilab ( http://www.scilab.org/ ) - This file is part of Scilab
 * Copyright (C) 2009-2010 - DIGITEO - Pierre Lando
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
import org.scilab.forge.scirenderer.sprite.SpriteDrawingTools;
import org.scilab.forge.scirenderer.sprite.SpriteManager;
import org.scilab.forge.scirenderer.sprite.TextEntity;
import org.scilab.modules.graphic_objects.figure.ColorMap;
import org.scilab.modules.graphic_objects.textObject.Text;
import org.scilab.modules.renderer.JoGLView.util.ColorFactory;
import org.scilab.modules.renderer.utils.textRendering.FontManager;

import java.awt.Dimension;
import java.awt.Font;

/**
 * A {@see SpriteDrawer} who draw a Scilab {@see Text} object.
 * @author Pierre Lando
 */
class TextSpriteDrawer implements SpriteDrawer {

    /**
     * Scilab text margin.
     */
    private static final int MARGIN = 2;

    private final SpriteManager spriteManager;
    private final Appearance appearance;
    private final int thickness;
    private final TextEntity[][] entities;
    private final float alignmentFactor;
    private final int spaceWidth;

    private final int[] lineHeight;
    private final int[] columnWidth;

    private final int width;
    private final int height;

    /**
     * Default constructor.
     * @param spriteManager the sprite manager to use.
     * @param colorMap the color map to use.
     * @param textObject the scilab {@see Text} to draw.
     */
    TextSpriteDrawer(final SpriteManager spriteManager, final ColorMap colorMap, final Text textObject) {
        this.alignmentFactor = computeAlignmentFactor(textObject);
        this.spriteManager = spriteManager;
        this.appearance = computeAppearance(colorMap, textObject);
        this.thickness = (int) Math.ceil(appearance.getLineWidth());
        this.spaceWidth = computeSpaceWidth();

        String[][] stringArray = computeTextData(textObject);
        int columnNumber = -1;
        for (String[] stringLine : stringArray) {
            columnNumber = Math.max(stringLine.length, columnNumber);
        }
        int lineNumber = stringArray.length;

        this.lineHeight = new int[lineNumber];
        this.columnWidth = new int[columnNumber];
        this.entities = new TextEntity[columnNumber][lineNumber];

        boolean fractionalFont = textObject.getFontFractional();
        Color textColor = ColorFactory.createColor(colorMap, textObject.getFont().getColor());
        Font font = computeFont(textObject);

        int line = 0;
        for (String[] textLine : stringArray) {
            int column = 0;
            for (String text : textLine) {
                if (text != null) {
                    TextEntity textEntity = new TextEntity(text);
                    textEntity.setTextUseFractionalMetrics(fractionalFont);
                    textEntity.setTextAntiAliased(false);
                    textEntity.setTextColor(textColor);
                    textEntity.setFont(font);
                    entities[column][line] = textEntity;
                    Dimension dimension = spriteManager.getSize(textEntity);
                    columnWidth[column] = Math.max(columnWidth[column], dimension.width);
                    lineHeight[line] = Math.max(lineHeight[line], dimension.height);
                }
                column++;
            }
            line++;
        }

        this.width  = sum(columnWidth) + MARGIN * (columnNumber + 1) + 2 * thickness + spaceWidth * (columnNumber - 1);
        this.height = sum(lineHeight)  + MARGIN * (lineNumber + 1) + 2 * thickness;
    }

    @Override
    public void draw(SpriteDrawingTools drawingTools) {
        // Draw background.
        if (appearance.getFillColor().getAlphaAsFloat() != 0) {
            drawingTools.clear(appearance.getFillColor());
        }

        // Draw text.
        int x = MARGIN + thickness;
        int column = 0;
        for (TextEntity[] entitiesLine : entities) {
            int y = MARGIN + thickness;
            int line = 0;
            for (TextEntity entity : entitiesLine) {
                double deltaX = alignmentFactor * (columnWidth[column] - spriteManager.getSize(entity).getWidth());
                if (entity != null) {
                    drawingTools.draw(entity, (int) (x + deltaX), y);
                }
                y += lineHeight[line] + MARGIN;
                line++;
            }
            x += columnWidth[column] + MARGIN + spaceWidth;
            column++;
        }

        // Draw border lines.
        if (appearance.getLineWidth() > 0) {
            float hlw = appearance.getLineWidth() / 2;
            int x1 = (int) hlw;
            int y1 = (int) hlw;
            int x2 = (int) (width - hlw);
            int y2 = (int) (height - hlw);
            drawingTools.drawPolyline(new int[] {x1, y1, x2, y1, x2, y2, x1, y2, x1, y1}, appearance);
        }
    }

        @Override
        public OriginPosition getOriginPosition() {
            return OriginPosition.UPPER_LEFT;
        }

    /**
     * Return the sprite width needed by this drawer.
     * @return the sprite width needed by this drawer.
     */
    public int getWidth() {
        return width;
    }

    /**
     * Return the sprite height needed by this drawer.
     * @return the sprite height needed by this drawer.
     */
    public int getHeight() {
        return height;
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


    /**
     * Compute and return the matrix of text string from the given {@see Text} object.
     * @param text the given {@see Text} object.
     * @return the matrix of text string from the given {@see Text} object.
     */
    private String[][] computeTextData(final Text text) {
        String[] textString = text.getTextStrings();
        Integer[] dimensions = text.getTextArrayDimensions();
        String[][] texts = new String[dimensions[0]][dimensions[1]];
        int i = 0;
        for (int c = 0; c < dimensions[1]; c++) {
            for (int l = 0; l < dimensions[0]; l++) {
                texts[l][c] = textString[i];
                i++;
            }
        }
        return texts;
    }

    /**
     * Compute and return the {@see Font} adapted to the given scilab text.
     * @param text the given scilab text.
     * @return the {@see Font} adapted to the given scilab text.
     */
    private Font computeFont(final Text text) {
        return FontManager.getSciFontManager().getFontFromIndex(text.getFontStyle(), text.getFontSize());
    }

    /**
     * Compute and return the alignment factor corresponding to the given scilab text.
     * @param text the given scilab text.
     * @return the alignment factor corresponding to the given scilab text.
     */
    private float computeAlignmentFactor(Text text) {
        switch(text.getAlignmentAsEnum()) {
            case LEFT:
                return 0f;
            case CENTER:
                return 1f / 2f;
            case RIGHT:
                return 1f;
            default:
                return 0f;
        }
    }

    /**
     * Compute and return the width of the space character.
     * @return the width of the space character.
     */
    private int computeSpaceWidth() {
        TextEntity spaceText = new TextEntity("_");
        return (int) Math.ceil(spriteManager.getSize(spaceText).getWidth());
    }

    /**
     * Util function.
     * Return sum of the element of the given array.
     * @param values the given array.
     * @return sum of the element of the given array.
     */
    private int sum(int[] values) {
        int sum = 0;
        for (int value : values) {
            sum += value;
        }
        return sum;
    }
}