export function LocalBusinessSchema() {
  const schema = {
    "@context": "https://schema.org",
    "@type": "ProfessionalService",
    "@id": "https://itguys.ro/#localbusiness",
    name: "ITGuys",
    image: "https://itguys.ro/itguys_logo.png",
    url: "https://itguys.ro",
    telephone: "+40726205856",
    email: "contact@itguys.ro",
    priceRange: "$$",
    address: {
      "@type": "PostalAddress",
      addressCountry: "RO",
      addressLocality: "Romania",
    },
    openingHoursSpecification: [
      {
        "@type": "OpeningHoursSpecification",
        dayOfWeek: ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"],
        opens: "09:00",
        closes: "18:00",
      },
    ],
    geo: {
      "@type": "GeoCoordinates",
      latitude: 44.4268,
      longitude: 26.1025,
    },
    areaServed: {
      "@type": "GeoCircle",
      geoMidpoint: {
        "@type": "GeoCoordinates",
        latitude: 44.4268,
        longitude: 26.1025,
      },
      geoRadius: "5000000",
    },
    sameAs: [
      // Add social media profiles when available
    ],
  };

  return (
    <script
      type="application/ld+json"
      dangerouslySetInnerHTML={{ __html: JSON.stringify(schema) }}
    />
  );
}
