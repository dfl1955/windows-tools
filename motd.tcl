# if no file, or file empty do nothing
if { ! [file exists c:/etc/MOTD.txt] } {
   exit }
if { [file size c:/etc/MOTD.txt] == 0 } {
   exit }
#
# Author :  DFL
# Version : 2.0
# Date :    Jan 2009
# Licence : Creative Commons BY-SA
# Description
#     displays a message when run, with an acknowledge button
# Version Comment:
#     now has the message held in a text file and is multiline
#     checks for existence of message file and not null
#
wm title . {MOTD}
wm iconname . {MOTD}
# location only
wm geometry . +550+300

frame .top
frame .top.margin
frame .top.motd
frame .bottom

set messages [open c:/etc/MOTD.txt]

lappend messagelist [gets $messages]
# if fail exit; means the file is empty
while { [gets $messages line ] >= 0 } {
	lappend messagelist $line
}
# throw a line

lappend messagelist ""
# $messagelist is a list, that contains the MOTD

set buttontext "  OK  "
# make sure its there
image create photo infopic -file [file join $tk_library images info.gif]
label .top.margin.icon  -image infopic

# the use of .f below, allows the easy integration of 
# multiple objects into the content pane
frame .top.motd.f -width 50

# this now needs to go into a loop and a list
#label .top.motd.f.mess -text $messagetext

# the lines need a packing name
set i 0
set stem ".top.motd.f.mess"
foreach message $messagelist {
    label $stem$i -anchor w  -text $message
    pack $stem$i  -side top  -fill x
    incr i 1
}

button .bottom.dismiss -text $buttontext -command "exit"

# the messages have been packed into .top.motd.f in the loop
pack   .top.margin.icon
pack   .top.motd.f

pack   .bottom.dismiss

pack   .top.margin .top.motd -side left
pack   .top .bottom

proc exit {} {
    destroy .
}
