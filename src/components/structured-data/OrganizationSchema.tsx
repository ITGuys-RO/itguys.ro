export function OrganizationSchema() {
  const schema = {
    "@context": "https://schema.org",
    "@type": "Organization",
    name: "ITGuys",
    legalName: "ITGUYS SRL",
    alternateName: "ITGuys Romania",
    url: "https://itguys.ro",
    vatID: "RO34846943",
    taxID: "RO34846943",
    logo: "https://itguys.ro/itguys_logo.png",
    description:
      "Custom software development, mobile development, and cybersecurity services. We build web apps, native mobile apps, APIs, and provide cybersecurity audits and penetration testing.",
    foundingDate: "2010",
    email: "contact@itguys.ro",
    telephone: "+40726205856",
    address: {
      "@type": "PostalAddress",
      addressCountry: "RO",
      addressLocality: "Romania",
    },
    areaServed: [
      {
        "@type": "Country",
        name: "Romania",
      },
      {
        "@type": "Country",
        name: "United Kingdom",
      },
      {
        "@type": "Country",
        name: "Germany",
      },
      {
        "@type": "AdministrativeArea",
        name: "Europe",
      },
    ],
    sameAs: [
      "https://www.linkedin.com/company/itguys-ro",
      "https://github.com/ITGuys-RO",
    ],
    hasOfferCatalog: {
      "@type": "OfferCatalog",
      name: "Software Development Services",
      itemListElement: [
        {
          "@type": "Offer",
          itemOffered: {
            "@type": "Service",
            name: "Custom Web Development",
            description:
              "Custom web applications built with modern technologies like React, Next.js, and Node.js",
          },
        },
        {
          "@type": "Offer",
          itemOffered: {
            "@type": "Service",
            name: "Mobile Development",
            description:
              "Native mobile development for iOS and Android. Custom mobile app development with real native performance.",
          },
        },
        {
          "@type": "Offer",
          itemOffered: {
            "@type": "Service",
            name: "Cybersecurity Services",
            description:
              "Cybersecurity audits, penetration testing, vulnerability assessments, and security consulting",
          },
        },
        {
          "@type": "Offer",
          itemOffered: {
            "@type": "Service",
            name: "API Development",
            description: "RESTful and GraphQL API development and integration",
          },
        },
      ],
    },
  };

  return (
    <script
      type="application/ld+json"
      dangerouslySetInnerHTML={{ __html: JSON.stringify(schema) }}
    />
  );
}
