const {
  FACEBOOK_ACCESS_TOKEN,
  FACEBOOK_APP_ID,
  FACEBOOK_APP_SECRET,
  GH_PAT_WORKFLOW,
  GITHUB_REPOSITORY,
} = process.env;

if (!FACEBOOK_ACCESS_TOKEN || !FACEBOOK_APP_ID || !FACEBOOK_APP_SECRET) {
  console.error("Missing Facebook credentials for token refresh");
  process.exit(1);
}

if (!GH_PAT_WORKFLOW || !GITHUB_REPOSITORY) {
  console.error("Missing GH_PAT_WORKFLOW or GITHUB_REPOSITORY for secret update");
  process.exit(1);
}

// Exchange current token for a new long-lived token (~60 days)
const url = new URL("https://graph.facebook.com/v24.0/oauth/access_token");
url.searchParams.set("grant_type", "fb_exchange_token");
url.searchParams.set("client_id", FACEBOOK_APP_ID);
url.searchParams.set("client_secret", FACEBOOK_APP_SECRET);
url.searchParams.set("fb_exchange_token", FACEBOOK_ACCESS_TOKEN);

const response = await fetch(url);
const data = await response.json();

if (!response.ok || !data.access_token) {
  console.error("Token refresh failed:", JSON.stringify(data, null, 2));
  process.exit(1);
}

if (data.access_token === FACEBOOK_ACCESS_TOKEN) {
  console.log("Token unchanged, skipping secret update");
  process.exit(0);
}

// Update the GitHub secret via gh CLI (requires GH_TOKEN env var)
const { execSync } = await import("child_process");
execSync(`gh secret set FACEBOOK_ACCESS_TOKEN`, {
  input: data.access_token,
  env: { ...process.env, GH_TOKEN: GH_PAT_WORKFLOW },
  stdio: ["pipe", "inherit", "inherit"],
});

const expiresIn = data.expires_in ? `${Math.round(data.expires_in / 86400)} days` : "unknown";
console.log(`Facebook token refreshed (expires in ${expiresIn}), secret updated`);
