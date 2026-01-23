export function WebsiteSchema() {
  const schema = {
    "@context": "https://schema.org",
    "@type": "WebSite",
    "@id": "https://itguys.ro/#website",
    url: "https://itguys.ro",
    name: "ITGuys",
    description:
      "Custom software development and security services based in Romania",
    publisher: {
      "@id": "https://itguys.ro/#organization",
    },
    potentialAction: [
      {
        "@type": "SearchAction",
        target: {
          "@type": "EntryPoint",
          urlTemplate: "https://itguys.ro/search?q={search_term_string}",
        },
        "query-input": "required name=search_term_string",
      },
    ],
    inLanguage: "en-US",
  };

  return (
    <script
      type="application/ld+json"
      dangerouslySetInnerHTML={{ __html: JSON.stringify(schema) }}
    />
  );
}
