#!/bin/sh

cd drowaudio-distortionshaper_modgui.lv2
echo "Research drowaudio-distortionshaper.lv2"

FOLDER=`sudo find / -iname drowaudio-distortionshaper.lv2 | grep -v data`

if [ -z $FOLDER ]; 

then

	echo "folder drowaudio-distortionshaper.lv2 not found"
	
else
	if [ -f $FOLDER/manifest.ttl ];
	then
		echo "copy files to $FOLDER"
		sudo cp -r * $FOLDER
		sudo rm -r $FOLDER/install_drowaudio-distortionshaper_modgui.sh
		echo "add entry to manifest"
		sudo printf "\n\n<http://www.drowaudio.co.uk/audio/audio_plugins/distortion_shaper> rdfs:seeAlso <modgui.ttl> ." >> $FOLDER/manifest.ttl
	else
		echo "manifest.dll not found ... error"
	fi
fi

cd ..