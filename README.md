# jorgeancal.com

Personal site and CV for Jorge Andreu Calatayud, built with
[Hugo](https://gohugo.io/) (extended). There is no theme and no JavaScript
framework: the templates in `layouts/` and one small stylesheet make up the
whole site. It is published from `docs/` with the custom domain in `CNAME`.

## Requirements

- Hugo extended (developed against 0.169.0)
- Chromium, only to regenerate the PDF CV

## Commands

    make serve    # hugo server
    make build    # production build into docs/, removing stale files
    make pdf      # regenerate static/jorge-andreu-calatayud-cv.pdf

`make build` uses `--cleanDestinationDir`, so files that are no longer
generated are removed from `docs/`. The custom-domain `CNAME` survives because
it is also kept in `static/`.

After changing the CV, run `make pdf` first and then `make build`, so the new
PDF is published with the site.

## Pages

| URL | Source |
| --- | --- |
| `/` | `layouts/index.html`: the CV itself; print styles also drive the PDF |
| `/privacy/` | `content/privacy.md` |

## Where things live

| What | Where |
| --- | --- |
| All CV and homepage content | `config.toml` under `[params]` |
| Employers and roles | `params.experience.list`: one entry per employer, with its `roles` |
| Projects | `params.projects` |
| SEO values (description, job title, keywords, share image) | `config.toml`, top-level `[params]` |
| Templates | `layouts/` (`_default/baseof.html` wraps every page) |
| Styles | `assets/css/site.css`, inlined into each page at build time |
| Icons (inline SVG, Font Awesome Free, CC BY 4.0) | `assets/icons/`, used through `layouts/partials/icon.html` |
| Self-hosted fonts (Roboto, SIL OFL 1.1) | `static/fonts/` |
| Share image, favicons | `static/images/`, `static/favicon.ico` |

### Adding a role

Add it at the top of the employer's `roles` list, and give the previous role an
end date instead of "Present". The employer's date range is derived from its
oldest and newest role, and the purple dot follows the role whose dates end in
"Present".

## Analytics and consent

Google Analytics (the ID is in `[services.googleAnalytics]`) is not loaded
until a visitor accepts it in the banner from
`layouts/partials/consent.html`. The choice is kept in `localStorage`, can be
changed from the footer, and declining removes the `_ga` cookies. Without
JavaScript nothing is loaded and the banner is not shown.

## Checking a build

Build with the local address as the base URL, so absolute asset URLs point at
your copy rather than the live site, then audit it with Lighthouse or axe:

    hugo --baseURL http://localhost:1313/ -d /tmp/site

## Commits

Conventional Commits (`feat:`, `fix:`, `perf:`, `docs:`, `chore:`, `build:`),
subject line of 72 characters or fewer.
