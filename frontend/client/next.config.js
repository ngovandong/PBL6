/** @type {import('next').NextConfig} */
const nextConfig = {
  // reactStrictMode: true,
  swcMinify: true,
  images: {
    domains: ['images.unsplash.com', 'localhost', 'lh3.googleusercontent.com', 'res.cloudinary.com']
  },
  compiler: {
    styledComponents: true,
  },
}

module.exports = nextConfig
