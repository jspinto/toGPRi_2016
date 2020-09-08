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

function rgb=rf_crwb(r_mm)
#r_mm=size(get(gcf,'colormap'),1);
r_mm1=r_mm*0.5;
vm=(0:r_mm1-1)'/max(r_mm1-1,1);
vd=vm;
vm=[vm;ones(r_mm1,1)];
vd=[vd;flipud(vd)];
az=flipud(vm);
rgb=[vm,vd,az]; 
endfunction
