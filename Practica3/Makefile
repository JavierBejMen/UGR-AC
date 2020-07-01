TARGETS = if-clause if-clauseModificado schedule-clause scheduled-clause \
scheduleg-clause scheduled-clauseModificado \
scheduled-clauseModificado4 scheduled-clauseModificado5 pmtv-secuencial \
pmtv-OpenMP pmm-secuencial pmm-OpenMP gen_plot_data

all: clean $(TARGETS)

.PHONY: clean

%: %.c
	gcc -O2 -fopenmp -o $@ $<






clean:
	rm $(TARGETS) || true
	rm *.dat || true
	rm *.png || true
