interface Env {
  GITHUB_TOKEN: string;
}

interface ScheduledEvent {
  cron: string;
  scheduledTime: number;
}

interface ExecutionContext {
  waitUntil(promise: Promise<unknown>): void;
  passThroughOnException(): void;
}

export default {
  async scheduled(event: ScheduledEvent, env: Env, ctx: ExecutionContext): Promise<void> {
    const response = await fetch(
      'https://api.github.com/repos/ITGuys-RO/itguys.ro/actions/workflows/daily-tech-news.yml/dispatches',
      {
        method: 'POST',
        headers: {
          'Authorization': `Bearer ${env.GITHUB_TOKEN}`,
          'Accept': 'application/vnd.github.v3+json',
          'User-Agent': 'ITGuys-Blog-Trigger/1.0',
        },
        body: JSON.stringify({ ref: 'master' }),
      }
    );

    if (!response.ok && response.status !== 204) {
      const error = await response.text();
      console.error(`GitHub API error: ${response.status} - ${error}`);
      throw new Error(`Failed to trigger workflow: ${response.status}`);
    }

    console.log('Successfully triggered daily-tech-news workflow');
  },
};
