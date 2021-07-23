import * as Sentry from '@sentry/react-native';

import { env } from '../environment/';

export const initSentry = async () => {
  const { dist, release } = await import('../environment/version.json');
  Sentry.init({
    dsn: env.SENTRY_ENABLED
      ? 'https://ca4cab1532cd4742810673ed3d7b04fd@sentry.io/1792248'
      : undefined,
    environment: env.ENVIRONMENT,
    enableAutoSessionTracking: true,
    release,
    dist,
    beforeBreadcrumb(breadcrumb) {
      // if (env.ENVIRONMENT === 'local' && process.env.NODE_ENV !== 'test') {
      //   const extra = Object.entries(breadcrumb.data ?? {}).map(
      //     ([key, value]) => `${key}: ${JSON.stringify(value, null, 2)}`,
      //   );
      //   console.info(
      //     `[${breadcrumb.category}] ${breadcrumb.message}`,
      //     extra.length ? `\n${extra.join('\n')}` : '',
      //   );
      // }
      return breadcrumb;
    },
  });
  Sentry.addBreadcrumb({
    message: 'Init sentry',
    data: { dist, release },
  });
};
