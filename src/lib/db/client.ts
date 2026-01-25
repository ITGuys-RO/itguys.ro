export type D1Database = {
  prepare(query: string): D1PreparedStatement;
  batch<T = unknown>(statements: D1PreparedStatement[]): Promise<D1Result<T>[]>;
  exec(query: string): Promise<D1ExecResult>;
};

export type D1PreparedStatement = {
  bind(...values: unknown[]): D1PreparedStatement;
  first<T = unknown>(colName?: string): Promise<T | null>;
  run<T = unknown>(): Promise<D1Result<T>>;
  all<T = unknown>(): Promise<D1Result<T>>;
  raw<T = unknown>(): Promise<T[]>;
};

export type D1Result<T = unknown> = {
  results: T[];
  success: boolean;
  meta: {
    duration: number;
    changes: number;
    last_row_id: number;
    served_by: string;
  };
};

export type D1ExecResult = {
  count: number;
  duration: number;
};

// Extend CloudflareEnv globally to include our D1 binding
declare global {
  interface CloudflareEnv {
    DB?: D1Database;
  }
}

export async function getDB(): Promise<D1Database> {
  // Dynamic import to avoid bundling issues with OpenNext
  const { getCloudflareContext } = await import('@opennextjs/cloudflare');

  // Use async mode for production compatibility
  const { env } = await getCloudflareContext({ async: true });

  if (env.DB) {
    return env.DB;
  }

  throw new Error('D1 database not available - ensure DB binding is configured in wrangler.toml');
}

// Helper to run a single query and return results
export async function query<T>(sql: string, params: unknown[] = []): Promise<T[]> {
  const db = await getDB();
  const stmt = db.prepare(sql);
  const bound = params.length > 0 ? stmt.bind(...params) : stmt;
  const result = await bound.all<T>();
  return result.results;
}

// Helper to run a single query and return first result
export async function queryFirst<T>(sql: string, params: unknown[] = []): Promise<T | null> {
  const db = await getDB();
  const stmt = db.prepare(sql);
  const bound = params.length > 0 ? stmt.bind(...params) : stmt;
  return bound.first<T>();
}

// Helper to run an insert/update/delete and return affected rows info
export async function execute(sql: string, params: unknown[] = []): Promise<{ changes: number; lastRowId: number }> {
  const db = await getDB();
  const stmt = db.prepare(sql);
  const bound = params.length > 0 ? stmt.bind(...params) : stmt;
  const result = await bound.run();
  return {
    changes: result.meta.changes,
    lastRowId: result.meta.last_row_id,
  };
}

// Helper to run multiple statements in a batch
export async function batch(statements: Array<{ sql: string; params?: unknown[] }>): Promise<D1Result[]> {
  const db = await getDB();
  const prepared = statements.map(({ sql, params }) => {
    const stmt = db.prepare(sql);
    return params && params.length > 0 ? stmt.bind(...params) : stmt;
  });
  return db.batch(prepared);
}
