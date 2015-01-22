DESTDIR = .
BOARDS = p2041rdb p3041ds p4080ds p5020ds p5040ds t1040qds t1040rdb \
	 t1042rdb t1024qds t1024rdb t2080qds t2080rdb t4240qds t4240rdb \
	 b4860qds
VER = $(shell git describe --tags)

all install clean:
	@for board in $(BOARDS) experimental; do \
		$(MAKE) -C $$board $@ DESTDIR=$(DESTDIR)/$$board; \
	done

release: $(foreach board,$(BOARDS),hv-cfg-$(board)-$(VER).tar.gz)

$(foreach board,$(BOARDS),hv-cfg-$(board)-$(VER).tar.gz): hv-cfg-%-$(VER).tar.gz:
	git archive --format=tar HEAD --prefix hv-cfg- $* | gzip -9 > $@

.PHONY: all install clean release $(foreach board,$(BOARDS),hv-cfg-$(board)-$(VER).tar.gz)
