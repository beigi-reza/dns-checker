#!/bin/bash
RC="$(tput setaf 0)" # Reset Color
C1="$(tput setaf 39)"
C2="$(tput setaf 38)"
C3="$(tput setaf 37)"
C4="$(tput setaf 36)"
C5="$(tput setaf 35)"
C6="$(tput setaf 34)"

echo $C1"      ____  _   _______    ________         __                ______    "$RC
echo $C2"     / __ \/ | / / ___/   / ____/ /_  ___  / /_____  _____    \ \ \ \   "$RC
echo $C3"    / / / /  |/ /\__ \   / /   / __ \/ _ \/ //_/ _ \/ ___/     \ \ \ \  "$RC
echo $C4"   / /_/ / /|  /___/ /  / /___/ / / /  __/ ,< /  __/ /         / / / /  "$RC
echo $C5"  /_____/_/ |_//____/   \____/_/ /_/\___/_/|_|\___/_/         /_/_/_/   "$RC
echo $C6"                                                                        "$RC

## Color
LocationColour="$(tput bold)$(tput setaf 33)"
CompantyColour="$(tput bold)$(tput setaf 45)"
IPColour="$(tput setaf 18)"
DNSColour="$(tput bold)$(tput setaf 192)"

white="$(tput setaf 7)" # white
white_bold="$(tput bold)$(tput setaf 15)" # white Hilight
green_bold="$(tput bold)$(tput setaf 2)" # Green
blue_bold="$(tput bold)$(tput setaf 4)" # Blue
red_bold="$(tput bold)$(tput setaf 9)" # red
yellow_bold="$(tput bold)$(tput setaf 3)" # red
teal_bold="$(tput bold)$(tput setaf 6)" # red
RC="$(tput sgr 0)" # Reset Color
##


RC="$(tput sgr 0)" # Reset Color
##
DNSFileList=/home/beigi/Documents/myFiles/shell-scripts/dnsckeker/dnslist.txt
DNSLocation=1
DNSIP=1
DNSCompany=1


####################################################################################################
 #######             ################################################################################
  #######  Function   ################################################################################
 #######             ################################################################################
####################################################################################################

FnHelp(){
    echo ""
    echo "$red_bold Help$RC : |$white_bold Check DNS Propagation worldwide.$yellow_bold DNS Checker$white_bold provides name server propagation$yellow_bold check instantly$RC |"
    echo "$red_bold   Ex$RC : | dnscheker <$white_bold%1$RC>                                                                                |"
    echo "$RC        | dnscheker$teal_bold www.ronix.ir $RC                                                                       |"
    echo "$RC        | dnscheker$teal_bold ronixtools.com $RC                                                                     |"
    echo "$RC        | dnscheker$teal_bold pro.ronixtools.com $RC                                                                 |"

    echo ""

    exit
}

FnStartCheck (){    
    NumberOfDNS=$(awk 'END { print NR }' $DNSFileList)
    cuntx=1    
    while [ $cuntx -le $NumberOfDNS ]
    do    
       DNSLocation=$(awk -F: 'NR=='$cuntx'{print $1}' $DNSFileList)
       DNSCompany=$(awk -F: 'NR=='$cuntx'{print $2}' $DNSFileList)
       DNSIP=$(awk -F: 'NR=='$cuntx'{print $3}' $DNSFileList)                            
       DNSResolve=$(dig @$DNSIP $1 +short)
       echo "$LocationColour $DNSLocation [$CompantyColour $DNSCompany $LocationColour]$RC $IPColour $DNSIP $LocationColour >>> $DNSColour $DNSResolve"
       cuntx=`expr $cuntx + 1`
    done
}

FncheckDNSLocal (){
   DNSResolve=$(dig $1 +short)
   DNSLocation="IRAN"
   DNSCompany="Ronix"
   DNSIP="-.-.-.-"
   echo "$green_bold--------------- LOCAL ------------------"
   echo "$LocationColour $DNSLocation [$CompantyColour $DNSCompany $LocationColour]$RC $IPColour $DNSIP $LocationColour >>> $DNSColour $DNSResolve"
   echo "$green_bold--------------- LOCAL ------------------$RC"

}



####################################################################################################
 #######             ################################################################################
  #######  Function   ################################################################################
 #######             ################################################################################
####################################################################################################


if [ -z "$1" ]
then    
    echo "$RC Parameter '$white_bold #1 $RC' is Empty"
    echo "$RC For help type '$white_bold Help$RC or$wh ite_bold -help$RC' after Command."
    exit
fi


if [ $1 = "help" -o $1 = "-h" -o $1 = "--help" -o $1 = "h" -o $1 = "?" ] ; then
    FnHelp
fi

FncheckDNSLocal $1
FnStartCheck $1
