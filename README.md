# jorgeancal.com

Personal CV site for Jorge Andreu Calatayud, built with [Hugo](https://gohugo.io/)
and the `hugo-devresume-theme` (git submodule). Published from `docs/` with the
custom domain in `docs/CNAME`.

## Requirements

- Hugo extended (developed against 0.169.0)
- Git, with submodules initialised: `git submodule update --init`

## Develop

    hugo server

## Build and publish

    hugo                # writes the site to docs/
    git add docs && git commit

The repository is published from `docs/`, so build and commit it with the
source change. `docs/assets/css/` accumulates one fingerprinted file per build;
only the one referenced from `docs/index.html` is needed.

## Where things live

| What | Where |
| --- | --- |
| CV content (summary, roles, skills, education, links) | `config.toml` under `[params]` |
| Experience data | `params.experience.list`: one entry per employer, with its `roles` |
| Site/SEO values (description, job title, keywords, share image) | `config.toml`, top-level `[params]` |
| Templates overriding the theme | `layouts/` |
| Styles | `assets/scss/devresume.scss` (Bootstrap is imported from the theme) |
| Icons (inline SVG) | `assets/icons/`, used through `layouts/partials/icon.html` |
| Self-hosted fonts (Roboto, SIL OFL) | `static/fonts/` |
| Share image, favicons | `static/images/`, `static/favicon.ico` |

Do not edit files inside `themes/`; override them under `layouts/` instead.

### Adding a role

Add it at the top of the employer's `roles` list. Give the previous role an end
date instead of "Present". The employer's date range is derived from its oldest
and newest role, and the purple dot follows whichever role ends in "Present".

## Checking a build

Build with the local address as the base URL, so the absolute asset URLs
point at your copy rather than the live site, then audit it with Lighthouse
in Chrome DevTools or the Lighthouse CLI:

    hugo --baseURL http://localhost:1313/ -d /tmp/site
    hugo server --baseURL http://localhost:1313/ --disableFastRender

## Commits

Conventional Commits (`feat:`, `fix:`, `perf:`, `docs:`, `chore:`), subject
line of 72 characters or fewer.
