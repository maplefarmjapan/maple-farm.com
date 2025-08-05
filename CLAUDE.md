# Maple Farm Rental Property Website

## Project Overview
Minimalist web page describing a rental property with extreme performance optimization.

## Core Requirements
- **Static-only architecture**: HTML, CSS, and JavaScript only - no server-side processing
- **Ultra-fast loading**: Initial page load must be under 14kB and load extremely fast
- **Progressive loading**: Images load in background/on-demand to reduce costs and improve UX
- **Global performance**: Optimized for worldwide access
- **SEO optimized**: Target keywords for surrounding areas and location-based searches

## Loading Strategy
- **Initial load**: HTML + CSS + JS under 14kB (critical path)
- **Progressive enhancement**: Low-res thumbnails load first, high-quality on demand
- **Lazy loading**: Images only load when viewed/needed
- **Cost optimization**: Avoid loading all high-quality images unnecessarily

## Current Status
- **index.html**: 16kB (needs optimization to ~10-12kB)
- **Images**: 52 photos (will use progressive loading strategy)
- **Features**: Carousel, embedded maps, calendar, responsive design

## Technical Constraints
- No frameworks or libraries (to minimize initial bundle size)
- Inline CSS and JS for critical path (eliminate HTTP requests)
- Progressive image loading with lazy loading and quality stepping
- Use modern web standards (Intersection Observer API, loading="lazy")
- WebP format with fallbacks

## Development Workflow
- **Development**: Keep `index.html` unminified for easy manual editing
- **Deployment**: Create minified version only when ready to deploy
- **Source control**: Maintain readable source files

## Optimization Strategy
1. **Development phase**: Focus on functionality and content
2. **Pre-deployment**: 
   - Create minified HTML/CSS/JS version (under 14kB)
   - Generate optimized image sets (thumbnails, medium, high-res)
   - Implement lazy loading system
3. **Image strategy**: 
   - Tiny base64 placeholders or low-res thumbnails initially
   - Progressive loading: thumbnails → medium → high quality
   - Lazy loading for carousel images
4. **External resources**: Load maps/calendar asynchronously
5. **Performance**: Preload only first carousel image

## Files Structure
- `index.html` - Main development page (readable, unminified)
- `index.min.html` - Production version (generated pre-deployment)
- `images/` - Original high-quality images
- `images/thumbs/` - Generated thumbnails for progressive loading
- `CNAME` - Domain configuration

## SEO Strategy
### Primary Keywords
- **"Asahikawa airport"** - Target visitors flying into the region
- **"Biei"** - Famous nearby town with scenic attractions

### SEO Implementation
- Meta tags with location-specific keywords
- Structured data (JSON-LD) for rental property
- Semantic HTML with proper headings
- Alt text for images with location context
- Internal linking to location sections
- Geographic references throughout content

## Build Process (Pre-deployment)
1. Minify HTML/CSS/JS → `index.min.html`
2. Generate image thumbnails and WebP versions
3. Verify total critical path < 14kB
4. Verify SEO meta tags and structured data
5. Deploy minified version