import { execSync } from "child_process";

const {
  LINKEDIN_ACCESS_TOKEN,
  LINKEDIN_REFRESH_TOKEN,
  LINKEDIN_CLIENT_ID,
  LINKEDIN_CLIENT_SECRET,
  GH_PAT_WORKFLOW,
  GITHUB_REPOSITORY,
} = process.env;

if (!LINKEDIN_REFRESH_TOKEN || !LINKEDIN_CLIENT_ID || !LINKEDIN_CLIENT_SECRET) {
  console.error("Missing LinkedIn credentials for token refresh");
  process.exit(1);
}

if (!GH_PAT_WORKFLOW || !GITHUB_REPOSITORY) {
  console.error("Missing GH_PAT_WORKFLOW or GITHUB_REPOSITORY for secret update");
  process.exit(1);
}

async function main() {
  // Exchange refresh token for new access + refresh tokens
  const body = new URLSearchParams({
    grant_type: "refresh_token",
    refresh_token: LINKEDIN_REFRESH_TOKEN,
    client_id: LINKEDIN_CLIENT_ID,
    client_secret: LINKEDIN_CLIENT_SECRET,
  });

  const response = await fetch("https://www.linkedin.com/oauth/v2/accessToken", {
    method: "POST",
    headers: { "Content-Type": "application/x-www-form-urlencoded" },
    body: body.toString(),
  });

  const data = await response.json();

  if (!response.ok || !data.access_token) {
    console.error("Token refresh failed:", JSON.stringify(data, null, 2));
    process.exit(1);
  }

  const ghEnv = { ...process.env, GH_TOKEN: GH_PAT_WORKFLOW };

  // Update access token if changed
  if (data.access_token !== LINKEDIN_ACCESS_TOKEN) {
    execSync("gh secret set LINKEDIN_ACCESS_TOKEN", {
      input: data.access_token,
      env: ghEnv,
      stdio: ["pipe", "inherit", "inherit"],
    });
  }

  // Update refresh token if a new one was issued
  if (data.refresh_token && data.refresh_token !== LINKEDIN_REFRESH_TOKEN) {
    execSync("gh secret set LINKEDIN_REFRESH_TOKEN", {
      input: data.refresh_token,
      env: ghEnv,
      stdio: ["pipe", "inherit", "inherit"],
    });
  }

  const expiresIn = data.expires_in ? `${Math.round(data.expires_in / 86400)} days` : "unknown";
  console.log(`LinkedIn token refreshed (expires in ${expiresIn}), secrets updated`);
}

main();
