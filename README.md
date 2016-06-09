# plGeo

This library is a rewrite of the _space_ package that updates it to
use the new _rdf11_ library.  This library is structured as a
SWI-Prolog _pack_.  To install it, perform the steps below.  Tested on
Fedora 23 (64 bit), but the same should work on most Unix-like
machines.

  1. Install _GEOS_.
  
  2. Install _spatialindex_.
  
  3. Install SWI-Prolog.
  
  4. Clone this repository in your SWI-Prolog _pack_ directory,
     typically `~/lib/swipl/pack` and install it.
  
  5. Start SWI-Prolog and run `?- pack_rebuild(plGeo).`

If all worked out, you can now use `?- use_module(library(geoindex)).`
to load the library.
