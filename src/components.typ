// Modular CV components for flexible composition

#import "utils.typ": *
#import "themes/theme.typ": *

#let cv-header(
  name: "",
  level: 1,
  title: none,
  theme: (:),
) = {
  align(center)[
    #heading(level: level, name)
    #if title != none {
      v(0.2em)
      text(size: 14pt, style: "italic", fill: theme.colors.secondary, title)
    }
  ]
}

// Contact bar component
#let cv-contact-bar(
  email: none,
  phone: none,
  location: none,
  links: (),
  theme: (:),
  separator: " • ",
) = {
  align(center)[
    #let items = ()

    #if email != none {
      items.push(link("mailto:" + email)[#email])
    }

    #if phone != none {
      items.push(phone)
    }

    #if location != none {
      items.push(location)
    }

    #for (url, display) in links {
      items.push(link(url)[#display])
    }

    #items.join(separator)
  ]
}

// Section heading component
#let cv-section(
  title,
  uppercase: false,
  theme: (:),
  body,
) = {
  let _title = if uppercase {
    upper(title)
  } else {
    title
  }
  heading(title, level: 2)
  v(0.5em)
  body
  v(0.5em)
}

// Experience/Job entry component
#let cv-entry(
  title: "",
  subtitle: none,
  location: none,
  date: none,
  description: (),
  theme: (:),
) = {
  grid(
    columns: (1fr, auto),

    [
      #text(weight: "bold", size: 11pt, title, fill: theme.colors.primary)
      #if subtitle != none or location != none {
        linebreak()
        if subtitle != none {
          text(fill: theme.colors.secondary, subtitle)
        }
        if location != none {
          if subtitle != none {
            text(fill: theme.colors.secondary, ", ")
          }
          text(fill: theme.colors.secondary, location, style: "italic")
        }
      }
    ],

    align(right)[
      #if date != none {
        text(style: "italic", fill: theme.colors.secondary, date)
      }
    ],
  )

  v(0.3em)

  if description != () {
    if type(description) == array {
      list(..description.map(item => [#item]))
    } else {
      description
    }
  }

  v(0.8em)
}

// Education entry component
#let cv-education(
  degree: "",
  institution: "",
  location: none,
  date: none,
  descriptionOne: none,
  descriptionTwo: none,
  theme: (:),
) = {
  grid(
    columns: (1fr, auto),

    [
      #text(weight: "bold", size: 11pt, institution)
      #linebreak()
      #text(fill: theme.colors.secondary, degree)
      #if location != none {
        text(fill: theme.colors.secondary, ", " + location)
      }
    ],

    align(right)[
      #if date != none {
        text(style: "italic", fill: theme.colors.secondary, date)
      }
      #if descriptionOne != none {
        linebreak()
        text(weight: "semibold", descriptionOne)
      }
    ],
  )

  if descriptionTwo != none {
    v(0.3em)
    text(style: "italic", descriptionTwo)
  }

  v(0.8em)
}

// Project entry component
#let cv-project(
  name: "",
  url: none,
  technologies: (),
  date: none,
  description: none,
  theme: (:),
) = {
  grid(
    columns: (1fr, auto),

    [

      #if url != none {
        link(url)[#text(weight: "bold", size: 11pt, name)]
      } else {
        text(weight: "bold", size: 11pt, name)
      }
      #if technologies != () {
        linebreak()
        text(fill: theme.colors.secondary, technologies.join(", "), size: 8pt)
      }
    ],

    align(right)[
      #if date != none {
        text(style: "italic", fill: theme.colors.secondary, date)
      }
    ],
  )

  if description != none {
    v(0.1em)
    if type(description) == array {
      list(..description.map(item => [#item]))
    } else {
      text(description, fill: theme.colors.text)
    }
  }

  v(0.5em)
}

// Skills component with categories
#let cv-skills(
  skills: (:),
  theme: (:),
  compact: false,
) = {
  block[
    #set par(justify: false)
    #for (category, items) in skills {
      if compact {
        text(weight: "semibold", size: 9pt, category + ":")
        linebreak()
        text(size: 9pt, items.join(", "))
      } else {
        text(weight: "semibold", category + ": ")
        items.join(", ")
      }
      v(0.3em)
    }
  ]
}

// Language skills component
#let cv-languages(
  languages: (),
  theme: (:),
  compact: false,
) = {
  for lang in languages {
    if compact {
      text(size: 9pt)[
        #text(weight: "semibold", lang.name): #lang.level
      ]
    } else {
      text(weight: "semibold", lang.name)
      h(0.5em)
      text(fill: theme.colors.secondary, "– " + lang.level)
    }
    linebreak()
  }
}

// Sidebar contact info component
#let cv-sidebar-contact(
  name: none,
  email: none,
  phone: none,
  location: none,
  links: (:),
  theme: (:),
) = {
  if email != none {
    box[#icon("envelope") #h(0.3em) #link("mailto:" + email)[#email]]
    linebreak()
  }

  if phone != none {
    box[#icon("phone") #h(0.3em) #phone]
    linebreak()
  }

  if location != none {
    box[#icon("location-dot") #h(0.3em) #location]
    linebreak()
  }

  v(0.5em)

  for (key, value) in links {
    if key == "github" {
      box[#icon("github") #h(0.3em) #link("https://github.com/" + value)[#value]]
    } else if key == "linkedin" {
      box[#icon("linkedin") #h(0.3em) #link("https://linkedin.com/in/" + value)[#value]]
    } else if key == "website" {
      box[#icon("globe") #h(0.3em) #link(value)[#value]]
    } else {
      box[#icon("link") #h(0.3em) #link(value)[#value]]
    }
    linebreak()
  }
}

// Photo component
#let cv-photo(
  path,
  width: 3.5cm,
  height: 3.5cm,
  theme: (:),
  radius: 999pt,
  border-width: 1pt,
  fit: "cover",
) = {
  let photo-box = box(
    width: width,
    height: height,
    clip: true,
    radius: radius,
    stroke: border-width + theme.colors.border,
  )[
    #image(path, fit: fit, width: 100%, height: 100%)
  ]

  align(center)[
    #photo-box
  ]
}

// Two-column layout helper
#let cv-two-columns(
  sidebar,
  main,
  sidebar-width: 1fr,
  main-width: 2fr,
  gutter: 1.5cm,
  sidebar-first: true,
) = {
  if sidebar-first {
    grid(
      columns: (sidebar-width, main-width),
      column-gutter: gutter,
      sidebar, main,
    )
  } else {
    grid(
      columns: (main-width, sidebar-width),
      column-gutter: gutter,
      main, sidebar,
    )
  }
}

// Page setup helper
#let cv-page(
  paper: "a4",
  margin: (x: 1.5cm, y: 2cm),
  numbering: none,
  font: "Helvetica Neue",
  font-size: 10pt,
  lang: "de",
  theme: (:),
  body,
) = {
  set document(
    title: "CV",
    author: "",
  )

  set page(
    paper: paper,
    margin: margin,
    numbering: numbering,
    number-align: right,
    // fill: theme.colors.background,
  )

  set text(
    font: font,
    size: font-size,
    lang: lang,
    fallback: true,
    fill: theme.colors.text,
  )

  set par(justify: true)

  // Apply theme colors
  show heading: set text(fill: theme.colors.primary)
  show heading.where(level: 1): set text(size: 18pt, weight: "bold")
  show heading.where(level: 2): set text(size: 14pt, weight: "bold")
  show heading.where(level: 3): set text(size: 12pt, weight: "semibold")

  show link: it => text(fill: theme.colors.accent, it)

  body
}
