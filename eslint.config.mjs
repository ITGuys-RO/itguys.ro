import { defineConfig, globalIgnores } from "eslint/config";
import nextVitals from "eslint-config-next/core-web-vitals";
import nextTs from "eslint-config-next/typescript";

const eslintConfig = defineConfig([
  ...nextVitals,
  ...nextTs,
  {
    rules: {
      // next/image is disabled (unoptimized: true) for Cloudflare Workers compatibility
      "@next/next/no-img-element": "off",
    },
  },
  globalIgnores([
    ".next/**",
    ".open-next/**",
    ".wrangler/**",
    "node_modules/**",
    "out/**",
    "build/**",
    "next-env.d.ts",
    "workers/**",
    "scripts/**",
  ]),
]);

export default eslintConfig;
