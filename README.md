# Vagabond Haven landing pages

Source files of the seven public landing pages, exactly as they are live (the five
first checked 21 September 2026, the two referral pages downloaded 23 September 2026).

| Folder | Live URL |
|---|---|
| partners/ | https://vagabondhaven.com/partners |
| operators/ | https://vagabondhaven.com/operators |
| referrals/ | https://vagabondhaven.com/referrals |
| financing/ | https://financing.vagabondhaven.com/ |
| faq/ | https://faq.vagabondhaven.com/ |
| referral-terms/ | https://referral-terms.vagabondhaven.com/ |
| referral-register/ | https://referral-register.vagabondhaven.com/ |
| catalog/ | not on a subdomain yet; Samuel to set one up (for example catalog.vagabondhaven.com) |

Each page is a single `index.html`. Images are embedded in the HTML, except on the FAQ page, which loads its photos and two PDFs from its own folder. Fonts come from Google Fonts.

The catalogue (`catalog/`, added 2 October 2026) is the English 2026 edition: `index.html` is a 60-page page-flip viewer, `images/` holds its photos as separate files, and `vagabond-haven-catalogue-2026-en.pdf` is the matching PDF, linked from the viewer. German and Swedish editions are in `catalog/de/` and `catalog/sv/` (added 2 October 2026), each with its own PDF; readers switch language in the viewer's top bar.
