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

function rf_hypso
global r_A r_h r_v r_time r_screen;
#Opening the .txt topo file.
[hypso_file,path,idx]=uigetfile("*.hypso;*.asc;*.ascii;*.txt");
if(idx==1),
  fid=fopen(strcat(path,hypso_file),'r');
  #Reading the .txt file and the numerical data.
  [r_hypso_1,r_hypso_2,r_hypso_3]=textread(strcat(path,hypso_file),"%f %f %f");
  fclose(fid);
  r_wbf=waitbar(0.2,"Processing!\n","windowstyle","modal","name","toGPRi","numbertitle","off","color",[0.85,0.85,0.82],...
  "position",[r_screen(3)/2-150,r_screen(4)/2-50,300,100]);
  pause(0.2);
  [r_m,r_n]=size(r_A);
  r_hypso_3=floor(r_hypso_3*100/((r_v/2)*r_time)); #to samples
  r_hypso_3=rot90(r_hypso_3);
  r_hypso_1=floor(r_hypso_1/(r_h/100));
  if r_hypso_1(1)==0;
   r_hypso_1(1)=1;
  endif
  r_hypso_1=rot90(r_hypso_1);
  r_hypso_3_rng=max(r_hypso_3)-min(r_hypso_3);
  r_hypso_1_max=max(r_hypso_1);
  if r_hypso_1_max>r_n,
    r_C=zeros(r_m+r_hypso_3_rng,r_hypso_1_max);
    r_A(:,r_n+1:r_hypso_1_max)=0;
  else,
    r_C=zeros(r_m+r_hypso_3_rng,r_n);
  endif
  waitbar(0.4,r_wbf);
  r_hypso_3=abs(r_hypso_3-max(r_hypso_3));
  [r_hypso_m,r_hypso_n]=size(r_hypso_3);
  r_hypso_1(r_hypso_n+1)=r_n;
  r_hypso_3(r_hypso_n+1)=r_hypso_3(r_hypso_n);
  for p=(1:r_hypso_n),
    if r_hypso_3(p)<r_hypso_3(p+1),
      for q=(r_hypso_1(p):(r_hypso_1(p+1)-1)),
            s=(r_hypso_3(p+1)-r_hypso_3(p))/(r_hypso_1(p+1)-r_hypso_1(p));
            k=r_hypso_3(p)+floor(s*(q-r_hypso_1(p)+1));
              for l=(1:r_m),
                r_C(l+k,q)=r_A(l,q);
              endfor
      endfor
    elseif r_hypso_3(p)>r_hypso_3(p+1),
      for q=(r_hypso_1(p):(r_hypso_1(p+1)-1)),
            s=(r_hypso_3(p)-r_hypso_3(p+1))/(r_hypso_1(p+1)-r_hypso_1(p));
            k=r_hypso_3(p)-floor(s*(q-r_hypso_1(p)+1));
             for l=(1:r_m),
              r_C(l+k,q)=r_A(l,q);
             endfor
      endfor
    else,
      for q=(r_hypso_1(p):(r_hypso_1(p+1)-1)),
        k=r_hypso_3(p);
          for l=(1:r_m),
             r_C(l+k,q)=r_A(l,q);
          endfor
      endfor
    endif
  endfor
  waitbar(0.6,r_wbf);
  pause(0.2);
  waitbar(0.8,r_wbf);
  pause(0.2);
  r_A=r_C;
  waitbar(1,r_wbf);
  pause(0.2);
  close(r_wbf);
  rf_draw;
endif
return;
endfunction
