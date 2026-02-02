import { TwitterApi } from "twitter-api-v2";
import { readFileSync } from "fs";

const {
  TWITTER_API_KEY,
  TWITTER_API_SECRET,
  TWITTER_ACCESS_TOKEN,
  TWITTER_ACCESS_SECRET,
  SITE_URL,
} = process.env;

if (!TWITTER_API_KEY || !TWITTER_API_SECRET || !TWITTER_ACCESS_TOKEN || !TWITTER_ACCESS_SECRET) {
  console.error("Missing Twitter API credentials");
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

// Twitter shortens all URLs to 23 chars via t.co
const T_CO_LENGTH = 23;
const urlPlaceholder = "x".repeat(T_CO_LENGTH);

// Build tweet, progressively trimming if over 280 chars
// Use placeholder for length calculation, real URL in final tweet
function buildTweet(...parts: string[]): string {
  const withPlaceholder = parts.join("\n\n").replace(url, urlPlaceholder);
  if (withPlaceholder.length <= 280) {
    return parts.join("\n\n");
  }
  return "";
}

const tweet =
  buildTweet(title, desc, url, hashtags) ||
  buildTweet(title, desc, url) ||
  buildTweet(title, url, hashtags) ||
  buildTweet(title, url) ||
  `${title}\n\n${url}`;

async function main() {
  const client = new TwitterApi({
    appKey: TWITTER_API_KEY,
    appSecret: TWITTER_API_SECRET,
    accessToken: TWITTER_ACCESS_TOKEN,
    accessSecret: TWITTER_ACCESS_SECRET,
  });

  try {
    const result = await client.v2.tweet(tweet);
    console.log(`Tweet posted: https://x.com/i/status/${result.data.id}`);
  } catch (err) {
    console.error("Failed to post tweet:", err instanceof Error ? err.message : "Unknown error");
    process.exit(1);
  }
}

main();
