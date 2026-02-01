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
      "Custom software development and security services. We build web apps, mobile apps, APIs, and provide security audits and penetration testing.",
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
            name: "Mobile App Development",
            description:
              "Native and cross-platform mobile applications for iOS and Android",
          },
        },
        {
          "@type": "Offer",
          itemOffered: {
            "@type": "Service",
            name: "Security Services",
            description:
              "Security audits, penetration testing, and vulnerability assessments",
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
