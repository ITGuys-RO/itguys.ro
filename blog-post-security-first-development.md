# Blog Post: Security-First Development

## Admin Panel Fields

| Field | Value |
|-------|-------|
| **Title** | Security-First Development: What We Learned from Pentesting at EA |
| **Slug** | `security-first-development` |
| **Excerpt** | Most security vulnerabilities aren't clever attacks. They're simple mistakes developers make because they've never seen how attackers think. Here's what building software looks like when your team has actually broken into systems. |
| **Tags** | Security, Development |
| **Meta Title** | Security-First Development: Lessons from Pentesting \| ITGuys Blog |
| **Meta Description** | Penetration testing changes how you write code. Security tips from developers who've been on both sides. |

---

## Content

When you've spent time breaking into systems professionally, you write code differently. You've seen what actually gets exploited.

Most security vulnerabilities aren't clever zero-days. They're predictable mistakes developers keep making because they've never had to think like an attacker.

## The Mistakes We See Over and Over

After doing penetration testing at Electronic Arts and security assessments at TUI, the same vulnerabilities show up everywhere:

**Trusting the frontend**

The frontend says the user is an admin? Better check that on the backend too. We've lost count of how many "admin-only" features we've accessed by changing a boolean in localStorage or editing a request body.

```javascript
// What we see
if (user.role === 'admin') {
  showAdminPanel();
}

// What's missing
// Server-side validation on every admin endpoint
```

**SQL queries built with string concatenation**

ORMs exist for a reason. Every time you write `WHERE id = ${userId}`, an attacker somewhere smiles.

**Secrets in environment variables, committed to git**

We've found production database credentials, API keys, and JWT secrets in public repositories. Once it's in git history, it's there forever.

**"It's an internal tool"**

Internal tools get compromised first. They're the ones with hardcoded credentials, no rate limiting, and SQL injection vulnerabilities from 2015. Once an attacker gets inside your network, these are the first targets.

## What Security-First Actually Means

It means making different decisions from the start, not bolting security on at the end.

Input validation happens on the server. Always. Client-side validation is for UX.

Authentication and authorization are separate. Knowing who someone is doesn't mean they can do what they're asking.

Logs exist for security, not just debugging. When something goes wrong, you need to know what happened and who did it.

Dependencies get audited. That npm package with 47 transitive dependencies? Each one is a potential vulnerability.

## The Question We Ask on Every Project

Before writing any code, we ask: "If this system were compromised, what's the worst that could happen?"

The answer shapes everything.

Sometimes it's "not much." A static marketing site doesn't need the same security posture as a payment system. Over-engineering security wastes time and money.

But when the answer is "customer data gets leaked" or "financial transactions get manipulated," that changes every architectural decision we make.

## Building Software That's Harder to Break

Security is a way of thinking about every feature you build.

We'll share more specific techniques in future posts - authentication patterns that work, common API vulnerabilities, secure deployment practices. Stuff you can actually use.

If you're building something where security matters, [let's talk](/contact). We've been on both sides of this.
