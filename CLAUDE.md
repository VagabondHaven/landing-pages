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

## Working on these pages

Edit in place with single-match replacements and verify the match count, rather
than rewriting a whole file. A 700 KB file is mostly base64 image data, and
rewriting one from tool output truncates it.

Keep a dated backup beside the file before a large change, named
`index.html.bak-YYYY-MM-DD`. Those are gitignored.

The repository mirrors what is live. Committing here does not deploy anything:
Manu uploads the changed `index.html` to the server himself.

## The financing page

`financing/index.html` carries a leasing calculator. Its figures are the
indicative terms our leasing partner quoted in September 2026: 72 months, no
down payment, no buy-out, 8.4 per cent nominal, published as a non-binding
example. Do not change those numbers without a new quote.

No country is named anywhere in the visible text, on purpose: the page is read
across Europe and naming one market reads as excluding the others. Country
figures live in the `MARKETS` object in the script and appear only after the
reader selects a country. Keep that separation.
