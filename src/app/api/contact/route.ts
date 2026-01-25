import { NextResponse } from "next/server";

type ContactFormData = {
  name: string;
  email: string;
  company?: string;
  projectType?: string;
  description: string;
  turnstileToken: string;
};

type CloudflareEnv = {
  TURNSTILE_SECRET_KEY?: string;
  TELEGRAM_BOT_TOKEN?: string;
  TELEGRAM_CHAT_ID?: string;
};

async function getEnv(): Promise<CloudflareEnv> {
  // Use Cloudflare context for runtime vars (from wrangler.toml)
  const { getCloudflareContext } = await import('@opennextjs/cloudflare');
  const { env } = await getCloudflareContext({ async: true });
  return env as CloudflareEnv;
}

async function verifyTurnstile(token: string, secretKey: string): Promise<boolean> {
  const response = await fetch(
    "https://challenges.cloudflare.com/turnstile/v0/siteverify",
    {
      method: "POST",
      headers: { "Content-Type": "application/x-www-form-urlencoded" },
      body: new URLSearchParams({
        secret: secretKey,
        response: token,
      }),
    }
  );

  const result = await response.json();
  return result.success === true;
}

async function sendTelegramMessage(text: string, botToken: string, chatId: string): Promise<void> {
  const response = await fetch(
    `https://api.telegram.org/bot${botToken}/sendMessage`,
    {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({
        chat_id: chatId,
        text,
        parse_mode: "HTML",
      }),
    }
  );

  if (!response.ok) {
    const error = await response.text();
    throw new Error(`Telegram API error: ${error}`);
  }
}

export async function POST(request: Request) {
  try {
    const data: ContactFormData = await request.json();

    if (!data.name || !data.email || !data.description) {
      return NextResponse.json(
        { error: "Missing required fields" },
        { status: 400 }
      );
    }

    if (!data.turnstileToken) {
      return NextResponse.json(
        { error: "Security verification required" },
        { status: 400 }
      );
    }

    // Get env vars from Cloudflare context (wrangler.toml)
    const env = await getEnv();

    if (!env.TURNSTILE_SECRET_KEY) {
      console.error("TURNSTILE_SECRET_KEY not configured in wrangler.toml");
      return NextResponse.json(
        { error: "Server configuration error" },
        { status: 500 }
      );
    }

    const isValidToken = await verifyTurnstile(data.turnstileToken, env.TURNSTILE_SECRET_KEY);
    if (!isValidToken) {
      return NextResponse.json(
        { error: "Security verification failed. Please try again." },
        { status: 400 }
      );
    }

    if (!isValidEmail(data.email)) {
      return NextResponse.json(
        { error: "Invalid email address" },
        { status: 400 }
      );
    }

    const projectTypeLabels: Record<string, string> = {
      web: "Web Application",
      mobile: "Mobile Application",
      both: "Both Web and Mobile",
      security: "Security Services",
      other: "Other",
    };

    const projectTypeLabel = data.projectType
      ? projectTypeLabels[data.projectType] || data.projectType
      : "Not specified";

    const message = `
<b>New Project Inquiry</b>

<b>Name:</b> ${escapeHtml(data.name)}
<b>Email:</b> ${escapeHtml(data.email)}
<b>Company:</b> ${escapeHtml(data.company || "Not provided")}
<b>Project Type:</b> ${projectTypeLabel}

<b>Description:</b>
${escapeHtml(data.description)}
    `.trim();

    if (!env.TELEGRAM_BOT_TOKEN || !env.TELEGRAM_CHAT_ID) {
      console.error("Telegram credentials not configured in wrangler.toml");
      return NextResponse.json(
        { error: "Server configuration error" },
        { status: 500 }
      );
    }

    await sendTelegramMessage(message, env.TELEGRAM_BOT_TOKEN, env.TELEGRAM_CHAT_ID);

    return NextResponse.json({ success: true });
  } catch (error) {
    console.error("Contact form error:", error);
    return NextResponse.json(
      { error: "Failed to send message" },
      { status: 500 }
    );
  }
}

function escapeHtml(text: string): string {
  return text
    .replace(/&/g, "&amp;")
    .replace(/</g, "&lt;")
    .replace(/>/g, "&gt;");
}

function isValidEmail(email: string): boolean {
  if (typeof email !== "string" || email.length > 254) return false;
  const atIndex = email.indexOf("@");
  if (atIndex < 1 || atIndex > 64) return false;
  const localPart = email.slice(0, atIndex);
  const domain = email.slice(atIndex + 1);
  if (localPart.includes(" ") || domain.includes(" ")) return false;
  if (domain.length < 3 || !domain.includes(".")) return false;
  const lastDotIndex = domain.lastIndexOf(".");
  if (lastDotIndex === domain.length - 1 || lastDotIndex === 0) return false;
  return true;
}
