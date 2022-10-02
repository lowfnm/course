import { initAuth0 } from '@auth0/nextjs-auth0';
import { SignInWithAuth0 } from '@auth0/nextjs-auth0/dist/instance';
import getConfig from 'next/config';

const { serverRuntimeConfig } = getConfig();
const { auth, cookieSecret } = serverRuntimeConfig;

const auth0: SignInWithAuth0 = initAuth0({
  ...auth,
  session: {
    cookieSecret,
    cookieLifeTime: 60 * 60 * 8,
    storeIdToke: false,
    storeAccessToken: false,
    storeRefreshToken: false
  },
  oidcClient: {
    httpTimeout: 2500,
    clockTolerance: 10000
  }
});

export default auth0;
