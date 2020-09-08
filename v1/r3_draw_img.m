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

function r3_draw_img
clear;
PAGER("less > /dev/null");
pkg load image;
r_dir=uigetdir;
if (exist(fullfile(r_dir,"3D.b"),"file")~=2),
  warndlg("A 3D matrix has not been previously generated.");
else,
  global AY3D r3_cmxsmp r3_cmtrz r_asp_h r_asp_v r3_wsl r3_horiz r3_vert r3_raster_window_axes r_window_menu;
  close all;
  r_wb=waitbar(0.1,"Loading the 3D matrix.","color",[0.85,0.85,0.82]); 
  load(fullfile(r_dir,"3D.b")); 
  waitbar(0.3,r_wb);
  r3_samples=size(AY3D(:,1,:),1);
  waitbar(0.5,r_wb);
  r3_traces=size(AY3D(1,:,:),2);
  waitbar(0.7,r_wb);
  r3_profiles=size(AY3D(1,:,:),3)
  waitbar(1,r_wb);
  pause(0.1);
  delete(r_wb);
  r3_vel_time=inputdlg([{"Average velocity (cm/ns): ","Time window (ns): ",...
    "Distance between traces (cm):","Distance between profiles (cm):"}],"Data",1,...
    [{"10"},{"10"},{"10"},{"10"}]);
  if (isempty(r3_vel_time)~=1&&isempty(r3_vel_time{1})~=1&&isempty(r3_vel_time{2})~=1&&...
    isempty(r3_vel_time{3})~=1&&isempty(r3_vel_time{4})~=1),
    r3_vel=str2num(r3_vel_time{1});
    r3_time=str2num(r3_vel_time{2});
    r3_cmtrz=str2num(r3_vel_time{3});
    r3_cmprf=str2num(r3_vel_time{4});
    r3_cmxsmp=(r3_vel*r3_time)/(r3_samples*2);
    r3_horiz=(r3_cmtrz*r3_traces/100);
    r3_vert=(r3_cmprf*r3_profiles/100);
    r_asp_v=r3_cmprf/r3_cmtrz;
    r_asp_h=1;
    r3_screen=get(0,'ScreenSize');
    r3_raster_window=figure("position",[100 100 r3_screen(3)*0.8 r3_screen(4)*0.8],"name","toGPRi - Depth raster");
    r3_image_menu=uimenu("label","Image","parent",r3_raster_window);
    uimenu(r3_image_menu,"label","H/V ratio","accelerator","o","callback",@rf3_ratio);
    uimenu(r3_image_menu,"label","Overlay raster","accelerator","r","callback",@rf3_draw_overlay);
    r3_wsl=uicontrol("style","slider","min",1,"max",r3_samples,...
      "sliderstep",[1 10]./(r3_samples-1),"value",1,...
      "position",[10 10 75 200],"callback",@rf3_dial);
    r3_raster_window_axes=axes("parent",r3_raster_window);
    endif
  endif
  return;
endfunction

function rf3_dial
global AY3D r3_cmxsmp r3_M r_asp_v r_asp_h r3_wsl r3_horiz r3_vert r3_raster_window_axes;
r3_dial=round(get(r3_wsl,"value"));
r3_M=AY3D(r3_dial,:,:);
r3_M=squeeze(r3_M);
r3_text_dial=num2str(r3_dial);
r3_t2=uicontrol("style","text",...
  "string",strcat("Layer\n\n",r3_text_dial,"\n\n\n","Depth\n\n",num2str(round(r3_cmxsmp*r3_dial*10)/10),"\n\n","cm."),...
  "position",[95 10 75 200]);
r3_image=imagesc("parent",r3_raster_window_axes,rot90(r3_M,1));
set(r3_raster_window_axes,"xlabel","traces","ylabel","profiles","dataaspectratio",[r_asp_v,r_asp_h,1],"layer","top");
r3_colormap=jet(256);
colormap(r3_colormap);
r_cb=colorbar(r3_raster_window_axes,"location","eastoutside");
endfunction

function rf3_ratio
global r_asp_h r_asp_v;
r_ratio=inputdlg([{"Horiz.: ","Vert.: "}],"h/v ratio",1,[{"1","1"}]);
if (isempty(r_ratio)~=1&&isempty(r_ratio{1})~=1&&isempty(r_ratio{2})~=1),
  r_asp_h=str2num(r_ratio{1});
  r_asp_v=str2num(r_ratio{2});
  ##Drawing again.
  rf3_dial;
endif
return;
endfunction

function rf3_draw_overlay
global AY3D r3_horiz r3_vert r_asp_v r_asp_h r3_Q r3_overlay_window r3_overlay_from r3_overlay_to;
r3_screen=get(0,'ScreenSize');
r3_overlay_window=figure("position",[110 110 r3_screen(3)*0.8 r3_screen(4)*0.8],"name","toGPRi - Overlay raster","visible","off");
r3_overlay_window_axes=axes("parent",r3_overlay_window);
r3_image_menu=uimenu("label","Image","parent",r3_overlay_window);
  uimenu(r3_image_menu,"label","Save TIFF files","accelerator","s","callback",@rf3_tiff);
r3_overlay_select=inputdlg([{"From: ","To: "}],"Overlay",1,[{"1"},{"1"}]);
if (isempty(r3_overlay_select)~=1&&isempty(r3_overlay_select{1})~=1&&isempty(r3_overlay_select{2})~=1),
  r3_overlay_from=str2num(r3_overlay_select{1});
  r3_overlay_to=str2num(r3_overlay_select{2});
  for (i=r3_overlay_from:r3_overlay_to),
    r3_Q=AY3D(i,:,:);
    r3_Q=squeeze(r3_Q);
    r3_surface_overlay=surface(rot90(r3_Q,3),"edgecolor","none","facecolor","flat","displayname","toGPRi - Overlay raster");
    hold on;
  endfor;
  r3_ctrl=uicontrol("style","text","string",strcat(r3_overlay_select{1},"-",r3_overlay_select{2}),"position",[10 10 50 50])
  set(r3_overlay_window_axes,"xdir","reverse","dataaspectratio",[r_asp_v,r_asp_h,1],"layer","top");
  set(r3_overlay_window_axes,"visible","off");
  r3_colormap=jet(256);
  colormap(r3_colormap);
  set(r3_overlay_window,"visible","on");
endif
return;  
endfunction

function rf3_tiff
global AY3D r3_overlay_from r3_overlay_to r_asp_v r3_cmtrz;
r3_R=AY3D(r3_overlay_from:r3_overlay_to,:,:);
r3_overlay_quest=questdlg("Overlay way","Overlay","Mean","Max","Min","Mean");
if strcmp(r3_overlay_quest,"Mean"),
r3_R=mean(r3_R,1);
endif
if strcmp(r3_overlay_quest,"Max"),
r3_R=max(max(r3_R,1));
endif
if strcmp(r3_overlay_quest,"Min"),
r3_R=min(min(r3_R,1));
endif
r3_R=squeeze(r3_R);
r3_R=r3_R+abs(min(min(r3_R)));
r3_R_count=max(max(r3_R))-min(min(r3_R));
r3_R=r3_R*(255/r3_R_count);
r3_R=uint8(r3_R);
r3_R_Rot=rot90(r3_R,1);
[r_file,r_path]=uiputfile('*.tiff','Save .tiff as');
imwrite(r3_R_Rot,fullfile(r_path,r_file));
pause(0.1);
[m n]=size(r3_R_Rot);
r3_RI=imread(strcat(r_path,r_file));
pause(0.1);
#if interp2 -> size/2
r3_RI=imresize(r3_RI,[m*r_asp_v n]);
pause(0.1);
r3_R_3ch(:,:,1)=r3_RI;
r3_R_3ch(:,:,2)=r3_RI;
r3_R_3ch(:,:,3)=r3_RI;
r3_alpha_quest=questdlg("Alpha channel?","Alpha","No","Yes","No");
if strcmp(r3_alpha_quest,"Yes"),
  r3_alpha_input=inputdlg([{"Transparency (pixels 0-255): "}],"Transparency",1,[{"0"}]);
  if (isempty(r3_alpha_input)~=1&&isempty(r3_alpha_input{1})>=0&&isempty(r3_alpha_input{1})<=255),
    r3_alpha_value=str2num(r3_alpha_input{1});
    r3_R_alpha=r3_RI;
    r3_R_alpha(r3_R_alpha<=r3_alpha_value)=0;
    r3_R_alpha(r3_R_alpha>r3_alpha_value)=255;
    imwrite(r3_R_3ch,strcat(r_path,r_file),"alpha",r3_R_alpha,"quality",100);
  else,
    return;
  endif
elseif strcmp(r3_alpha_quest,"No"),
  imwrite(r3_RI,jet(256),strcat(r_path,r_file),"quality",100);
endif
#Georeferencing.
r3_geo_quest=questdlg("Georeference?","Georeferencing","No","Yes","No");
if strcmp(r3_geo_quest,"Yes"),
  ##WLD file.
  pixel=r3_cmtrz/100;
  r3_wld_input=inputdlg([{"UTM X: ","UTM Y: ","EPSG (UTM): ","Rotation (clockwise, in degrees): "}],"World file",1,...
      [{"000000.0"},{"0000000.0"},{"0000"},{"0"}]);
  r3_wld=[0;0;0;0;0;0];
  r3_wld(5)=str2num(r3_wld_input{1});
  r3_wld(6)=str2num(r3_wld_input{2});
  r3_epsg=r3_wld_input{3};
  r3_orient=str2num(r3_wld_input{4});
  if(r3_orient>360),
    warndlg("Max. 360º");
  else,
      r3_wld(1)=pixel*cosd(r3_orient);
      r3_wld(2)=-(pixel*sind(r3_orient));
      r3_wld(3)=-(pixel*cosd(90-r3_orient));
      r3_wld(4)=-(pixel*sind(90-r3_orient));
  endif
  r3_wld_rep=strrep(r_file,".tiff",".wld");
  r3_str_wld_file=strcat(r_path,r3_wld_rep);
  dlmwrite(r3_str_wld_file,r3_wld,"precision",10);
  ##GDAL.
  r3_geotiff_rep=strrep(r_file,".tiff",".geo.tiff");
  r3_str_geotiff_file=strcat(r_path,r3_geotiff_rep);
  system(strcat("gdalwarp -overwrite -t_srs EPSG:",r3_epsg,{" "},strcat(fullfile(r_path,r_file)),{" "},r3_str_geotiff_file));
  ###KML and WGS84 Geo. Coords.
  r3_geotiff_wgs84_rep=strrep(r_file,".tiff",".wgs84.geo.tiff");
  r3_str_geotiff_wgs84_file=strcat(r_path,r3_geotiff_wgs84_rep);
  system(strcat("gdalwarp -overwrite -t_srs EPSG:4326",{" "},r3_str_geotiff_file,{" "},r3_str_geotiff_wgs84_file));
  r3_kml_rep=strrep(r_file,".tiff",".kmz");
  r3_str_kml_file=strcat(r_path,r3_kml_rep);
  system(strcat("gdal_translate -of KMLSUPEROVERLAY",{" "},r3_str_geotiff_wgs84_file,{" "},r3_str_kml_file,{" "},"-co altitudemode=clampToGround -co altitude=2 -co format=png"));
elseif strcmp(r3_alpha_quest,"No"),
;
endif
  warndlg("Finished!");
return;
endfunction
