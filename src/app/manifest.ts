import { MetadataRoute } from 'next';

export default function manifest(): MetadataRoute.Manifest {
  return {
    name: 'ITGuys - Custom Software Development & Security',
    short_name: 'ITGuys',
    description:
      'Custom web and mobile apps, plus security services. We build software with the right technology for your problem.',
    start_url: '/',
    display: 'standalone',
    background_color: '#ffffff',
    theme_color: '#6b8db9',
    icons: [
      {
        src: '/itguys_logo.png',
        sizes: 'any',
        type: 'image/png',
      },
    ],
  };
}
