bindir = /usr/bin
datadir = /usr/share
sysconfdir = /etc

.PHONY: all examples install

all:
	@echo "Nothing to do."

install:
	install -Dp -m0644 odt.conf $(DESTDIR)$(sysconfdir)/asciidoc/odt.conf
	install -Dp -m0644 stylesheets/asciidoc.odt.styles $(DESTDIR)$(sysconfdir)/asciidoc/stylesheets/asciidoc.odt.styles
	install -Dp -m0644 themes/cv/cv.odt.styles $(DESTDIR)$(sysconfdir)/asciidoc/themes/cv/cv.odt.styles
	install -Dp -m0644 filters/code-filter.py $(DESTDIR)$(datadir)/asciidoc/filters/code/code-filter.py
	install -Dp -m0644 filters/line_break.py $(DESTDIR)$(datadir)/asciidoc/filters/line_break.py
	install -Dp -m0755 packaged/a2x.py $(DESTDIR)$(bindir)/a2x.py
	install -Dp -m0644 packaged/a2x.conf $(DESTDIR)$(sysconfdir)/asciidoc/backends/odt/a2x.conf

examples: examples/curriculum-vitae-dag-wieers.txt examples/test-odf.txt
	asciidoc -b odt examples/test-odf.txt
	asciidoc -b odt -a theme=cv examples/curriculum-vitae-dag-wieers.txt
	asciidoc -b odt -a icons -a iconsdir=$(datadir)/asciidoc/images/icons examples/asciidoc.txt

test: examples
