Please write image files in a vector graphics format, when possible, and
generate the .png and .pdf versions on the fly (see ../Makefile).

The currently supported tool is dia.  xfig could be added similarly
if someone wants to add it.  The main requirement for adding another format
is that the tool to edit it is freely available and that a cron script can
autogenerate the pdf and png from the figure source.  Tgif (.obj) files
were once used but the file conversions require a valid X display to
be running, and are therefore to be avoided since our code server
does not run such a server.  Tgif pdf conversions were also cumbersome.

Store the .dia versions in this directory, but not the .png or .pdfs.
If the figure is not available in a vector graphics format, store both
a .png and a .pdf version in this directory.

If you add a source (.dia) file here, remember to add it to
the list of figure sources in the Makefile in the directory above

