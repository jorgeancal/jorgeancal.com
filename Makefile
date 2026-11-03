HUGO     ?= hugo
CHROMIUM ?= chromium
PDF      := static/jorge-andreu-calatayud-cv.pdf

.PHONY: serve build pdf

serve:
	$(HUGO) server

# Production build into docs/. --cleanDestinationDir removes stale files; the
# custom-domain CNAME is kept because it also lives in static/.
build:
	$(HUGO) --cleanDestinationDir

# Regenerate the downloadable CV from the print styles of the home page.
# Rebuild the site afterwards (make build) so the new PDF is published.
pdf:
	set -e; tmp=$$(mktemp -d); trap 'rm -r "$$tmp"' EXIT; \
	$(HUGO) --quiet --baseURL "file://$$tmp/" --destination "$$tmp"; \
	$(CHROMIUM) --headless=new --disable-gpu --no-pdf-header-footer \
		--print-to-pdf=$(PDF) "file://$$tmp/index.html"
