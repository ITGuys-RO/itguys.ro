# OpenGraph Image Required

An OpenGraph image is referenced in the site metadata but needs to be created.

## Requirements (per Google's documentation)

- **Filename**: og-image.png
- **Dimensions**: 1200x630 pixels (1.91:1 aspect ratio)
- **Format**: PNG or JPG
- **File size**: Keep under 8MB, ideally under 1MB
- **Content**: Should include:
  - ITGuys branding/logo
  - Tagline or key service offering
  - Clean, professional design
  - High contrast text for readability

## Implementation

1. Create the image with the specifications above
2. Save it as `og-image.png` in the `/public` directory
3. Test the image using:
   - Facebook Sharing Debugger: https://developers.facebook.com/tools/debug/
   - Twitter Card Validator: https://cards-dev.twitter.com/validator
   - LinkedIn Post Inspector: https://www.linkedin.com/post-inspector/

## Alternative: Per-Page Images

For better social sharing, consider creating unique OG images for each major page:
- `/public/og-home.png`
- `/public/og-services.png`
- `/public/og-about.png`
- `/public/og-portfolio.png`

Then update each page's metadata to reference its specific image.
