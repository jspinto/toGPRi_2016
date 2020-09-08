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

function r3_xyz
warndlg("This function will create a new .xyz files and will delete any other older ones in the folder you are going to choose.");
r_dir=uigetdir;
r_pattern=inputdlg([{"Pattern before: ","Number since: ","Number to: ","Pattern after: ",...
  "Distance between traces (cm): ","Distance between profiles (cm): ","Time window: ",...
  "Orig. max. samples: ","Average velocitiy (cm/ns): "}],...
  "Profiles",1,[{"","","",".gpr","","","","",""}]);
if (isempty(r_pattern)~=1&&isempty(r_pattern{1})~=1&&isempty(r_pattern{2})~=1&&isempty(r_pattern{3})~=1&&...
  isempty(r_pattern{4})~=1&&isempty(r_pattern{5})~=1&&isempty(r_pattern{6})~=1&&isempty(r_pattern{7})~=1&&...
  isempty(r_pattern{8})~=1&&isempty(r_pattern{9})~=1);  
  r_pattern_num_s=str2num(r_pattern{2});
  r_pattern_num_t=str2num(r_pattern{3});
  r_otw=str2num(r_pattern{7});
  r_oms=str2num(r_pattern{8});
  r_av=str2num(r_pattern{9});
  r_z_factor=(r_otw/r_oms)*(r_av/2);
  l=(r_pattern_num_t-r_pattern_num_s)+1;
  r_wb=waitbar(0.1,strcat("Testing geommetry for",{" "},num2str(l),{" "},"profiles."),...
      "color",[0.85,0.85,0.82]);
  mra=1;
  nra=1;
  waitbar(0.3,r_wb);
  pause(0.5)
  waitbar(0.5,r_wb);
  #Discarding layers.
  r_shapes=inputdlg([{"Layer from: ","Layer to: "}],"Layers",1,[{"1",""}]);
  shape_s=str2num(r_shapes{1});
  shape_t=str2num(r_shapes{2});
  waitbar(0.7,r_wb);
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
  #Changing and loading profiles.
  r_total_prof=r_pattern_num_t-r_pattern_num_s+1;
  r_wb2=waitbar(0.1,strcat("Saving profile",{" "},num2str(k),{" "},"of",{" "},num2str(l)),"color",[0.85,0.85,0.82]);
  for (i=(r_pattern_num_s:r_pattern_num_t)),
    waitbar(0.3,r_wb2,strcat("Saving profile",{" "},num2str(k),{" "},"of",{" "},num2str(l)),"color",[0.85,0.85,0.82]);
    r_gpr=fullfile(r_dir,strcat(r_pattern{1},num2str(i),r_pattern{4}));
    load(r_gpr);
    r_A=resize(r_A,mra,nra);
    r_A=r_A(shape_s:shape_t,:);
    waitbar(0.5,r_wb2);
    r_inv_i=r_total_prof-k+1;
    ##Profiles/traces
    y=str2num(r_pattern{6})*r_inv_i;
    [r_m,r_n]=size(r_A);
    r_B=reshape(r_A,(r_m*r_n),1);
    z=r_m:-1:1;
    z=z';
    z=-z;
    z=z*r_z_factor;
    z=repmat(z,r_n,1);
    x=1:1:r_n;
    x=kron(x,ones(1,r_m));
    x=x';
    x=x*str2num(r_pattern{5})
    y0=zeros(r_m*r_n,1);
    y=y0+y;
    r_C=[x,y,z,r_B];
    waitbar(0.7,r_wb2);
    r_C((r_C(:,4)==0),:)=[];
    clear x y z0 z r_B;
    r_file=strcat(r_pattern{1},num2str(i),r_pattern{4},".xyz");
    dlmwrite(fullfile(r_dir,r_file),r_C,"delimiter"," ","newline","\n");
    k=k+1;
    waitbar(1,r_wb2);
  endfor
  pause(0.5);
  close(r_wb2);
endif
return;
endfunction
