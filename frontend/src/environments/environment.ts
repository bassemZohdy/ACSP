export const environment = {
  production: false,
  apiUrl: 'http://localhost:8080/api',
  wsUrl: 'ws://localhost:8080/ws',
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
