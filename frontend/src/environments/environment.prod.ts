export const environment = {
  production: true,
  apiUrl: '/api',
  wsUrl: '/ws',
  auth: {
    tokenKey: 'auth_token',
    refreshTokenKey: 'refresh_token',
    expiryKey: 'token_expiry'
  },
  features: {
    enableChat: true,
    enableAI: true,
    enableAnalytics: true
  }
};
