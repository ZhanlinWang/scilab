/* Generated by GIWS (version 1.3.0) */
/*

Copyright 2007-2008 INRIA
Copyright 2008-2011 DIGITEO

Author : Sylvestre Ledru & others

This is generated code.

This software is a computer program whose purpose is to hide the complexity
of accessing Java objects/methods from C++ code.

This software is governed by the CeCILL-B license under French law and
abiding by the rules of distribution of free software.  You can  use, 
modify and/ or redistribute the software under the terms of the CeCILL-B
license as circulated by CEA, CNRS and INRIA at the following URL
"http://www.cecill.info". 

As a counterpart to the access to the source code and  rights to copy,
modify and redistribute granted by the license, users are provided only
with a limited warranty  and the software's author,  the holder of the
economic rights,  and the successive licensors  have only  limited
liability. 

In this respect, the user's attention is drawn to the risks associated
with loading,  using,  modifying and/or developing or reproducing the
software by the user in light of its specific status of free software,
that may mean  that it is complicated to manipulate,  and  that  also
therefore means  that it is reserved for developers  and  experienced
professionals having in-depth computer knowledge. Users are therefore
encouraged to load and test the software's suitability as regards their
requirements in conditions enabling the security of their systems and/or 
data to be ensured and,  more generally, to use and operate it in the 
same conditions as regards security. 

The fact that you are presently reading this means that you have had
knowledge of the CeCILL-B license and that you accept its terms.
*/


#ifndef __ORG_SCILAB_MODULES_TYPES_SCILABVARIABLES__
#define __ORG_SCILAB_MODULES_TYPES_SCILABVARIABLES__
#include <iostream>
#include <string>
#include <string.h>
#include <stdlib.h>
#include <jni.h>

#include "GiwsException.hxx"

#ifndef _MSC_VER /* Defined anyway with Visual */
#if !defined(byte)
typedef signed char byte;
#else
#pragma message("Byte has been redefined elsewhere. Some problems can happen")
#endif
#endif


#ifndef GIWSEXPORT
# if defined(_MSC_VER) || defined(__WIN32__) || defined(__CYGWIN__)
#   if defined(STATIC_LINKED)
#     define GIWSEXPORT
#   else
#     define GIWSEXPORT __declspec(dllexport)
#   endif
# else
#     define GIWSEXPORT
# endif
#endif

namespace org_scilab_modules_types {
class GIWSEXPORT ScilabVariables {

private:
JavaVM * jvm;

protected:
jmethodID jobjectArray_getAllListenedVariablesID; // cache method id
jmethodID voidsendDatajstringjava_lang_StringjintArray_intjobjectArray__doublejbooleanbooleanjintintID; // cache method id
jmethodID voidsendDatajstringjava_lang_StringjintArray_intjobjectArray__doublejobjectArray__doublejbooleanbooleanjintintID; // cache method id
jmethodID voidsendDatajstringjava_lang_StringjintArray_intjobjectArray__bytejbooleanbooleanjintintID; // cache method id
jmethodID voidsendUnsignedDatajstringjava_lang_StringjintArray_intjobjectArray__bytejbooleanbooleanjintintID; // cache method id
jmethodID voidsendDatajstringjava_lang_StringjintArray_intjobjectArray__shortjbooleanbooleanjintintID; // cache method id
jmethodID voidsendUnsignedDatajstringjava_lang_StringjintArray_intjobjectArray__shortjbooleanbooleanjintintID; // cache method id
jmethodID voidsendDatajstringjava_lang_StringjintArray_intjobjectArray__intjbooleanbooleanjintintID; // cache method id
jmethodID voidsendUnsignedDatajstringjava_lang_StringjintArray_intjobjectArray__intjbooleanbooleanjintintID; // cache method id
jmethodID voidsendDatajstringjava_lang_StringjintArray_intjobjectArray__longjbooleanbooleanjintintID; // cache method id
jmethodID voidsendDatajstringjava_lang_StringjintArray_intjobjectArray__booleanjbooleanbooleanjintintID; // cache method id
jmethodID voidsendDatajstringjava_lang_StringjintArray_intjobjectArray__java_lang_StringjbooleanbooleanjintintID; // cache method id
jclass stringArrayClass;
jmethodID voidsendDatajstringjava_lang_StringjintArray_intjcharcharjintintID; // cache method id
jmethodID voidcloseListjintArray_intjintintID; // cache method id
jmethodID voidsendDatajstringjava_lang_StringjintArray_intjintintjintintjintintjintArray_intjintArray_intjdoubleArray_doublejintintID; // cache method id
jmethodID voidsendDatajstringjava_lang_StringjintArray_intjintintjintintjintintjintArray_intjintArray_intjdoubleArray_doublejdoubleArray_doublejintintID; // cache method id
jmethodID voidsendDatajstringjava_lang_StringjintArray_intjintintjintintjintintjintArray_intjintArray_intjintintID; // cache method id



jobject instance;
jclass instanceClass; // cache class


/**
* Get the environment matching to the current thread.
*/
virtual JNIEnv * getCurrentEnv();

public:
// Constructor
/**
* Create a wrapping of the object from a JNIEnv.
* It will call the default constructor
* @param JEnv_ the Java Env
*/
ScilabVariables(JavaVM * jvm_);

/**
* Create a wrapping of an already existing object from a JNIEnv.
* The object must have already been instantiated
* @param JEnv_ the Java Env
* @param JObj the object
*/
ScilabVariables(JavaVM * jvm_, jobject JObj);


/** 
* This is a fake constructor to avoid the constructor
* chaining when dealing with extended giws classes 
*/
#ifdef FAKEGIWSDATATYPE
ScilabVariables(fakeGiwsDataType::fakeGiwsDataType /* unused */) {}
#endif

// Destructor
~ScilabVariables();

// Generic method
// Synchronization methods
/**
* Enter monitor associated with the object.
* Equivalent of creating a "synchronized(obj)" scope in Java.
*/
void synchronize();

/**
* Exit monitor associated with the object.
* Equivalent of ending a "synchronized(obj)" scope.
*/
void endSynchronize();

// Methods
static char ** getAllListenedVariables(JavaVM * jvm_);

static void sendData(JavaVM * jvm_, char * varName, int* indexes, int indexesSize, double** data, int dataSize, int dataSizeCol, bool swaped, int handlerId);

static void sendData(JavaVM * jvm_, char * varName, int* indexes, int indexesSize, double** real, int realSize, int realSizeCol, double** img, int imgSize, int imgSizeCol, bool swaped, int handlerId);

static void sendData(JavaVM * jvm_, char * varName, int* indexes, int indexesSize, byte** data, int dataSize, int dataSizeCol, bool swaped, int handlerId);

static void sendUnsignedData(JavaVM * jvm_, char * varName, int* indexes, int indexesSize, byte** data, int dataSize, int dataSizeCol, bool swaped, int handlerId);

static void sendData(JavaVM * jvm_, char * varName, int* indexes, int indexesSize, short** data, int dataSize, int dataSizeCol, bool swaped, int handlerId);

static void sendUnsignedData(JavaVM * jvm_, char * varName, int* indexes, int indexesSize, short** data, int dataSize, int dataSizeCol, bool swaped, int handlerId);

static void sendData(JavaVM * jvm_, char * varName, int* indexes, int indexesSize, int** data, int dataSize, int dataSizeCol, bool swaped, int handlerId);

static void sendUnsignedData(JavaVM * jvm_, char * varName, int* indexes, int indexesSize, int** data, int dataSize, int dataSizeCol, bool swaped, int handlerId);

static void sendData(JavaVM * jvm_, char * varName, int* indexes, int indexesSize, long long** data, int dataSize, int dataSizeCol, bool swaped, int handlerId);

static void sendData(JavaVM * jvm_, char * varName, int* indexes, int indexesSize, bool** data, int dataSize, int dataSizeCol, bool swaped, int handlerId);

static void sendData(JavaVM * jvm_, char * varName, int* indexes, int indexesSize, char *** data, int dataSize, int dataSizeCol, bool swaped, int handlerId);

static void sendData(JavaVM * jvm_, char * varName, int* indexes, int indexesSize, unsigned short type, int handlerId);

static void closeList(JavaVM * jvm_, int* indexes, int indexesSize, int handlerId);

static void sendData(JavaVM * jvm_, char * varName, int* indexes, int indexesSize, int row, int col, int nbItem, int* nbItemRow, int nbItemRowSize, int* colPos, int colPosSize, double* data, int dataSize, int handlerId);

static void sendData(JavaVM * jvm_, char * varName, int* indexes, int indexesSize, int row, int col, int nbItem, int* nbItemRow, int nbItemRowSize, int* colPos, int colPosSize, double* real, int realSize, double* imag, int imagSize, int handlerId);

static void sendData(JavaVM * jvm_, char * varName, int* indexes, int indexesSize, int row, int col, int nbItem, int* nbItemRow, int nbItemRowSize, int* colPos, int colPosSize, int handlerId);


                        /**
                        * Get class name to use for static methods
                        * @return class name to use for static methods
                        */
                        
                static const std::string className()
                {
                return "org/scilab/modules/types/ScilabVariables";
                }
                
};


}
#endif