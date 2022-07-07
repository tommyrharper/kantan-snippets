import { ApolloServer, ApolloServerExpressConfig } from 'apollo-server-express';

import {
  APP_ENV,
  ENABLE_GRAPHQL_PLAYGROUND,
  SERVICE_SECRET,
} from '../core/config';
import { context } from './context/context';
import { getDataSources } from './dataSources/dataSources';
import { resolvers } from './resolvers/resolvers';
import { typeDefs } from './typeDefs';

const engine: ApolloServerExpressConfig['engine'] =
  SERVICE_SECRET['ENGINE_API_KEY'] && APP_ENV
    ? {
        apiKey: SERVICE_SECRET['ENGINE_API_KEY'],
        schemaTag: APP_ENV,
      }
    : undefined;

export const apolloServer = new ApolloServer({
  playground: ENABLE_GRAPHQL_PLAYGROUND === '1',
  introspection: APP_ENV === 'development',
  tracing: APP_ENV === 'development',
  dataSources: getDataSources,
  plugins: [],
  typeDefs,
  resolvers,
  context,
  engine,
});
