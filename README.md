# apk-gtk

This is a Gtk+ frontend to apk(1) for the transaction-related commands
(add, del, fix, update, upgrade).

It is meant to be used with other tools to provide a full package
management GUI.

Right now, gtk2 is used because the main Alpine desktop is gtk2, but in theory
the code should build against gtk3 and vte3 as well.

This does *not* deal with privilege elevation, pkexec should be used.

## Screenshots

![Installing software](http://imgur.com/7Si2Hryl.png)

![Installing software with details expanded](http://imgur.com/Vo106m1l.png)

![Installation complete](http://imgur.com/tAW0N7kl.png)

![Installation complete with details expanded](http://imgur.com/ZAHN9hal.png)

![Errors](http://imgur.com/DNRIkq4l.png)

![Errors with details expanded](http://imgur.com/UBZHJ3ol.png)
