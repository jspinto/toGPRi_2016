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

function rb_load
#Opening the .rad file.
[rad_file,path,idx]=uigetfile("*.rad");
if(idx==1),
  fid=fopen(strcat(path,rad_file),'r');
  #Reading the .rad file and the numerical data (not all numbers, loaded as strings).
  global r_info=rot90(textread(strcat(path,rad_file),"%*s %s","delimiter",":"));
  fclose(fid);
  #Now the data are in r_info (1x38). Setting up a string vector with the info.
  global r_info_cat=strcat(...
  {" "},"MEASUREMENT INFO:\n\n",
  {" "},"Number of samples:",{" "},r_info(1),"\n","\n",...
  {" "},"Number of traces:",{" "},r_info(23),"\n","\n",...
  {" "},"Nominal frequency:",{" "},r_info(2),{" "},"\n","\n",...
  {" "},"Time interval:",{" "},r_info(10),{" "},"s","\n","\n",...
  {" "},"Antenna:",{" "},r_info(15),"\n","\n",...
  {" "},"Antenna separation:",{" "},r_info(17),{" "},"m","\n","\n",...
  {" "},"Time window:",{" "},r_info(19),{" "},"ns","\n","\n",...
  {" "},"Stacking time:",{" "},r_info(22),{" "},"s","\n","\n",...
  {" "},"Between traces",{" "},r_info(11),{" "},"m"
  );
  #Opening the .rd3 file.
  rd3_file=strrep(rad_file,".rad",".rd3");
  fid=fopen(strcat(path,rd3_file),"r");
  #Bringing about the 2D matrix.
  global r_A=fread(fid,[str2num(r_info{1}),str2num(r_info{23})],"short");
  fclose(fid);
  #Displacing the matrix to zero.
  r_A=r_A-round(mean(mean(r_A)));
  #A copy with original geommetry.
  global r_B=r_A;
  #Setting up the global vars for colormap and contrast.
  global r_colormap="rf_crwb";
  global r_s_contrast="(64)";
  #To rf_meter_axes.
  global r_rfma=0;
  #Calling function to draw.
  rf_draw;
  return;
endif
endfunction
