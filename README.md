# toGPRi
A tiny GNU Octave ground-penetrating radar integration of tools. 

toGPRi v1 tools have been created for primarily analyzing RAMAC© ground-penetrating radar data and for building 3D matrices to generate georeferencied rasters of underground elements.

toGPRi v1 is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

toGPRi v1 is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with this program.  If not, see <http://www.gnu.org/licenses/>.

Copyright 2016 Javier Sanjurjo Pinto <javier.sanjurjo.p@gmail.com>.

What the toGPRi v1 tools can do?

At this moment toGPRi v1 can open .rd3 Måla files, read .rad data files and display the 2D associated radargram with different color maps and contrast levels.

toGPRi v1 can apply several filters to these data: a time zero cut, a linear and an exponential gain recovery, a basic mean trace removal, a smoothing filter and a noise put-out. Besides this, the wavelet for any trace can be watched at any stage.

It is also possible to use 3 columns plain text files to generate hypsography variations.

In respect of 3D options:

toGPRi v1 can be used to generate a series of 2D points .xyz files associated to the filtered profiles of a prospection (usable to originate a point cloud) and a GNU Octave three dimensional matrix wearable to automatically draw georeferencied overlaid raster images at different levels of depth. 
