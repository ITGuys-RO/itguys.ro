import { readFileSync } from "fs";

const { FACEBOOK_PAGE_ID, FACEBOOK_ACCESS_TOKEN, SITE_URL } = process.env;

if (!FACEBOOK_PAGE_ID || !FACEBOOK_ACCESS_TOKEN) {
  console.error("Missing Facebook API credentials");
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

async function main() {
  const message = `${title}\n\n${desc}\n\n${hashtags}`.trim();

  // Facebook Graph API — publish to Page feed
  // Token is auto-refreshed by refresh-facebook-token.ts before each run.
  const response = await fetch(
    `https://graph.facebook.com/v24.0/${FACEBOOK_PAGE_ID}/feed`,
    {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({
        message,
        link: url,
        access_token: FACEBOOK_ACCESS_TOKEN,
      }),
    }
  );

  const data = await response.json();

  if (!response.ok) {
    console.error("Failed to post to Facebook:", data.error?.message ?? `HTTP ${response.status}`);
    process.exit(1);
  }

  console.log(`Facebook post published: https://facebook.com/${data.id}`);
}

main();
