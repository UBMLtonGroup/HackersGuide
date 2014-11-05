SOURCES = $(shell ls *.tex)
PRODUCT = $(SOURCES:.tex=.pdf)
LATEX = pdflatex
LATEX_DIR = print
LATEX_FLAGS = -output-directory=$(LATEX_DIR) -output-format=pdf

HTML_PRODUCT = $(SOURCES:.tex=.html)
HTML_DIR = web
HTML_TMP_DIR = tmp
LATEX_HTML = htlatex
LATEX_HTML_FLAGS = "" "unicode" "-d./web/" "-output-directory=$(HTML_TMP_DIR)"

# all
all: print web

# clean
clean:
	rm -rf $(LATEX_DIR) $(HTML_DIR) $(HTML_TMP_DIR)

# print version
print: $(PRODUCT)

%.pdf: %.tex print-dir
	$(LATEX) $(LATEX_FLAGS) $<

print-dir: $(LATEX_DIR)
	mkdir -p $(LATEX_DIR)

# web version
web: $(HTML_PRODUCT) web-dir

%.html: %.tex web-dir
	$(LATEX_HTML) $< $(LATEX_HTML_FLAGS)

web-dir: $(HTML_DIR)
	mkdir -p $(HTML_DIR);
	mkdir -p $(HTML_TMP_DIR)
