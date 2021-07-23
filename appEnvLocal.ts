import { Platform } from 'react-native';

import { Env } from './types';

export const env: Env = {
  ENVIRONMENT: 'local',
  KANTAN_GATEWAY_URI:
    // Staging environment is used as default backend
  // 'https://gateway.staging.kantan.dev/graphql',
  'http://localhost:8080/graphql', // iOS Emulator
  // 'http://10.0.2.2:8080/graphql', // Android Emulator
  // 'http://[[ Your machine's local IP address ]]:8080/graphql', // Physical device
  READONLY_APPCENTER_API_TOKEN: 'ac2215072ba400e9188f193f791389ffbd25e52d',
  APPCENTER_APP_ID: `KantanApp-${
    Platform.OS === 'ios' ? 'ios' : 'android'
  }-dev`,
  SEGMENT_WRITE_KEY: 'H0otwJZYA0TpoExmKNyUU2gq5AgtVA11',
  LD_MOBILE_KEY: 'mob-5a82028c-4bf4-44a3-8442-8143809b8003',
  SENTRY_ENABLED: false,
  SEGMENT_ENABLED: false,
  CONFIGCAT_SDK_KEY: '3hzYCFh0SESKsWCSdITp2A/9pHBvf3XKUCU6DFGIDB3KQ',
  KANTAN_SUPPORT_EMAIL: 'test+support@kantan.tech',
  CHP_OPS_EMAIL: 'test+chp@kantan.tech',
  CHP_ACTION_EMAIL: 'test+chp@kantan.tech',
  INTERCOM_APP_ID: 'p6c5twx6',
  INTERCOM_ANDROID_API_KEY:
    'android_sdk-ad7cddf4bdeab38fb02679f277f587abf930c80c',
  INTERCOM_IOS_API_KEY: 'ios_sdk-09c44d762b311ba7b2cb43635e03f643d0e6d4e2',
  POSTCODER_API_KEY: 'PCWTM-SWV7X-SK9S4-VM3ZA',
  LOGIN_URI: 'https://login.kantan.co.uk',
};
