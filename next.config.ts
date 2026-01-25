import type { NextConfig } from "next";

const nextConfig: NextConfig = {
  experimental: {
    // Limit parallel workers to reduce memory usage during build
    cpus: 1,
    workerThreads: false,
  },
  images: {
    unoptimized: true,
    remotePatterns: [
      {
        protocol: "https",
        hostname: "www.gravatar.com",
        pathname: "/avatar/**",
      },
    ],
  },
};

export default nextConfig;
