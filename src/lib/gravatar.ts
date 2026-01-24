import { createHash } from "crypto";

/**
 * Generate a Gravatar URL from an email address
 * @param email - The email address to generate the Gravatar for
 * @param size - The size of the avatar in pixels (default: 200)
 * @param defaultImage - The default image to use if no Gravatar is found (default: 'mp' for mystery person)
 * @returns The Gravatar URL
 */
export function getGravatarUrl(
  email: string,
  size: number = 200,
  defaultImage: string = "mp"
): string {
  const trimmedEmail = email.trim().toLowerCase();
  const hash = createHash("md5").update(trimmedEmail).digest("hex");
  return `https://www.gravatar.com/avatar/${hash}?s=${size}&d=${defaultImage}`;
}
