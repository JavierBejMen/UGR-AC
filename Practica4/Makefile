TARGETS = pmm-secuencial pmm-secuencial-modificado_a pmm-secuencial-modificado_b \
pmm-secuencial-modificado_c figura1-original figura1-modificado_a \
figura1-modificado_b
all: clean $(TARGETS)

.PHONY: clean

%: %.c
	gcc -O2 -fopenmp -o $@ $<






clean:
	rm $(TARGETS) || true
	rm *.dat || true
