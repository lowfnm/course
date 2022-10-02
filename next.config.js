require('dotenv').config();

/** @type {import('next').NextConfig} */
const nextConfig = {
  reactStrictMode: true,
  swcMinify: true
};

const {
  DATABASE_URL,
  AUTH0_CLIENTID,
  AITH0_DOMAIN,
  AUTH0_CLIENT_SECRET,
  AUTH0_SCOPE,
  AUTH0_COOKIE,
  BACKEND_ADRESS
} = process.env;

publicRuntimeConfig = {
  BACKEND_URL: `${BACKEND_ADRESS}/api/graphql`
};

serverRuntimeConfig = {
  auth: {
    domain: AITH0_DOMAIN,
    clientId: AUTH0_CLIENTID,
    clientSecret: AUTH0_CLIENT_SECRET,
    scope: AUTH0_SCOPE,
    redirectUrl: `${BACKEND_ADRESS}/api/callback`,
    postLogoutRedirectUrl: `${BACKEND_ADRESS}/`
  },
  cookieSecret: AUTH0_COOKIE
};

module.exports = {
  nextConfig,
  publicRuntimeConfig,
  serverRuntimeConfig
};
