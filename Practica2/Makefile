TARGETS = private-clause shared-clause shared-clauseModificado \
private-clauseModificado private-clauseModificado3 firstprivate-clause \
firstlastprivate-clause copyprivate-clause copyprivate-clauseModificado \
reduction-clause reduction-clauseModificado reduction-clauseModificado7 \
pmv-secuencial pmv-OpenMP-a pmv-OpenMP-b pmv-OpenMP-reduction


all: clean $(TARGETS)

.PHONY: clean

%: %.c
	gcc -O2 -fopenmp -o $@ $<






clean:
	rm $(TARGETS) || true
	rm pmv-OpenMP*.o || true
