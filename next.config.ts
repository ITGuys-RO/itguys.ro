import type { NextConfig } from "next";

const nextConfig: NextConfig = {
  output: 'standalone',
  experimental: {
    cpus: process.env.BUILD_CPUS ? parseInt(process.env.BUILD_CPUS) : 1,
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
