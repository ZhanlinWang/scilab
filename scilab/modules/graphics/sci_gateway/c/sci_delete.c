/*
 * Scilab ( http://www.scilab.org/ ) - This file is part of Scilab
 * Copyright (C) 2006 - ENPC - Jean-Philipe Chancelier
 * Copyright (C) 2006 - INRIA - Fabrice Leray
 * Copyright (C) 2006 - INRIA - Jean-Baptiste Silvy
 * Copyright (C) 2011 - DIGITEO - Bruno JOFRET
 *
 * This file must be used under the terms of the CeCILL.
 * This source file is licensed as described in the file COPYING, which
 * you should have received as part of this distribution.  The terms
 * are also available at
 * http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt
 *
 */

/*------------------------------------------------------------------------*/
/* file: sci_delete.c                                                     */
/* desc : interface for delete routine                                    */
/*------------------------------------------------------------------------*/

#include "MALLOC.h"
#include "gw_graphics.h"
#include "api_scilab.h"
#include "DestroyObjects.h"
#include "SetProperty.h"
#include "GetProperty.h"
#include "DrawObjects.h"
#include "Interaction.h"
#include "localization.h"
#include "Scierror.h"
#include "HandleManagement.h"
#include "FigureList.h"
#include "deleteGraphicObject.h"
#include "CurrentObject.h"
#include "CurrentFigure.h"
#include "BuildObjects.h"

#include "AxesModel.h"
#include "FigureModel.h"

#include "getGraphicObjectProperty.h"
#include "graphicObjectProperties.h"
#include "getConsoleIdentifier.h"
#include "CurrentSubwin.h"
#include "sciprint.h"

#ifdef _MSC_VER
#include "strdup_windows.h"
#endif
/*--------------------------------------------------------------------------*/
int sci_delete(char *fname, unsigned long fname_len)
{
    SciErr sciErr;

    int* piAddrl1 = NULL;
    long long* l1 = NULL;
    int* piAddrl2 = NULL;
    char* l2 = NULL;

    int m1 = 0, n1 = 0, lw = 0;
    unsigned long hdl = 0;
    int nb_handles = 0, i = 0, dont_overload = 0;
    char *pobjUID = NULL;
    char* pFigureUID = NULL;
    char** childrenUID = NULL;
    int iChildrenCount = 0;
    int* childrencount = &iChildrenCount;
    int iHidden = 0;
    int *piHidden = &iHidden;

    char *pstParentUID = NULL;
    int iParentType = -1;
    int *piParentType = &iParentType;
    int iObjType = -1;
    int *piObjType = &iObjType;

    CheckInputArgument(pvApiCtx, 0, 1);
    CheckOutputArgument(pvApiCtx, 0, 1);

    if (nbInputArgument(pvApiCtx) == 0)               /* Delete current object */
    {
        pobjUID = (char*)getCurrentObject();
        if (pobjUID == NULL)
        {
            //No current object, we can leave
            AssignOutputVariable(pvApiCtx, 1) = 0;
            ReturnArguments(pvApiCtx);
            return 0;
        }

        hdl = (unsigned long)getHandle(pobjUID);
        dont_overload = 1;
        nb_handles = 1;
    }
    else
    {
        sciErr = getVarAddressFromPosition(pvApiCtx, 1, &piAddrl1);
        if (sciErr.iErr)
        {
            printError(&sciErr, 0);
            return 1;
        }

        switch (getInputArgumentType(pvApiCtx, 1))
        {
            case sci_handles:      /* delete Entity given by a handle */

                // Retrieve a matrix of handle at position 1.
                sciErr = getMatrixOfHandle(pvApiCtx, piAddrl1, &m1, &n1, &l1); /* Gets the Handle passed as argument */
                if (sciErr.iErr)
                {
                    printError(&sciErr, 0);
                    Scierror(202, _("%s: Wrong type for input argument #%d: Handle matrix expected.\n"), fname, 1);
                    return 1;
                }

                nb_handles = m1 * n1;

                if (nbInputArgument(pvApiCtx) == 2)
                {
                    sciErr = getVarAddressFromPosition(pvApiCtx, 2, &piAddrl2);
                    if (sciErr.iErr)
                    {
                        printError(&sciErr, 0);
                        return 1;
                    }

                    // Retrieve a matrix of double at position 2.
                    if (getAllocatedSingleString(pvApiCtx, piAddrl2, &l2))   /* Gets the command name */
                    {
                        Scierror(202, _("%s: Wrong type for argument #%d: A string expected.\n"), fname, 2);
                        return 1;
                    }
                }
                hdl = (unsigned long) * (l1); /* Puts the value of the Handle to hdl */
                break;
            case sci_strings:      /* delete("all") */
                CheckInputArgument(pvApiCtx, 1, 1);
                sciErr = getVarAddressFromPosition(pvApiCtx, 1, &piAddrl2);
                if (sciErr.iErr)
                {
                    printError(&sciErr, 0);
                    return 1;
                }

                // Retrieve a matrix of double at position 1.
                if (getAllocatedSingleString(pvApiCtx, piAddrl2, &l2))
                {
                    Scierror(202, _("%s: Wrong type for argument #%d: A string expected.\n"), fname, 1);
                    return 1;
                }

                if (strcmp((l2), "all") == 0)
                {
                    int i = 0;
                    int iFigureNumber = sciGetNbFigure();

                    if (iFigureNumber == 0)
                    {
                        //no graphic windows, we can leave
                        AssignOutputVariable(pvApiCtx, 1) = 0;
                        ReturnArguments(pvApiCtx);
                        return 0;
                    }

                    pFigureUID = (char*)getCurrentFigure();

                    getGraphicObjectProperty(pFigureUID, __GO_CHILDREN_COUNT__, jni_int, (void **)&childrencount);

                    getGraphicObjectProperty(pFigureUID, __GO_CHILDREN__, jni_string_vector, (void **)&childrenUID);

                    for (i = 0; i < childrencount[0]; ++i)
                    {
                        getGraphicObjectProperty(childrenUID[i], __GO_HIDDEN__, jni_bool, (void **)&piHidden);
                        if (iHidden == 0)
                        {
                            deleteGraphicObject(childrenUID[i]);
                        }
                    }
                    /*
                     * Clone a new Axes object using the Axes model which is then
                     * attached to the 'cleaned' Figure.
                     */
                    cloneAxesModel(pFigureUID);

                    AssignOutputVariable(pvApiCtx, 1) = 0;
                    ReturnArguments(pvApiCtx);

                    return 0;
                }
                else
                {
                    Scierror(999, _("%s: Wrong value for input argument #%d: '%s' expected.\n"), fname, 1, "all");
                    return 0;
                }
                break;
            default:
                // Overload
                lw = 1 + nbArgumentOnStack(pvApiCtx) - nbInputArgument(pvApiCtx);
                C2F(overload) (&lw, "delete", 6);
                return 0;
        }
    }

    for (i = 0; i < nb_handles; i++)
    {
        char* pstTemp = NULL;
        if (nbInputArgument(pvApiCtx) != 0)
        {
            hdl = (unsigned long) * (l1 + i); /* Puts the value of the Handle to hdl */
        }

        pobjUID = (char*)getObjectFromHandle(hdl);

        if (pobjUID == NULL)
        {
            Scierror(999, _("%s: The handle is not valid.\n"), fname);
            return 0;
        }

        if (isFigureModel(pobjUID) || isAxesModel(pobjUID))
        {
            Scierror(999, _("This object cannot be deleted.\n"));
            return 0;
        }

        /* Object type */
        getGraphicObjectProperty(pobjUID, __GO_TYPE__, jni_int, (void **)&piObjType);
        if (iObjType == __GO_AXES__)
        {
            /* Parent object */
            getGraphicObjectProperty(pobjUID, __GO_PARENT__, jni_string, (void **)&pstParentUID);
            /* Parent type */
            getGraphicObjectProperty(pstParentUID, __GO_TYPE__, jni_int, (void **)&piParentType);
        }

        if (iObjType == __GO_LABEL__)
        {
            Scierror(999, _("A Label object cannot be deleted.\n"));
            return 0;
        }

        //bug #11485 : duplicate pobjUID before delete it.
        pstTemp = strdup(pobjUID);
        deleteGraphicObject(pobjUID);

        /*
         ** All figure must have at least one axe child.
         ** If the last one is removed, add a new default one.
         */
        if (iObjType == __GO_AXES__ && iParentType == __GO_FIGURE__)
        {
            int iChild = 0;
            int iChildCount = 0;
            int *piChildCount = &iChildCount;
            char **pstChildren = NULL;
            int iChildType = -1;
            int *piChildType = &iChildType;
            int iAxesFound = 0;

            getGraphicObjectProperty(pstParentUID, __GO_CHILDREN_COUNT__, jni_int, (void **)&piChildCount);
            getGraphicObjectProperty(pstParentUID, __GO_CHILDREN__, jni_string_vector, (void **)&pstChildren);
            for (iChild = 0; iChild < iChildCount; iChild++)
            {
                getGraphicObjectProperty(pstChildren[iChild], __GO_TYPE__, jni_int, (void **)&piChildType);
                if (iChildType == __GO_AXES__)
                {
                    if (strcmp(getCurrentSubWin(), pstTemp) == 0) // Current axes has been deleted
                    {
                        setCurrentSubWin(pstChildren[iChild]);
                    }
                    iAxesFound = 1;
                    break;
                }
            }
            if (!iAxesFound)
            {
                /*
                 * Clone a new Axes object using the Axes model which is then
                 * attached to the newly created Figure.
                 */
                cloneAxesModel(pstParentUID);
            }
        }

        FREE(pstTemp);
    }

    if (!dont_overload)
    {
        // Overload
        lw = 1 + nbArgumentOnStack(pvApiCtx) - nbInputArgument(pvApiCtx);
        C2F(overload) (&lw, "delete", 6);
    }
    else
    {
        AssignOutputVariable(pvApiCtx, 1) = 0;
        ReturnArguments(pvApiCtx);
    }

    if (l2)
    {
        freeAllocatedSingleString(l2);
    }

    return 0;
}
