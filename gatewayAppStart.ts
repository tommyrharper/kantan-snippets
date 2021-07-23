import * as Sentry from '@sentry/node';
import AWSXRay from 'aws-xray-sdk';
import bodyParser from 'body-parser';
import express from 'express';

import { APP_ENV, GIT_COMMIT_REFERENCE, SERVICE_SECRET } from './core/config';
import { logger, loggingMiddleware } from './core/logger';
import { apolloServer } from './graphql/apolloServer';
import { healthcheckHandler } from './handlers';

AWSXRay.setLogger(logger);
AWSXRay.config([AWSXRay.plugins.ECSPlugin]);

function buildApp() {
  const xRaySegmentName = `kantan-gateway-${APP_ENV}`;
  const app = express();

  Sentry.init({
    dsn: SERVICE_SECRET['SENTRY_DSN'],
    environment: APP_ENV,
    release: `kantan-gateway-${APP_ENV}@${GIT_COMMIT_REFERENCE}`,
  });

  // The error request handler must be the first middleware on the app
  app.use(Sentry.Handlers.requestHandler() as express.RequestHandler);

  app.use(bodyParser.json());
  app.use(loggingMiddleware);
  app.use(AWSXRay.express.openSegment(xRaySegmentName));

  app.get('/health', healthcheckHandler);
  apolloServer.applyMiddleware({ app, path: '/graphql' });

  // The error handler must be before any other error middleware and after all controllers
  app.use(
    Sentry.Handlers.errorHandler({
      shouldHandleError: () => true,
    }),
  );

  app.use(AWSXRay.express.closeSegment());

  return app;
}

export { buildApp };
