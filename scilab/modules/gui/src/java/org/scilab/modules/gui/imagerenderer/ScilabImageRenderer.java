/*
 * Scilab ( http://www.scilab.org/ ) - This file is part of Scilab
 * Copyright (C) 2010 - Han DONG
 * 
 * This file must be used under the terms of the CeCILL.
 * This source file is licensed as described in the file COPYING, which
 * you should have received as part of this distribution.  The terms
 * are also available at    
 * http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt
 *
 */

package org.scilab.modules.gui.imagerenderer;

import java.awt.Color;
import java.awt.Font;

import org.scilab.modules.gui.bridge.ScilabBridge;
import org.scilab.modules.gui.events.callback.CommonCallBack;
import org.scilab.modules.gui.utils.Position;
import org.scilab.modules.gui.utils.Size;
import org.scilab.modules.gui.widget.ScilabWidget;

/**
 * Swing implementation for Scilab ImageRenderer in GUIs
 * @author Han DONG
 */
public class ScilabImageRenderer extends ScilabWidget implements ImageRenderer {

	private SimpleImageRenderer component;
	
	/**
	 * Constructor
	 */
	protected ScilabImageRenderer() {
		component = ScilabBridge.createImageRenderer();
	}

	/**
	 * Creates a Scilab ImageRenderer object
	 * @return the created ImageRenderer
	 */
	public static ImageRenderer createImageRenderer() {
		return new ScilabImageRenderer();
	}
	
	/**
	 * Gets this Bridge component object
	 * @return this Bridge component object
	 */
	public SimpleImageRenderer getAsSimpleImageRenderer() {
		return component;
	}
	
	/**
	 * Sets the text of a ImageRenderer
	 * @param newText the text to set to the ImageRenderer
	 */
	public void setText(String newText) {
		ScilabBridge.setText(this, newText);
	}
	
	/**
	 * Gets the text of a ImageRenderer
	 * @return text of the ImageRenderer
	 */
	public String getText() {
		return ScilabBridge.getText(this);
	}
	
	/**
	 * Draws a ImageRenderer
	 */
	public void draw() {
		ScilabBridge.draw(this);
	}
	
	/**
	 * Sets the dimensions (width and height) of a swing Scilab element
	 * @param newSize the dimensions to set to the element
	 * @see org.scilab.modules.gui.uielement.UIElement#setDims(org.scilab.modules.gui.utils.Size)
	 */
	public void setDims(Size newSize) {
		ScilabBridge.setDims(this, newSize); 
	}
	
	/**
	 * Gets the dimensions (width and height) of a swing Scilab element
	 * @return the dimensions (width and height) of the element
	 * @see org.scilab.modules.gui.uielement.UIElement#getDims(org.scilab.modules.gui.utils.Size)
	 */
	public Size getDims() {
		return ScilabBridge.getDims(this);
	}
	
	/**
	 * Gets the position (X-coordinate and Y-coordinate) of a Scilab element
	 * @return the position of the element
	 * @see org.scilab.modules.gui.uielement.UIElement#getPosition()
	 */
	public Position getPosition() {
		return ScilabBridge.getPosition(this);
	}

	/**
	 * Sets the position (X-coordinate and Y-coordinate) of a Scilab element
	 * @param newPosition the position we want to set to the element
	 * @see org.scilab.modules.gui.uielement.UIElement#setPosition(org.scilab.modules.gui.utils.Position)
	 */
	public void setPosition(Position newPosition) {
		ScilabBridge.setPosition(this, newPosition);
	}

	/**
	 * Gets the visibility status of an UIElement
	 * @return the visibility status of the UIElement (true if the UIElement is visible, false if not)
	 */
	public boolean isVisible() {
		return ScilabBridge.isVisible(this);
	}
	
	/**
	 * Sets the visibility status of a Menu
	 * @param newVisibleState the visibility status we want to set for the UIElement
	 * 			(true if the UIElement is visible, false if not)
	 */
	public void setVisible(boolean newVisibleState) {
		ScilabBridge.setVisible(this, newVisibleState);
	}

	/**
	 * To get the Background color of the element.
	 * @return color the Color
	 */
	public Color getBackground() {
		return ScilabBridge.getBackground(this);
	}

	/**
	 * To get the Font of the element.
	 * @return font the Font
	 */
	public Font getFont() {
		return ScilabBridge.getFont(this);
	}

	/**
	 * To get the Foreground color of the element.
	 * @return color the Color
	 */
	public Color getForeground() {
		return ScilabBridge.getForeground(this);
	}

	/**
	 * To set the Background color of the element.
	 * @param color the Color
	 */
	public void setBackground(Color color) {
		ScilabBridge.setBackground(this, color);
	}

	/**
	 * To set the Font of the element.
	 * @param font the Font
	 */
	public void setFont(Font font) {
		ScilabBridge.setFont(this, font);
	}

	/**
	 * To set the Foreground color of the element.
	 * @param color the Color
	 */
	public void setForeground(Color color) {
		ScilabBridge.setForeground(this, color);
	}
	
	/**
	 * Add a callback to the ImageRenderer
	 * @param callback the CallBack to set.
	 */
	public void setCallback(CommonCallBack callback) {
		ScilabBridge.setCallback(this, callback);
	}
	
	/**
	 * Set if the ImageRenderer is enabled or not
	 * @param status true if the ImageRenderer is enabled
	 */
	public void setEnabled(boolean status) {
		ScilabBridge.setEnabled(this, status);
	}

	/**
	 * Gets the enable status of a ImageRenderer
	 * @return the enable status of the ImageRenderer (true if the ImageRenderer is enabled, false if not)
	 */
	public boolean isEnabled() {
		return ScilabBridge.isEnabled(this);
	}

	/**
	 * Set the horizontal alignment for the ImageRenderer text
	 * @param alignment the value for the alignment (See ScilabAlignment.java)
	 */
	public void setHorizontalAlignment(String alignment) {
		ScilabBridge.setHorizontalAlignment(this, alignment);
	}

	/**
	 * Set the vertical alignment for the ImageRenderer text
	 * @param alignment the value for the alignment (See ScilabAlignment.java)
	 */
	public void setVerticalAlignment(String alignment) {
		ScilabBridge.setVerticalAlignment(this, alignment);
	}
	
	/**
	 * Set the Relief of the ImageRenderer
	 * @param reliefType the type of the relief to set (See ScilabRelief.java)
	 */
	public void setRelief(String reliefType) {
		ScilabBridge.setRelief(this, reliefType);
	}

	/**
	 * Delete the ImageRenderer
	 */
	public void destroy() {
		ScilabBridge.destroy(this);
	}
	
	/**
	 * Give the focus to the ImageRenderer
	 */
	public void requestFocus() {
		ScilabBridge.requestFocus(this);
	}

	/**
	 * Rotates an image
	 * @param indices the double value for the angle to rotate
	 */
	public void setRotate(double[] indices) {
		ScilabBridge.setRotate(this, indices);
	}

	/**
	 * Shears an image
	 * @param indices the double array with x, y values to shear
	 */
 	public void setShear(double[] indices) {
		ScilabBridge.setShear(this, indices);
	}

	/**
	 * Scaless an image
	 * @param indices the double array with x, y values to scale
	 */
 	public void setScale(double[] indices) {
		ScilabBridge.setScale(this, indices);
	}
}