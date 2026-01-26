interface BlogPostingSchemaProps {
  title: string;
  description?: string | null;
  datePublished: string;
  dateModified: string;
  authorName?: string;
  image?: string | null;
  url: string;
}

export function BlogPostingSchema({
  title,
  description,
  datePublished,
  dateModified,
  authorName,
  image,
  url,
}: BlogPostingSchemaProps) {
  const schema = {
    "@context": "https://schema.org",
    "@type": "BlogPosting",
    headline: title,
    description: description || undefined,
    datePublished: datePublished,
    dateModified: dateModified,
    author: authorName
      ? {
          "@type": "Person",
          name: authorName,
        }
      : {
          "@type": "Organization",
          name: "ITGuys",
          url: "https://itguys.ro",
        },
    publisher: {
      "@type": "Organization",
      name: "ITGuys",
      url: "https://itguys.ro",
      logo: {
        "@type": "ImageObject",
        url: "https://itguys.ro/itguys_logo.png",
      },
    },
    mainEntityOfPage: {
      "@type": "WebPage",
      "@id": url,
    },
    ...(image && {
      image: {
        "@type": "ImageObject",
        url: image.startsWith("http") ? image : `https://itguys.ro${image}`,
      },
    }),
  };

  return (
    <script
      type="application/ld+json"
      dangerouslySetInnerHTML={{ __html: JSON.stringify(schema) }}
    />
  );
}
