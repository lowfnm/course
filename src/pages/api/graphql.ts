import { ApolloServer } from 'apollo-server-micro';
import { makeExecutableSchema } from 'graphql-tools';
import Cors from 'micro-cors';
import { applyMiddleware } from 'graphql-middleware';
import { context, log, permissions, resolvers, typeDefs } from 'utils/api';

const cors = Cors();

const schema = applyMiddleware(
  makeExecutableSchema({ typeDefs, resolvers }),
  log,
  permissions
);

export const config = {
  api: {
    bodyParser: false
  }
};

const server = new ApolloServer({ schema, context });

const startServer = server.start();

export default cors(async (req, res: any) => {
  if (req.method === 'OPTIONS') {
    res.end();
    return false;
  }

  await startServer;
  await server.createHandler({ path: '/api/graphql' })(req, res);
});
