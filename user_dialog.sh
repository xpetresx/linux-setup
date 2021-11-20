#!/usr/bin/env bash
source config

#the options 
options="_tmux `(if [ ${INSTALL_TMUX} -eq 1 ]; then echo "on"; else echo "off"; fi)`
tmux_autostart `(if [ ${INSTALL_TMUX_AUTOSTART} -eq 1 ]; then echo "on"; else echo "off"; fi)`
_vim `(if [ ${INSTALL_VIM} -eq 1 ]; then echo "on"; else echo "off"; fi)`
vim_ycm `(if [ ${INSTALL_VIM_YCM} -eq 1 ]; then echo "on"; else echo "off"; fi)`
ranger `(if [ ${INSTALL_RANGER} -eq 1 ]; then echo "on"; else echo "off"; fi)`
ros `(if [ ${INSTALL_ROS} -eq 1 ]; then echo "on"; else echo "off"; fi)`
tex `(if [ ${INSTALL_TEX} -eq 1 ]; then echo "on"; else echo "off"; fi)`
pdf_tools `(if [ ${INSTALL_PDF_TOOLS} -eq 1 ]; then echo "on"; else echo "off"; fi)`
image_tools `(if [ ${INSTALL_IMAGE_TOOLS} -eq 1 ]; then echo "on"; else echo "off"; fi)`
krita `(if [ ${INSTALL_KRITA} -eq 1 ]; then echo "on"; else echo "off"; fi)`
video_tools `(if [ ${INSTALL_VIDEO_TOOLS} -eq 1 ]; then echo "on"; else echo "off"; fi)`
kdenlive `(if [ ${INSTALL_KDENLIVE} -eq 1 ]; then echo "on"; else echo "off"; fi)`"
echo "$options"

#the dialog
cmd=(dialog --stdout --no-items \
  --separate-output \
  --ok-label "Install" \
  --checklist "Choose configuration: hit space to mark option" 22 76 16)
choices=$("${cmd[@]}" ${options})
echo "${choices}"
if [[ $choices == *"_tmux"* ]]; then
  INSTALL_TMUX=1
else
  INSTALL_TMUX=0
fi
if [[ $choices == *"tmux_"* ]]; then
  INSTALL_TMUX_AUTOSTART=1
else
  INSTALL_TMUX_AUTOSTART=0
fi
if [[ $choices == *"_vim"* ]]; then
  INSTALL_VIM=1
else
  INSTALL_VIM=0
fi
if [[ $choices == *"vim_"* ]]; then
  INSTALL_VIM_YCM=1
else
  INSTALL_VIM_YCM=0
fi
if [[ $choices == *"ranger"* ]]; then
  INSTALL_RANGER=1
else
  INSTALL_RANGER=0
fi
if [[ $choices == *"ros"* ]]; then
  INSTALL_ROS=1
else
  INSTALL_ROS=0
fi
if [[ $choices == *"tex"* ]]; then
  INSTALL_TEX=1
else
  INSTALL_TEX=0
fi
if [[ $choices == *"pdf_tools"* ]]; then
  INSTALL_PDF_TOOLS=1
else
  INSTALL_PDF_TOOLS=0
fi
if [[ $choices == *"image_tools"* ]]; then
  INSTALL_IMAGE_TOOLS=1
else
  INSTALL_IMAGE_TOOLS=0
fi
if [[ $choices == *"krita"* ]]; then
  INSTALL_KRITA=1
else
  INSTALL_KRITA=0
fi
if [[ $choices == *"video_tools"* ]]; then
  INSTALL_VIDEO_TOOLS=1
else
  INSTALL_VIDEO_TOOLS=0
fi
if [[ $choices == *"kdenlive"* ]]; then
  INSTALL_KDENLIVE=1
else
  INSTALL_KDENLIVE=0
fi
