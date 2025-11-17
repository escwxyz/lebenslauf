# Lebenslauf

Lebenslauf is a component-first Typst toolkit for building polished CVs and resumes.  
Instead of relying on TOML metadata, you compose pages directly in Typst using a small set of reusable helpers.

## Highlights
- Flexible building blocks for headers, entries, skill lists, and photo layouts.
- Theme registry (professional, modern, everforest) that powers colors, typography, and spacing.
- Page helper `cv-page` with sane defaults for A4 documents.
- Example templates in `template/advanced.typ` and `template/main.typ` that you can clone or modify.

## Getting Started

```typst
#import "@preview/lebenslauf:0.1.0": *

#let theme = themes.professional

#show: cv-page.with(theme: theme)

#cv-two-columns(
  [
    #cv-photo("photo.jpg", theme: theme, width: 3.5cm)
    #v(1em)
    #cv-header(name: "Jie Wang", theme: theme)
    #cv-sidebar-contact(
      email: "hi@example.com",
      phone: "+49 123 456789",
      location: "Berlin",
      theme: theme,
    )
  ],
  [
    #cv-section("Berufserfahrung", theme: theme)[
      #cv-entry(
        title: "Senior Software Engineer",
        subtitle: "TechCorp GmbH",
        date: "2022 – heute",
        description: (
          "Leitung eines 6-köpfigen Teams",
          "Skalierung einer Microservice-Plattform",
        ),
        theme: theme,
      )
    ]
  ],
)
```

## Templates

- `template/letter.typ` – Motivation letter template in German style.
- `template/cv_en.typ` – Two-column CV example with the same component vocabulary.

Compile templates (note the root flag because the template lives in a subdirectory):

```bash
typst compile --root . template/cv_en.typ
```

## Developing

- Components live in `src/components.typ`.
- Utility functions (icons, ratings, two-column lists, …) live in `src/utils.typ`.
- Themes reside in `src/themes`.

Run ad-hoc previews with:

```bash
typst compile --root . tests/unit-photo/test.typ
```

Happy typesetting!***
