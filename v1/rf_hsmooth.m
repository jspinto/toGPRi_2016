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

#Simple average horizontal filter
function rf_hsmooth
global r_A r_screen
[r_m,r_n]=size(r_A);
r_hsm=inputdlg({"Sample from: ","Sample to: ","Trace from: ","Trace to: ","Percentage: "},...
 "Horizontal smooth",1,{"1",num2str(r_m),"1",num2str(r_n),"1"});
if (isempty(r_hsm)~=1&&isempty(r_hsm{1})~=1&&isempty(r_hsm{2})~=1&&isempty(r_hsm{3})~=1&&str2num(r_hsm{4})>0&&...
  isempty(r_hsm{5})~=1&&str2num(r_hsm{5})<=100),
  r_wb=waitbar(0.3,"Processing!\n","windowstyle","modal","name","toGPRi","numbertitle","off","color",[0.85,0.85,0.82],...
  "position",[r_screen(3)/2-150,r_screen(4)/2-50,300,100]);
  r_hsm_from_s=str2num(r_hsm{1});
  r_hsm_to_s=str2num(r_hsm{2});
  r_hsm_from_t=str2num(r_hsm{3});
  r_hsm_to_t=str2num(r_hsm{4});
  r_hsm_factor=str2num(r_hsm{5})/100;
  waitbar(0.7,r_wb);
  for i=(r_hsm_from_s:r_hsm_to_s),
    r_B=r_A(i,r_hsm_from_t:r_hsm_to_t);
    r_B_pos=r_B(r_B>0);
    r_B_neg=r_B(r_B<0);
    r_h_pos_mean=mean(r_B_pos);
    r_h_neg_mean=mean(r_B_neg);
    for j=(r_hsm_from_t:r_hsm_to_t),
      if (r_A(i,j)>r_h_pos_mean),
       r_A(i,j)=r_A(i,j)-(r_hsm_factor*(r_A(i,j)-r_h_pos_mean));
      elseif (r_A(i,j)<r_h_pos_mean&&r_A(i,j)>0),
       r_A(i,j)=r_A(i,j)+(r_hsm_factor*(r_h_pos_mean-r_A(i,j)));
      elseif (r_A(i,j)>r_h_neg_mean&&r_A(i,j)<0),
        r_A(i,j)=r_A(i,j)+(r_hsm_factor*(r_h_neg_mean-r_A(i,j)));
      elseif (r_A(i,j)<r_h_neg_mean),
        r_A(i,j)=r_A(i,j)-(r_hsm_factor*(r_A(i,j)-r_h_neg_mean));
      endif
    endfor
  endfor
  waitbar(1,r_wb);
  pause(0.2);
  close(r_wb);
  rf_draw;
endif
return;
endfunction

