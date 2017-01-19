#
# ~/.bash_profile
#

[[ -f ~/.extend.bash_profile ]] && . ~/.extend.bash_profile
[[ -f ~/.bashrc ]] && . ~/.bashrc


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/antoine/.sdkman"
[[ -s "/home/antoine/.sdkman/bin/sdkman-init.sh" ]] && source "/home/antoine/.sdkman/bin/sdkman-init.sh"
