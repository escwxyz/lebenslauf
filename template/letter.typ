// Example motivation letter (Anschreiben) using the lebenslauf package

#import "../src/lib.typ": *

#let theme = themes.professional

#cv-page(
  theme: theme,
  paper: "a4",
  margin: (x: 2.5cm, y: 2.5cm),
  font: "Helvetica Neue",
  lang: "de",
)[
  // Sender block (top left)
  #letter-sender(
    name: "Sophie Matik",
    street: "Mathweg 42",
    postal-code: "31415",
    city: "Pi-Stadt",
    email: "so.matik@mail.de",
    phone: "0101 / 10 10 01 11",
    theme: theme,
  )

  // Date (top right)
  #letter-date(
    place-and-date: "Hamburg, 3. März 2023",
    theme: theme,
  )

  // Recipient address
  #letter-recipient(
    company: "Zielfirma GmbH",
    person: "Herr Peter Personaler",
    street: "Fantastr. 1",
    postal-code: "12345",
    city: "Nachbarstadt",
    theme: theme,
  )

  // Subject line
  #letter-subject(
    title: "Bewerbung für / als ...",
    theme: theme,
  )

  // Letter body
  #letter-body[
    Sehr geehrter Herr Personaler,

    #v(0.8em)

    es wird Sie nicht überraschen: Als gelernte Bilanzbuchhalterin ist der Schwerpunkt
    meines BWL-Studiums „Rechnungswesen“. Natürlich! Dort fühle ich mich wohl,
    Zahlen sind meine Welt. Und zwar so richtig. So kann ich meine erworbenen
    Kenntnisse auch gleich in der Rechnungsabteilung unseres elterlichen Betriebs
    praktisch nebenbei erproben und ausbauen.

    #v(0.8em)

    Aber: Das Unternehmen meiner Eltern – so schön es dort auch ist –, ist eben nicht
    die große weite Welt. Daher möchte ich mein Praktikum im Sommersemester dazu
    nutzen, in der Buchhaltung und im Rechnungswesen eines internationalen
    Konzerns mein Wissen auszubauen und zu vertiefen.

    #v(0.8em)

    Wie ich dabei auf Sie komme? Ist doch klar: Sie genießen in der Branche einen
    hervorragenden Ruf, auch Ihre Welt sind die Zahlen und mir gefällt die strategische
    Ausrichtung Ihres Unternehmens hervorragend!

    #v(0.8em)

    Außerdem habe ich gehört, dass Sie im Zeitraum meines Praktikums die
    Einführung der Software XY planen. Da ich damit während meines
    Auslandssemesters in den USA schon ausführlich gearbeitet habe, kann ich mir gut
    vorstellen, Ihnen dabei das eine oder andere Mal behilflich sein zu können …

    #v(0.8em)

    Was halten Sie davon? Bei Interesse freue ich mich über Ihre Rückmeldung.
  ]

  // Signature
  #letter-signature(
    closing: "Mit den besten Grüßen nach Nachbarstadt",
    name: "Sophie Matik",
    signature-image: none,
    theme: theme,
  )
]
