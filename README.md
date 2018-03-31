README
======

A script to create Seafile share-links from the command line plus a
wrapper that allows you to use it from Nautilus.

This functionality could probably be done in a better way, and be installed
along with the Seafile client itself - but until then, you can use these two
scripts.

**Version:** 1.0

**License:** [Unlicensed](http://unlicense.org/) - do what you want! :-)


How do I set it up?
-------------------

### Prerequisites ###

The install-script checks for the prerequisites.

`seafile-share-link` requires that `sqlite3` is installed.
It is used to access the Seafile-config-files. It also needs `curl`
to access the Seafile REST-API.

`nautilus-seafile-share-link` is meant to be called as a "Nautilus Script".
Finally `zenity` is used for the dialog boxes. Chances are good that you
have 'zenity' installed if you have Nautilus.

### Installation ###

    ./install.sh

The nautilus-script is installed in `$HOME/.local/share/nautilus/scripts/`,
so run the installer from your own userid.
The installer will use `sudo` to install the `seafile-share-link` script,
into `/usr/local/bin` (or if `$PREFIX` is defined into `$PREFIX/bin`)


### Example - command line ###

    $ cd /home/aba/Seafile/pfc/AroFotos/portraits
    $ seafile-share-link kislas.jpg
    Share-link created at: https://seafile.pf-c.dk/f/12bb311a30/

or with full path:

    $ seafile-share-link /home/aba/Seafile/pfc/AroFotos/portraits/kislas.jpg
    Share-link created at: https://seafile.pf-c.dk/f/12bb311a30/


### Example - Nautilus ###

After right-click on "build.log":




![In Nautilus](README-pix/Screenshot-seafile-share-link.png)



![Result](README-pix/Screenshot-seafile-share-link-dialog.png)


### Tested on ###

  * **Release 0.5:** Ubuntu 12.04, Seafile client version 4.2.4, Seafile Server version 4.2.2
  * **Release 1.0:** Ubuntu 16.04, Seafile client version 6.1.2, Seafile Server version 6.2.5

The install-path for the Nautilus script changed in Ubuntu 13.10, so if you are an older Ubuntu, 
you can try the 0.5 version. The scripts are the same -- only the installer has changed.

Contact
-------

Author: Anders Bandholm. Thanks to [carlos22](https://github.com/carlos22) for his update 
so that the installer now works on modern Ubuntus.

Email: 2018 at-sign d7.dk (after 2018: replace 2018 with present year)

*I liked it when you could just post your email without getting spammed...*