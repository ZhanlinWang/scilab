// =============================================================================
// Scilab ( http://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2008 - INRIA - Serge STEER <serge.steer@scilab.org>
// Copyright (C) 2008 - DIGITEO - Pierre MARECHAL <pierre.marechal@scilab.org>
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- CLI SHELL MODE -->

//build the list of loaded libs

%libs=[];

for %name=who('local')'
  if %name<>'ans' then
    execstr('%typ=type('+%name+')');
    if %typ==14 then 
      if and(%name<>['parameterslib','simulated_annealinglib','genetic_algorithmslib','scilab2fortranlib']) then
        %libs=[%libs %name];
      end
    end
  end
end

for Lib=%libs
  execstr('funs=string('+Lib+')''');
  funs(1)=[];
  funcprot(0);
  for fun=funs
    if execstr('f='+fun','errcatch')==0 then
      if type(f)==13 then
        if execstr("add_profiling(fun)"    ,"errcatch"  ) <> 0 then pause,end
        if execstr("remove_profiling(fun)" ,"errcatch" )  <> 0 then pause,end
        if execstr("c=bytecode(f)"         ,"errcatch"  ) <> 0 then pause,end
        if execstr("c1=bytecode("+fun+")"  ,"errcatch"  ) <> 0 then pause,end
        if c<>c1 then pause,end
      end
    end
  end
end
