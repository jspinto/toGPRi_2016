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

function rf_ratio
global r_aspect_hr r_aspect_vr;
r_ratio=inputdlg([{"Horiz.: ","Vert.: "}],"s/t ratio",1,[{"1","1"}]);
if (isempty(r_ratio)~=1&&isempty(r_ratio{1})~=1&&isempty(r_ratio{2})~=1&&str2num(r_ratio{1})>0&&str2num(r_ratio{2})>0),
  r_aspect_hr=str2num(r_ratio{1});
  r_aspect_vr=str2num(r_ratio{2});
  rf_draw;
endif
return;
endfunction
