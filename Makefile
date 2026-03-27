# Paper 2 — Ecosystem Stewardship
.ONESHELL:
SHELL := /opt/homebrew/bin/bash
LATEX := /Library/TeX/texbin/pdflatex
BIBER := /Library/TeX/texbin/biber
LATEXMK := /Library/TeX/texbin/latexmk
PAPER := paper

SCANNER := cd $(HOME)/wc/paper-scanner && uv run paper-processor
DEFINITION := $(CURDIR)/definition-paper2-test.yml
CACHE := $(HOME)/.paper-scanner-paper2

.PHONY: help build clean validate watch open slr slr-dry slr-repl

help: ## Show this help message
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' Makefile | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-16s\033[0m %s\n", $$1, $$2}'

build: ## Build paper (pdflatex + biber + pdflatex x2)
	@echo "Building $(PAPER).pdf..."
	$(LATEX) -interaction=nonstopmode $(PAPER).tex
	$(BIBER) $(PAPER)
	$(LATEX) -interaction=nonstopmode $(PAPER).tex
	$(LATEX) -interaction=nonstopmode $(PAPER).tex
	@echo "✓ $(PAPER).pdf ready"

quick: ## Quick build (pdflatex only, no bibliography)
	@echo "Quick build..."
	$(LATEX) -interaction=nonstopmode $(PAPER).tex
	@echo "✓ $(PAPER).pdf ready (no bib update)"

validate: ## Check for LaTeX errors and missing references
	@echo "Validating..."
	@echo "--- LaTeX warnings ---"
	@$(LATEX) -interaction=nonstopmode -halt-on-error $(PAPER).tex > /dev/null 2>&1 || { echo "✗ LaTeX compilation failed"; cat $(PAPER).log | grep -A2 "^!"; exit 1; }
	@echo "✓ LaTeX compiles"
	@echo "--- Missing citations ---"
	@grep -c "Citation.*undefined" $(PAPER).log 2>/dev/null && grep "Citation.*undefined" $(PAPER).log || echo "✓ No missing citations"
	@echo "--- Missing references ---"
	@grep -c "Reference.*undefined" $(PAPER).log 2>/dev/null && grep "Reference.*undefined" $(PAPER).log || echo "✓ No missing references"
	@echo "--- Overfull boxes ---"
	@grep -c "Overfull" $(PAPER).log 2>/dev/null && echo "(check $(PAPER).log for details)" || echo "✓ No overfull boxes"
	@echo "--- Word count (approx) ---"
	@cat *.tex | sed 's/\\[a-zA-Z]*//g' | sed 's/[{}]//g' | wc -w | xargs echo "~"

clean: ## Remove build artifacts
	@rm -f $(PAPER).{aux,bbl,bcf,blg,log,out,pdf,run.xml,toc,fdb_latexmk,fls,synctex.gz}
	@echo "✓ Clean"

open: ## Open PDF in default viewer
	@open $(PAPER).pdf 2>/dev/null || echo "No PDF found — run make build first"

watch: ## Watch for changes and rebuild (requires fswatch)
	@command -v fswatch >/dev/null 2>&1 || { echo "Install fswatch: brew install fswatch"; exit 1; }
	@echo "Watching *.tex for changes..."
	@fswatch -o *.tex | xargs -n1 -I{} make quick

slr: ## Run SLR pipeline (import → dedup → screen → export)
	$(SCANNER) run $(DEFINITION) --verbose --cache-dir $(CACHE)

slr-dry: ## Dry-run SLR pipeline (show steps without executing)
	$(SCANNER) run $(DEFINITION) --verbose --dry-run --cache-dir $(CACHE)

slr-repl: ## Interactive SLR REPL for debugging pipeline
	$(SCANNER) repl -f $(DEFINITION) --cache-dir $(CACHE) --verbose

slr-validate: ## Validate SLR definition file
	$(SCANNER) validate $(DEFINITION) --verbose

slr-info: ## Show available pipeline steps
	$(SCANNER) info steps
