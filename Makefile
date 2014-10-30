SOURCES = $(shell ls *.tex)
PRODUCT = $(SOURCES:.tex=.pdf)
LATEX = pdflatex
LATEX_FLAGS = -output-directory=build -output-format=pdf

all: $(PRODUCT)

clean:
	rm -rf build

%.pdf: %.tex build
	$(LATEX) $(LATEX_FLAGS) $<

build: build/
	mkdir -p build
