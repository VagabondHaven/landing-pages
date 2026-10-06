# Vagabond Haven landing pages

This folder is the working copy of https://github.com/VagabondHaven/landing-pages
and it is also the folder Manu keeps on his Desktop. One copy, not two.

## What is in the repository

Seven public landing pages, one `index.html` per folder, each served from its own
subdomain (the table in README.md maps folder to URL). Photographs and other
images are base64-embedded in the HTML, so the files are large: 250 KB to 1.3 MB.
The FAQ page is the exception and loads its photos and two PDFs from `faq/`.
Fonts come from Google Fonts. There is no build step and no framework.

## What is deliberately not in the repository

`.gitignore` keeps out `Team landing pages/`, `Vagabond economy/`, `VATdocs/`,
`.DS_Store` and `*.bak-*` backups. `Team landing pages/api/config.php` holds a
live Anthropic API key, so that folder must never be committed to this public
repository. Check `git status` before committing and never use `git add -A`
without reading what it picked up.

## Who changes these pages, and where they also live

Since 6 October 2026 Claude owns the design and wording of these landing pages and the
catalogue (Manu's decision). Every change is saved here and, in the same session, copied
unchanged into the website repository (VagabondHaven/Vagabond-Haven-website): the pages to
`src/landing/<name>.html` (`referral-terms` becomes `referral-programme-terms.html`), the
catalogue to `public/catalog/`. The website rewrites the links to vagabondhaven.com and its
subdomains by itself, so the files stay identical. Manu updates the live landing pages from here.

## Working on these pages

Edit in place with single-match replacements and verify the match count, rather
than rewriting a whole file. A 700 KB file is mostly base64 image data, and
rewriting one from tool output truncates it.

Keep a dated backup beside the file before a large change, named
`index.html.bak-YYYY-MM-DD`. Those are gitignored.

A push publishes. Samuel set up the website to pull from this repository and
mirror it, so what lands on `main` reaches the live pages. Treat every push as
going public, and check the exact mechanism and any delay with Samuel before
relying on timing.

## The financing page

`financing/index.html` carries a leasing calculator. Its figures are the
indicative terms our leasing partner quoted in September 2026: 72 months, no
down payment, no buy-out, 8.4 per cent nominal, published as a non-binding
example. Do not change those numbers without a new quote.

No country is named anywhere in the visible text, on purpose: the page is read
across Europe and naming one market reads as excluding the others. Country
figures live in the `MARKETS` object in the script and appear only after the
reader selects a country. Keep that separation.

## The catalogue

`catalog/` is generated, not hand-written. Its `index.html` is built by `build.py`
in Manu's "Vagabond Catalog Redesign" folder on the Desktop; the current edition is
"Vagabond Haven Catalog 2026 FINAL v6 (EN DE SV)" (each change goes into a new version
folder, see its README). Build with `CLEAN=1` so the photo-swap tool used during editing is
left out. Change the catalogue there, rebuild, and copy `index.html`, `de/`, `sv/`, `images/`
and the PDFs here. Do not edit `catalog/index.html` in place. Unlike the other pages, its
photos are separate files in `catalog/images/`. The PDFs are printed with Chromium and
compressed with Ghostscript (see the v6 README).

There are three languages. English is `catalog/index.html`; German and Swedish are
`catalog/de/index.html` and `catalog/sv/index.html`, each with its own PDF next to it,
and both use the shared `catalog/images/` (their image paths start with `../images/`).
They are made from the English build by `i18n/apply.py` in the same catalogue folder
(translations in `i18n/de_*.py` and `i18n/sv_*.py`). A switch in the viewer's top bar
(EN · DE · SV) moves between them and keeps the page the reader is on. On a first visit
to the English address, a reader whose browser is set to German or Swedish is sent to that
edition; once they pick a language with the switch, that choice is remembered.
