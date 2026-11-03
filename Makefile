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

# Regenerate the downloadable CV from the print styles of the /cv/ page.
# Rebuild the site afterwards (make build) so the new PDF is published.
pdf:
	tmp=$$(mktemp -d) && \
	$(HUGO) --quiet --baseURL "file://$$tmp/" --destination "$$tmp" && \
	$(CHROMIUM) --headless=new --disable-gpu --no-pdf-header-footer \
		--print-to-pdf=$(PDF) "file://$$tmp/cv/index.html" && \
	rm -r "$$tmp"
