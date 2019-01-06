wm title . {Query site ip?}
wm iconname . {Query site ip?}
wm geometry . 225x65+500+100
#
# Author :  DFL
# Version : 1.1
# Date :    Sep 2008
# Licence : Creative Commons BY-SA
# Description
#     uses ping to get the public ip address of my network
#     this is much faster than a browser
# Version Comment:
#     it relies on home hosted web site
#
#

# This is not part of the package, it needs to be copied here
image create photo infopic -file [file join $tk_library images info.gif]

set pingreply {}
# windows XP
set pingreply [exec ping -n 1 davelevy.dyndns.info]
set address [ lindex $pingreply 2 ]
set daddress [ string trim $address {[]} ]

# needs an if dhcp line

set messagetext  " public tcp/ip no : $daddress"
set buttontext " Done "

frame .top 
frame .bottom

label .top.icon  -image infopic
frame .top.f -width 50
label .top.f.mess -text $messagetext

pack .top.f.mess -side top -fill x
pack  .top.icon .top.f -side left

button .bottom.dismiss -text $buttontext -command "exit"
pack   .bottom.dismiss
pack   .top .bottom

proc exit {} {
    destroy .
}


