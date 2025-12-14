import { ThemeConfigWithoutMetadata, ThemeColors } from '@/types/theme';

export const themes: ThemeConfigWithoutMetadata = {
  'professional-blue': {
    primary: '#2563EB',
    secondary: '#1E40AF',
    background: '#FFFFFF',
    surface: '#F0F7FF',
    text: {
      primary: '#1E293B',
      secondary: '#475569',
      accent: '#FFFFFF'
    },
    border: '#CBD5E1',
    success: '#059669',
    warning: '#D97706',
    error: '#DC2626',
    shadow: '0 4px 12px rgba(37, 99, 235, 0.15)'
  },
  'corporate-green': {
    primary: '#059669',
    secondary: '#047857',
    background: '#FFFFFF',
    surface: '#F0FDF4',
    text: {
      primary: '#1F2937',
      secondary: '#4B5563',
      accent: '#FFFFFF'
    },
    border: '#D1D5DB',
    success: '#059669',
    warning: '#D97706',
    error: '#DC2626',
    shadow: '0 4px 12px rgba(5, 150, 105, 0.15)'
  },
  'premium-purple': {
    primary: '#7C3AED',
    secondary: '#6D28D9',
    background: '#FFFFFF',
    surface: '#FAF5FF',
    text: {
      primary: '#1F2937',
      secondary: '#4B5563',
      accent: '#FFFFFF'
    },
    border: '#E5E7EB',
    success: '#059669',
    warning: '#D97706',
    error: '#DC2626',
    shadow: '0 4px 12px rgba(124, 58, 237, 0.15)'
  },
  'luxury-gold': {
    primary: '#D97706',
    secondary: '#B45309',
    background: '#1F2937',
    surface: '#374151',
    text: {
      primary: '#F9FAFB',
      secondary: '#E5E7EB',
      accent: '#1F2937'
    },
    border: '#4B5563',
    success: '#10B981',
    warning: '#F59E0B',
    error: '#EF4444',
    shadow: '0 4px 12px rgba(217, 119, 6, 0.2)'
  },
  'minimal-gray': {
    primary: '#4B5563',
    secondary: '#374151',
    background: '#FFFFFF',
    surface: '#F9FAFB',
    text: {
      primary: '#111827',
      secondary: '#6B7280',
      accent: '#FFFFFF'
    },
    border: '#E5E7EB',
    success: '#10B981',
    warning: '#F59E0B',
    error: '#EF4444',
    shadow: '0 2px 8px rgba(0, 0, 0, 0.08)'
  },
  'tech-cyan': {
    primary: '#06B6D4',
    secondary: '#0891B2',
    background: '#0F172A',
    surface: '#1E293B',
    text: {
      primary: '#F1F5F9',
      secondary: '#CBD5E1',
      accent: '#0F172A'
    },
    border: '#334155',
    success: '#10B981',
    warning: '#F59E0B',
    error: '#EF4444',
    shadow: '0 4px 12px rgba(6, 182, 212, 0.2)'
  }
};

export const darkThemes: Record<string, Partial<ThemeColors>> = {
  'professional-blue': {
    primary: '#3B82F6',
    secondary: '#60A5FA',
    background: '#0F172A',
    surface: '#1E293B',
    text: {
      primary: '#F1F5F9',
      secondary: '#CBD5E1',
      accent: '#FFFFFF'
    },
    border: '#334155',
    success: '#10B981',
    warning: '#F59E0B',
    error: '#EF4444',
    shadow: '0 4px 12px rgba(59, 130, 246, 0.2)'
  },
  'corporate-green': {
    primary: '#10B981',
    secondary: '#34D399',
    background: '#0F172A',
    surface: '#1E293B',
    text: {
      primary: '#F1F5F9',
      secondary: '#CBD5E1',
      accent: '#FFFFFF'
    },
    border: '#334155',
    success: '#10B981',
    warning: '#F59E0B',
    error: '#EF4444',
    shadow: '0 4px 12px rgba(16, 185, 129, 0.2)'
  },
  'premium-purple': {
    primary: '#8B5CF6',
    secondary: '#A78BFA',
    background: '#0F172A',
    surface: '#1E293B',
    text: {
      primary: '#F1F5F9',
      secondary: '#CBD5E1',
      accent: '#FFFFFF'
    },
    border: '#334155',
    success: '#10B981',
    warning: '#F59E0B',
    error: '#EF4444',
    shadow: '0 4px 12px rgba(139, 92, 246, 0.2)'
  },
  'luxury-gold': {
    primary: '#F59E0B',
    secondary: '#FBBF24',
    background: '#111827',
    surface: '#1F2937',
    text: {
      primary: '#F9FAFB',
      secondary: '#E5E7EB',
      accent: '#111827'
    },
    border: '#374151',
    success: '#10B981',
    warning: '#F59E0B',
    error: '#EF4444',
    shadow: '0 4px 12px rgba(245, 158, 11, 0.2)'
  },
  'minimal-gray': {
    primary: '#9CA3AF',
    secondary: '#D1D5DB',
    background: '#111827',
    surface: '#1F2937',
    text: {
      primary: '#F9FAFB',
      secondary: '#E5E7EB',
      accent: '#FFFFFF'
    },
    border: '#374151',
    success: '#10B981',
    warning: '#F59E0B',
    error: '#EF4444',
    shadow: '0 2px 8px rgba(0, 0, 0, 0.3)'
  },
  'tech-cyan': {
    primary: '#22D3EE',
    secondary: '#67E8F9',
    background: '#020617',
    surface: '#0F172A',
    text: {
      primary: '#F8FAFC',
      secondary: '#E2E8F0',
      accent: '#020617'
    },
    border: '#1E293B',
    success: '#10B981',
    warning: '#F59E0B',
    error: '#EF4444',
    shadow: '0 4px 12px rgba(34, 211, 238, 0.2)'
  }
};
