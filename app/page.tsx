'use client';

import { useTheme } from '@/components/contexts/ThemeContext';

export default function Home() {
  const { theme, isDarkMode, fontFamily } = useTheme();

  return (
    <main className="min-h-screen p-8">
      <div className="max-w-6xl mx-auto">
        <div className="text-center mb-12">
          <h1 className="text-4xl font-bold mb-4" style={{ color: 'var(--primary)' }}>
            English Communities PK
          </h1>
          <p className="text-lg" style={{ color: 'var(--text-secondary)' }}>
            A dynamically themed Next.js application with hybrid theme system
          </p>
        </div>

        <div className="grid grid-cols-1 md:grid-cols-2 gap-8">
          {/* Theme Info Card */}
          <div 
            className="p-6 rounded-xl border shadow-lg"
            style={{
              backgroundColor: 'var(--surface)',
              borderColor: 'var(--border)',
              boxShadow: 'var(--shadow)'
            }}
          >
            <h2 className="text-2xl font-bold mb-4" style={{ color: 'var(--primary)' }}>
              Current Theme Settings
            </h2>
            <div className="space-y-4">
              <div className="flex items-center justify-between">
                <span style={{ color: 'var(--text-secondary)' }}>Active Theme:</span>
                <span className="font-medium capitalize">{theme.replace('-', ' ')}</span>
              </div>
              <div className="flex items-center justify-between">
                <span style={{ color: 'var(--text-secondary)' }}>Color Mode:</span>
                <span className="font-medium">{isDarkMode ? 'Dark' : 'Light'}</span>
              </div>
              <div className="flex items-center justify-between">
                <span style={{ color: 'var(--text-secondary)' }}>Font Family:</span>
                <span className="font-medium" style={{ fontFamily }}>{fontFamily}</span>
              </div>
            </div>
          </div>

          {/* Features Card */}
          <div 
            className="p-6 rounded-xl border shadow-lg"
            style={{
              backgroundColor: 'var(--surface)',
              borderColor: 'var(--border)',
              boxShadow: 'var(--shadow)'
            }}
          >
            <h2 className="text-2xl font-bold mb-4" style={{ color: 'var(--primary)' }}>
              Hybrid Theme System Features
            </h2>
            <ul className="space-y-3" style={{ color: 'var(--text-secondary)' }}>
              <li className="flex items-center">
                <div className="w-2 h-2 rounded-full mr-3" style={{ backgroundColor: 'var(--success)' }}></div>
                Dynamic CSS Variables
              </li>
              <li className="flex items-center">
                <div className="w-2 h-2 rounded-full mr-3" style={{ backgroundColor: 'var(--success)' }}></div>
                Light/Dark Mode Support
              </li>
              <li className="flex items-center">
                <div className="w-2 h-2 rounded-full mr-3" style={{ backgroundColor: 'var(--success)' }}></div>
                12+ Pre-built Themes
              </li>
              <li className="flex items-center">
                <div className="w-2 h-2 rounded-full mr-3" style={{ backgroundColor: 'var(--success)' }}></div>
                Font Family Selection
              </li>
              <li className="flex items-center">
                <div className="w-2 h-2 rounded-full mr-3" style={{ backgroundColor: 'var(--success)' }}></div>
                LocalStorage Persistence
              </li>
            </ul>
          </div>
        </div>

        {/* Instructions */}
        <div 
          className="mt-12 p-6 rounded-xl border"
          style={{
            backgroundColor: 'var(--surface)',
            borderColor: 'var(--border)'
          }}
        >
          <h3 className="text-xl font-bold mb-3" style={{ color: 'var(--primary)' }}>
            How to Use
          </h3>
          <p style={{ color: 'var(--text-secondary)' }}>
            Click the theme settings button (floating button) to change themes, fonts, and toggle dark mode. 
            All settings are saved automatically and persist across page reloads.
          </p>
        </div>
      </div>
    </main>
  );
}
