PREFIX=/usr
BINDIR=$(PREFIX)/bin

PROG = global-socks-proxy

all:
	@echo "Run 'make install' for installation."
	@echo "Run 'make uninstall' for uninstallation."

install: $(PROG)
	install -D -m 755 $(PROG) $(BINDIR)/$(PROG)

uninstall:
	rm -f $(BINDIR)/$(PROG)
