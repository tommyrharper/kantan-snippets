import { ApolloServer, ApolloServerExpressConfig } from 'apollo-server-express';
import { GraphQLRequestContext } from 'apollo-server-types';

import {
  APP_ENV,
  ENABLE_GRAPHQL_PLAYGROUND,
  SERVICE_SECRET,
} from '../core/config';
import { logger } from '../core/logger';
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

const BASIC_ERROR_LOGGING = {
  requestDidStart() {
    return {
      didEncounterErrors(requestContext: GraphQLRequestContext) {
        logger.error(
          (requestContext.errors ?? []).map((error) => error.message).join(),
        );
      },
    };
  },
};

export const apolloServer = new ApolloServer({
  playground: ENABLE_GRAPHQL_PLAYGROUND === '1',
  introspection: APP_ENV === 'development',
  tracing: APP_ENV === 'development',
  dataSources: getDataSources,
  plugins: [BASIC_ERROR_LOGGING],
  typeDefs,
  resolvers,
  context,
  engine,
});
