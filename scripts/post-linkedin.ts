import { readFileSync } from "fs";

const { LINKEDIN_ACCESS_TOKEN, LINKEDIN_ORG_ID, SITE_URL } = process.env;

if (!LINKEDIN_ACCESS_TOKEN || !LINKEDIN_ORG_ID) {
  console.error("Missing LinkedIn API credentials");
  process.exit(1);
}

if (!SITE_URL) {
  console.error("Missing SITE_URL");
  process.exit(1);
}

const post = JSON.parse(readFileSync("blog-post.json", "utf-8"));

const title: string = post.translations.en.title;
const desc: string = post.translations.en.meta_description;
const slug: string = post.slug;
const tags: string[] = post.tags || [];
const url = `${SITE_URL}/blog/${slug}`;

// Convert tags to hashtags: "tech-news" → "#TechNews"
const hashtags = tags
  .map((t: string) =>
    "#" + t.split("-").map((w: string) => w.charAt(0).toUpperCase() + w.slice(1)).join("")
  )
  .join(" ");

const commentary = `${title}\n\n${desc}\n\n${hashtags}`.trim();

// LinkedIn Posts API — publish article share to company page
// Token is auto-refreshed by refresh-linkedin-token.ts before each run.
const response = await fetch("https://api.linkedin.com/rest/posts", {
  method: "POST",
  headers: {
    "Authorization": `Bearer ${LINKEDIN_ACCESS_TOKEN}`,
    "Content-Type": "application/json",
    "LinkedIn-Version": "202501",
    "X-Restli-Protocol-Version": "2.0.0",
  },
  body: JSON.stringify({
    author: `urn:li:organization:${LINKEDIN_ORG_ID}`,
    commentary,
    visibility: "PUBLIC",
    distribution: { feedDistribution: "MAIN_FEED" },
    content: {
      article: {
        source: url,
        title,
        description: desc,
      },
    },
    lifecycleState: "PUBLISHED",
  }),
});

if (!response.ok) {
  const data = await response.json().catch(() => response.statusText);
  console.error("Failed to post to LinkedIn:", JSON.stringify(data, null, 2));
  process.exit(1);
}

// LinkedIn returns 201 with x-restli-id header on success
const postId = response.headers.get("x-restli-id");
console.log(`LinkedIn post published: https://www.linkedin.com/feed/update/${postId}`);
