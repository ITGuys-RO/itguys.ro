interface WebPageSchemaProps {
  title: string;
  description: string;
  url: string;
  breadcrumbs?: Array<{ name: string; url: string }>;
}

export function WebPageSchema({
  title,
  description,
  url,
  breadcrumbs,
}: WebPageSchemaProps) {
  const schema = {
    "@context": "https://schema.org",
    "@type": "WebPage",
    "@id": `${url}#webpage`,
    url: url,
    name: title,
    description: description,
    isPartOf: {
      "@id": "https://itguys.ro/#website",
    },
    about: {
      "@id": "https://itguys.ro/#organization",
    },
    ...(breadcrumbs && {
      breadcrumb: {
        "@id": `${url}#breadcrumb`,
      },
    }),
    inLanguage: "en-US",
    potentialAction: [
      {
        "@type": "ReadAction",
        target: [url],
      },
    ],
  };

  return (
    <script
      type="application/ld+json"
      dangerouslySetInnerHTML={{ __html: JSON.stringify(schema) }}
    />
  );
}
