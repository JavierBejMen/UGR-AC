TARGETS = if-clauseModificado scheduled-clauseModificado \
scheduled-clauseModificado4 scheduled-clauseModificado5 pmtv-secuencial \
pmtv-OpenMP pmm-secuencial pmm-OpenMP

all: clean $(TARGETS)

.PHONY: clean

%: %.c
	gcc -O2 -fopenmp -o $@ $<






clean:
	rm $(TARGETS) || true
