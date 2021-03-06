#!/usr/bin/perl

#Creator:	dark-triad
#Executes commands based on the screensaver starting or ending

#Notes:
#boolean true = screensaver start
#boolean false = screensaver end

#Note an "&" may be needed after the commands
#to put the program in the background and release the shell,
#otherwise it may not work, eg: "transmission &"


# Note if you want to add multiple commands then just stack them after one an other like:
#system("my command &");
#system("my other command &");
#system("my last command &");

#Screensaver-torrent

#The Zenity-Kill-Torrents script presents a yes/no box when the screensaver deactivates to choose whether or not to keep transmission running


my $cmd = "dbus-monitor --session \"type='signal',interface='org.gnome.ScreenSave r', member='ActiveChanged'\"";

open (IN, "$cmd |");

while (<IN>) {
if (m/^\s+boolean true/) {

system("transmission &");

} elsif (m/^\s+boolean false/) {

system("~/.gnome2/nemo-scripts/My_Scripts/Run-With-Screensaver/Transmission/.zenity-kill-torrents");

}
}
