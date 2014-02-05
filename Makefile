DESTDIR = .
BOARDS = p2041rdb p3041ds p4080ds p5020ds p5040ds t1040qds t2080qds t4240qds b4860qds
VER = $(shell git describe --tags)

all install clean:
	@for board in $(BOARDS); do \
		$(MAKE) -C $$board $@ DESTDIR=$(DESTDIR)/$$board; \
	done

release: $(foreach board,$(BOARDS),hv-cfg-$(board)-$(VER).tar.gz)

$(foreach board,$(BOARDS),hv-cfg-$(board)-$(VER).tar.gz): hv-cfg-%-$(VER).tar.gz:
	git archive --format=tar HEAD --prefix hv-cfg- $* | gzip -9 > $@

.PHONY: all install clean release $(foreach board,$(BOARDS),hv-cfg-$(board)-$(VER).tar.gz)
