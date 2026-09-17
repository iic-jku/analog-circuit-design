# Analog (Integrated) Circuit Design

[![Quarto Publish](https://github.com/iic-jku/analog-circuit-design/actions/workflows/quarto-publish.yml/badge.svg?branch=main)](https://github.com/iic-jku/analog-circuit-design/actions/workflows/quarto-publish.yml)
[![Simulation Test](https://github.com/iic-jku/analog-circuit-design/actions/workflows/simulation-test.yml/badge.svg?branch=main)](https://github.com/iic-jku/analog-circuit-design/actions/workflows/simulation-test.yml)
[![DOI](https://img.shields.io/badge/DOI-10.5281%2Fzenodo.14387481-blue)](https://doi.org/10.5281/zenodo.14387481)
[![GitHub Pages](https://img.shields.io/badge/GitHub%20Pages-online-brightgreen?logo=github)](https://iic-jku.github.io/analog-circuit-design/aicd.html)

**(c) 2024-2026 Harald Pretl and co-authors, Department for Integrated Circuits (ICD), Johannes Kepler University, Linz (JKU)**

This is the material for an intermediate-level MOSFET circuit design course, held at JKU under course number 336.009 ("KV Analoge Schaltungstechnik"). Follow this [link to access the material](https://iic-jku.github.io/analog-circuit-design/aicd.html).

The course makes heavy use of circuit simulation, using [**Xschem**](https://xschem.sourceforge.io) for schematic entry and [**ngspice**](https://ngspice.sourceforge.io) for simulation. The 130nm CMOS technology [**SG13G2**](https://github.com/IHP-GmbH/IHP-Open-PDK) from [IHP Microelectronics](https://www.ihp-microelectronics.com) is used.

Tools and PDK are integrated in the [**IIC-OSIC-TOOLS**](https://github.com/iic-jku/IIC-OSIC-TOOLS) Docker image, which will be used during the coursework.

All course material is made publicly available and shared under the Apache-2.0 license.

## Building locally

Render the material with `quarto render`.

This produces the HTML site in `_site/` and the PDF (via Typst) in about half a minute, executing all embedded Python cells and notebooks from scratch.

## Lecture Slides

One reveal.js deck per chapter (and appendix) is generated from the lecture notes (`slides/<topic>.qmd`, listed on `slides/index.qmd`). Figures, display equations, callouts, lists and tables go on slides; prose becomes speaker notes (press `S`). Figure, equation, table, callout and section numbers match the notes.

The slide tooling in `slides/_tools/` is shared by all lectures ([AICD](https://github.com/iic-jku/analog-circuit-design), [RFIC](https://github.com/iic-jku/radio-frequency-integrated-circuits), [DCIC](https://github.com/iic-jku/design-complex-ic)) and is kept identical; lecture-specific settings (book file, name, chapters without a deck) live in `slides/_course.json`. When improving the tooling, copy `slides/_tools/` (without `numbers.json`) to the other lectures; [hpretl-lectures](https://github.com/iic-jku/hpretl-lectures) checks that the copies match.

After adding, removing or renaming a chapter, or adding/removing labels (`#fig-`, `#eq-`, `#tbl-`, `#nte-`, `#imp-`, `#sec-`), regenerate and check:

```bash
python3 slides/_tools/gen_decks.py
python3 -m unittest discover -s slides/_tools
```

Optional markup in the chapter files to improve slides (ignored by the HTML and PDF notes):

- `::: {.content-visible when-format="revealjs"}` — slide-only content (e.g. key bullet points); a leading `###` heading becomes the slide title and the preceding prose its speaker notes; without a heading, it fills a section slide that would otherwise be empty.
- `::: {.content-hidden when-format="revealjs"}` — keep content in the notes only; on slides its text becomes speaker notes (also inside callouts). Pair it with a slide-only block to condense long lists or callouts.
- `{.no-slide}` on a div (callout, figure cell), a figure (`![](x.png){#fig-foo .no-slide}`) or in an equation label (`{#eq-foo .no-slide}`) — skip it on slides.

"Solution: …" callouts are revealed step by step. Use project-absolute paths (`/content/...`) for `{{< include >}}` and `{{< embed >}}`, as they are resolved before the slide filter can adjust paths for `slides/`.

Long lists, callouts, paragraphs and tables continue on further slides (at most 80 words per slide; tables at most 12 rows or 120 words); prose sentences around a display equation go to the speaker notes. The render log lists `SLIDES: crowded slide …` warnings for slides that are still too full (e.g. a single very long sentence); these are good candidates for slide-only bullets.

**We happily accept [pull requests](https://github.com/iic-jku/analog-circuit-design/pulls) to fix typos or add content! If you want to discuss something that is not clear, please [open an issue](https://github.com/iic-jku/analog-circuit-design/issues/new)!**
