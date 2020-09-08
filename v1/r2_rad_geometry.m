#{
This file is part of toGPRi tools v1.

toGPRi 0.1 is free software: you can redistribute it and/or modify it under the terms of the GNU General
Public License as published by the Free Software Foundation, either version 3 of the License, or (at your
option) any later version.

toGPRi 0.1 is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the
implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public
License for more details.

You should have received a copy of the GNU General Public License along with toGPRi 0.1. If not, see
<http://www.gnu.org/licenses/>.

Copyright 2016 Javier Sanjurjo Pinto.
#}

function r2_rad_geometry
r_dir=uigetdir;
r_pattern=inputdlg([{"Pattern before: ","Number since: ","Number to: ","Pattern after: "}],...
  "Profiles",1,[{"","","",".rad"}]);
if (isempty(r_pattern)~=1&&isempty(r_pattern{1})~=1&&isempty(r_pattern{2})~=1&&...
  isempty(r_pattern{3})~=1&&isempty(r_pattern{4})~=1),
  r_pattern_num_s=str2num(r_pattern{2});
  r_pattern_num_t=str2num(r_pattern{3});
  l=(r_pattern_num_t-r_pattern_num_s)+1;
  r_wb=waitbar(0.1,strcat("Testing geommetry from",{" "},num2str(l),{" "},"rad files"),...
      "color",[0.85,0.85,0.82]);
  mglob=1;
  nglob=1;
  waitbar(0.3,r_wb);
  pause(0.5)
  waitbar(0.5,r_wb);
  #Checking geometries.
  for (g=(r_pattern_num_s:r_pattern_num_t)),
    r_rad=fullfile(r_dir,strcat(r_pattern{1},num2str(g),r_pattern{4}));
    fid=fopen(r_rad,'r');
    #Reading the .rad file and the numerical data (not all numbers, loaded as strings).
    r_info=rot90(textread(r_rad,"%*s %s","delimiter",":"));
    fclose(fid);
    #Now the data are in r_info (1x38). Setting up a string vector with the info.
    m=str2num(r_info{1});
    n=str2num(r_info{23});
    if (m>mglob),
      mglob=m;
    endif
    if (n>nglob),
      nglob=n;
    endif
  endfor
  waitbar(1,r_wb);
  pause(0.5);
  close(r_wb);
  warndlg(strcat("Samples:",{" "},num2str(mglob),{" "},"Traces",{" "},num2str(nglob)),"Checking geometries");
endif
return;
endfunction
