citero-jruby
======================
[![Build Status](http://jenkins1.bobst.nyu.edu/view/Citation/job/citero-jruby/badge/icon)](http://jenkins1.bobst.nyu.edu/view/Citation/job/citero-jruby/)
[![Build Status](https://secure.travis-ci.org/NYULibraries/citero-jruby.png?branch=master)](http://travis-ci.org/NYULibraries/citero-jruby)
[![Dependency Status](https://gemnasium.com/NYULibraries/citero-jruby.png)](https://gemnasium.com/NYULibraries/citero-jruby)
[![Code Climate](https://codeclimate.com/github/NYULibraries/citero-jruby.png)](https://codeclimate.com/github/NYULibraries/citero-jruby)
[![Gem Version](https://badge.fury.io/rb/citero-jruby.png)](http://badge.fury.io/rb/citero-jruby)
[![Coverage Status](https://coveralls.io/repos/NYULibraries/citero-jruby/badge.png?branch=master)](https://coveralls.io/r/NYULibraries/citero-jruby)


A JRuby wrapper for the Citero, enables use of the Citero in JRuby. See [Citero](https://github.com/NYULibraries/citero).

Usage Details
==============

To use Citero simply pass in your data into the Citero module via the map method. Then call the method that specifies the from format and
the method that specifies what format you want to translate to.


    Citero.map("itemType: book").from\_csf.to_ris		# Returns a string with the value TY  - BOOK\n\nER  -\n\n


You can find available formats via:

    Citero.from_formats		# List of from formats (Array)
    						# pnx, xerxes_xml, ris, openurl, bibtex, csf*
    Citero.to_formats		# List of to formats (Array)
    						# ris, openurl, bibtex, easybib, csf*
*CSF is Citero Standard Form, it's an internal mapping DSL. 

To call a method, simply append the format name after either from\_ or to\_. 
Note, you must call from\_ before to\_ and map before anything else.

    csf = Citero.map("itemType: book").from_csf
    csf.to_ris			# ->	TY  - BOOK\n\nER  -\n\n
    csf.to_openurl		# ->	rft.ulr_ver=Z39.88-2004&rft.ctx_ver=Z39.88-2004&rft.rfr_id=info:sid/libraries.nyu.edu:citero&rft_val_fmlt=info:ofi/fmt:kev:mtx:book&rft.genre=book
    csf.to_easybib		# ->	{"source":"book","book":{"title":null},"pubtype":{"main":"pubnonperiodical"},"pubnonperiodical":{},"contributors":[{}]}
    csf.to_bibtex		# ->	@book{????}

Finally, this gem allows you to interact with the CSF object, you can call the _csf_ method.

    rec = Citero.map("itemType: book").from_csf
    csf = rec.csf
    p csf.itemType # => Prints ['book']
    p csf.keys # => Prints ['itemType']
