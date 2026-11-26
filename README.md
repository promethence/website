# Promethence website

The public website of Promethence S.r.l.: home, about, team, careers, contact and transparency
pages. A Jekyll site on the Serif theme (Zerostatic, MIT licence), deployed by FTP to the
hosting account with `_scripts/my_deploy.sh`, which mirrors `_site/` into `www.promethence.net/`
on `ftp.promethence.net`. The FTP password is read from the system keyring (`secret-tool`).

## Layout

| Path | What it is |
|---|---|
| `index.md`, `about.md`, `team.md`, `careers.md`, `contact.md`, `transparency.md` | The pages |
| `_team/` | One file per person on the team page |
| `_data/` | Contact details, menus, features, SEO and social links |
| `_layouts/`, `_includes/`, `_sass/`, `assets/` | The theme. The logos in `assets/images/logo/` are copies of `brand_identity/logo/` |
| `_scripts/` | Deploy scripts |
| `_site/` | Build output (`bundle exec jekyll build`) |

## Known issues (November 2026)

- `_config.yml` sets `url: https://www.promethence.net`, while email, the servers and the event
  leaflets use `promethence.com`. Decide the canonical address.
- `_team/giampaolo-agosta.md` has the wrong email (`giovanni.pelosi@…`), and Francesco
  Antognazza is not on the team page (decisions on the customer deck, 4 Nov 2026).
- `_data/contact.yml` has the address `prometence@promethence.com`; the other pages use
  `promethence@promethence.com`.
- The site still uses the older palette and fonts (red `#E5261F`, Playfair Display). The brand is
  now the documents' palette (red `#F0412A`, Inter; see `brand_identity/README.md`): the site will
  be aligned once the brand identity is stable.

# How to
## Installation
### Installing Ruby & Jekyll
If this is your first time using Jekyll, please follow the [Jekyll
docs](https://jekyllrb.com/docs/installation/) and make sure your local
environment (including Ruby) is setup correctly.

### Installing Theme
To run the theme locally, navigate to the theme directory and run:

```
bundle install
```

To start the Jekyll local development server.

```
bundle exec jekyll serve
```

To build the theme.

```
bundle exec jekyll build
```


# Original theme author

Serif is a modern business theme for Jekyll. It contains multiple content types
for a typical brochure/marketing website. The theme is fully responsive, blazing
fast and artfully illustrated.

[Live Demo](https://jekyll-serif.netlify.app/) |
[Zerostatic Themes](https://www.zerostatic.io)

<a href="https://www.buymeacoffee.com/zerostatic" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/v2/default-yellow.png" alt="Buy Me A Coffee" style="height: 60px !important;width: 217px !important;" ></a>

![Jekyll Serif Theme screenshot](https://www.zerostatic.io/theme/jekyll-serif/jekyll-serif-screenshot.png)

🇦🇺 **Made in Australia** by Robert Austin
