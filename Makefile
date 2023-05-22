# Cours "Semantics and applications to verification"
#
# Marc Chevalier 2018
# Josselin Giet 2021
# Ecole normale supérieure, Paris, France / CNRS / INRIA

.PHONY: all build clean cleantest compress doc open rapport test

all: build rapport

build:
	@rm -f analyzer.exe
	@dune build analyzer.exe
	@ln -sf _build/default/analyzer.exe analyzer

clean: cleantest
	@rm -rf _build/ analyzer *~ */*~
	@rm -rf *.dot *.pdf *.svg */*.dot */*.pdf */*.svg *.tar.gz

cleantest:
	@rm -rf results

test: cleantest build
	@scripts/test.sh .

doc: all
	@dune build @doc-private

rapport/%.pdf rapport/%.aux rapport/%.log &: rapport/%.tex
	lualatex -shell-escape -interaction=batchmode -output-directory=rapport $<

rapport.pdf: rapport/rapport.pdf
	ln -fs $< $@

rapport: rapport.pdf

compress: clean
	@tar -czvf ../project-semantics.tar.gz --exclude=".git*" ../project-semantics
	@mv ../project-semantics.tar.gz .

open: test
	firefox results/index.html
