DESTDIR = .
INSTALL = install
DTC = dtc

dts_sources := $(wildcard *.dts)
targets = $(dts_sources:.dts=.dtb)

%.dtb: %.dts
	$(DTC) -b 0 -p 1024 -O dtb $< -o $@

all: $(targets)

install: $(targets)
	$(INSTALL) -d $(DESTDIR)
	$(INSTALL) -d $(DESTDIR)/experimental
	$(INSTALL) -m 644 README $(DESTDIR)/experimental
	@for file in $^;						\
	do								\
		$(INSTALL) -m 644 -D $$file $(DESTDIR)/experimental/$$file; 	\
	done

clean:
	$(RM) -r $(targets)

.PHONY: all install clean
