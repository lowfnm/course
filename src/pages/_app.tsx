import type { AppProps } from 'next/app';
import { ApolloProvider } from '@apollo/client';
import { useApollo } from 'utils/apolloClient';

const MyApp = ({ Component, pageProps }: AppProps) => {
  const apolloClient = useApollo(pageProps);

  return (
    <ApolloProvider client={apolloClient}>
      <Component {...pageProps} />;
    </ApolloProvider>
  );
};

export default MyApp;
