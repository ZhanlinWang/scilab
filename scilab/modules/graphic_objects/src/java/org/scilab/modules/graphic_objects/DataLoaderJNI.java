/* ----------------------------------------------------------------------------
 * This file was automatically generated by SWIG (http://www.swig.org).
 * Version 1.3.40
 *
 * Do not make changes to this file unless you know what you are doing--modify
 * the SWIG interface file instead.
 * ----------------------------------------------------------------------------- */

package org.scilab.modules.graphic_objects;

class DataLoaderJNI {

  static {
    try {
        System.loadLibrary("scigraphic_objects");
    } catch (UnsatisfiedLinkError e) {
      System.err.println("Native library failed to load. \n" + e);
      System.exit(1);
    }
  }

  public final static native int getDataSize(String jarg1);
  public final static native void fillVertices(String jarg1, java.nio.FloatBuffer jarg2, int jarg3, int jarg4, int jarg5, double[] jarg6, double[] jarg7, int jarg8);
  public final static native void fillColors(String jarg1, java.nio.FloatBuffer jarg2, int jarg3, int jarg4);
  public final static native int getIndicesSize(String jarg1);
  public final static native int fillIndices(String jarg1, java.nio.IntBuffer jarg2, int jarg3, int jarg4);
  public final static native int getWireIndicesSize(String jarg1);
  public final static native int fillWireIndices(String jarg1, java.nio.IntBuffer jarg2, int jarg3, int jarg4);
  public final static native int getMarkIndicesSize(String jarg1);
  public final static native int fillMarkIndices(String jarg1, java.nio.IntBuffer jarg2, int jarg3);
}