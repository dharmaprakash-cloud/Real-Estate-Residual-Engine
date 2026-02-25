import axios from 'axios';
const API_BASE_URL = 'https://real-estate-analyzer-9.preview.emergentagent.com/api';
const apiClient = axios.create({
  baseURL: API_BASE_URL,
  timeout: 30000,
});

apiClient.interceptors.request.use((config) => {
  return config;
});

export const api = {
  analyzeProperty: async (propertyData: any) => {
    const response = await apiClient.post('/analysis/property', propertyData);
    return response.data;
  },
  getValuation: async (propertyId: string) => {
    const response = await apiClient.get(`/valuation/${propertyId}`);
    return response.data;
  },
  getCashFlowProjection: async (propertyId: string, years: number) => {
    const response = await apiClient.get(`/cashflow/${propertyId}`, { params: { years } });
    return response.data;
  },
  getPortfolio: async () => {
    const response = await apiClient.get('/portfolio');
    return response.data;
  },
  addProperty: async (property: any) => {
    const response = await apiClient.post('/portfolio/properties', property);
    return response.data;
  },
  removeProperty: async (propertyId: string) => {
    const response = await apiClient.delete(`/portfolio/properties/${propertyId}`);
    return response.data;
  },
  generateReport: async (propertyId: string) => {
    const response = await apiClient.get(`/reports/${propertyId}`);
    return response.data;
  },
  getMarketTrends: async (location: string) => {
    const response = await apiClient.get('/market/trends', { params: { location } });
    return response.data;
  },
};