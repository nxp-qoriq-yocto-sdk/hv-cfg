DESTDIR = .
INSTALL = install
DTC = dtc

dts_sources := $(wildcard */*/*.dts)
targets = $(dts_sources:.dts=.dtb)

%.dtb: %.dts
	$(DTC) -b 0 -p 1024 -O dtb $< -o $@

all: $(targets)

install: $(targets)
	$(INSTALL) -d $(DESTDIR)
	$(INSTALL) -m 644 README $(DESTDIR)
	@for file in $(filter-out R_RRRSS_0x16/srio/hv-1p-lnx-%.dtb,$^);		\
	do										\
		$(INSTALL) -m 644 -D $$file $$(dirname $(DESTDIR)/$$file)$(suffix $<);	\
	done;										\
	for file in $(filter R_RRRSS_0x16/srio/hv-1p-lnx-%.dtb,$^);			\
	do										\
		$(INSTALL) -m 644 -D $$file $(DESTDIR)/$$file;				\
	done

clean:
	$(RM) -r $(targets)

.PHONY: all install clean
