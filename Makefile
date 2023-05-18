# Cours "Semantics and applications to verification"
#
# Marc Chevalier 2018
# Josselin Giet 2021
# Ecole normale supérieure, Paris, France / CNRS / INRIA

.PHONY: all clean cleantest test open doc compress

all:
	@rm -f analyzer.exe
	@dune build analyzer.exe
	@ln -sf _build/default/analyzer.exe analyzer

clean: cleantest
	@rm -rf _build/ analyzer *~ */*~
	@rm -rf *.dot *.pdf *.svg */*.dot */*.pdf */*.svg *.tar.gz

cleantest:
	@rm -rf results

test: cleantest all
	@scripts/test.sh .

doc: all
	@dune build @doc-private

compress: clean
	@tar -czvf ../project-semantics.tar.gz --exclude=".git*" ../project-semantics
	@mv ../project-semantics.tar.gz .

open: test
	firefox results/index.html
