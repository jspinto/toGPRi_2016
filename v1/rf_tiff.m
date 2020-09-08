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

function rf_tiff
global r_A r_colormap r_s_contrast;
r_R=r_A;
r_R=r_R+abs(min(min(r_R)));
r_R_count=max(max(r_R))-min(min(r_R));
r_R=r_R*(255/r_R_count);
r_R=uint8(r_R);
[r_file,r_path,idx]=uiputfile('*.tiff','Save .tiff as');
if(idx==1),
  colormap_tiff=colormap(eval(strcat(r_colormap,"(256)")));
  imwrite (r_R,colormap_tiff,fullfile(r_path,r_file),"quality",100);
endif
return;
endfunction
