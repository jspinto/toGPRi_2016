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

function r3_matrix
global AY3D;
warndlg("This function will create a new 3D matrix and will delete any other older one in the folder you are going to choose.");
r_dir=uigetdir;
r_pattern=inputdlg([{"Pattern before: ","Number since: ","Number to: ","Pattern after: "}],...
  "Profiles",1,[{"","","",".gpr"}]);
if (isempty(r_pattern)~=1&&isempty(r_pattern{1})~=1&&isempty(r_pattern{2})~=1&&...
  isempty(r_pattern{3})~=1&&isempty(r_pattern{4})~=1),
  r_pattern_num_s=str2num(r_pattern{2});
  r_pattern_num_t=str2num(r_pattern{3});
  l=(r_pattern_num_t-r_pattern_num_s)+1;
  r_wb=waitbar(0.1,strcat("Testing geommetry for",{" "},num2str(l),{" "},"profiles."),...
      "color",[0.85,0.85,0.82]);
  mra=1;
  nra=1;
  waitbar(0.3,r_wb);
  pause(0.5)
  waitbar(0.5,r_wb);
  #Checking geometries.
  for (g=(r_pattern_num_s:r_pattern_num_t)),
    r_gpr=fullfile(r_dir,strcat(r_pattern{1},num2str(g),r_pattern{4}));
    load(r_gpr);
    [r_m,r_n]=size(r_A);
    if (r_m>mra),
      mra=r_m;
    endif
    if (r_n>nra),
      nra=r_n;
    endif
  endfor
  waitbar(1,r_wb);
  pause(0.5);
  close(r_wb);
  k=1;
  #Loading profiles.
  r_total_prof=r_pattern_num_t-r_pattern_num_s+1;
  r_wb=waitbar(0.1,"Reading profiles.","color",[0.85,0.85,0.82]);
  for (i=(r_pattern_num_s:r_pattern_num_t)),
    waitbar(0.3,r_wb,strcat("Reading profile",{" "},num2str(k),{" "},"of",{" "},num2str(l)));
    r_gpr=fullfile(r_dir,strcat(r_pattern{1},num2str(i),r_pattern{4}));
    load(r_gpr);
    r_A=resize(r_A,mra,nra);
    r_inv_i=r_total_prof-k+1;
    AY3D(:,:,r_inv_i)=r_A;
    k=k+1;
  endfor
  waitbar(0.5,r_wb,"Finishing. Please, wait.");
  waitbar(0.7,r_wb);
  pause(0.25);
  save("-binary",fullfile(r_dir,"3D.b"),"AY3D");
  waitbar(1,r_wb);
  pause(0.25);
  close(r_wb);
endif
return;
endfunction
