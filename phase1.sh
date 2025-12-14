#!/bin/bash

echo "========================================="
echo "Setting up Next.js 16.0.10 Project"
echo "========================================="

# Create project directory structure
mkdir -p app
mkdir -p components/contexts
mkdir -p components/ui
mkdir -p constants
mkdir -p types
mkdir -p public

echo "✓ Directory structure created"

# Create app files
cat > app/layout.tsx << 'EOF'
import type { Metadata } from 'next';
import { Inter } from 'next/font/google';
import './globals.css';
import { ThemeProvider } from '@/components/contexts/ThemeContext';
import ThemeSettingsButton from '@/components/ui/ThemeSettingsButton';
import ThemeInfo from '@/components/ui/ThemeInfo';

const inter = Inter({ subsets: ['latin'] });

export const metadata: Metadata = {
  title: 'English Communities PK',
  description: 'Dynamic theme-based Next.js application',
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="en" suppressHydrationWarning>
      <head>
        <meta name="theme-color" content="#2563EB" />
        <link rel="manifest" href="/manifest.json" />
      </head>
      <body className={inter.className}>
        <ThemeProvider>
          <ThemeInfo />
          <ThemeSettingsButton />
          {children}
        </ThemeProvider>
      </body>
    </html>
  );
}
EOF

cat > app/page.tsx << 'EOF'
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
EOF

cat > app/globals.css << 'EOF'
@import "tailwindcss";
@import "../components/css/global-utilities.css";

/* Base styles */
body {
  background: var(--background);
  color: var(--text-primary);
  font-family: var(--font-family, Arial, Helvetica, sans-serif);
  margin: 0;
  padding: 0;
  min-height: 100vh;
}

/* Dark mode */
.dark {
  color-scheme: dark;
}

/* Dark Reader prevention */
[data-darkreader-inline-bgcolor],
[data-darkreader-inline-bgimage],
[data-darkreader-inline-color],
[data-darkreader-inline-stroke],
[data-darkreader-inline-fill] {
  all: unset !important;
}

html[data-darkreader-mode],
html[data-darkreader-scheme] {
  --darkreader-bg--surface: unset !important;
  --darkreader-text--primary: unset !important;
  --darkreader-text--secondary: unset !important;
}
EOF

cat > app/template.tsx << 'EOF'
'use client';

import { useEffect, useState } from 'react';

export default function Template({ children }: { children: React.ReactNode }) {
  const [isMounted, setIsMounted] = useState(false);

  useEffect(() => {
    setIsMounted(true);
  }, []);

  if (!isMounted) {
    return (
      <div className="flex items-center justify-center min-h-screen">
        <div className="animate-spin rounded-full h-8 w-8 border-t-2 border-b-2 border-primary"></div>
      </div>
    );
  }

  return <>{children}</>;
}
EOF

# Create components/contexts/ThemeContext.tsx (Already provided by you)
cat > components/contexts/ThemeContext.tsx << 'EOF'
'use client';

import React, { createContext, useContext, useEffect, useState } from 'react';
import { Theme, ThemeColors, FontOption, ThemeOption } from '@/types/theme';
import { 
  THEMES_CONFIG, 
  FONT_OPTIONS, 
  getThemeColors, 
  getAvailableThemes,
  getThemeCategories 
} from '@/constants/themeConfig';

interface ThemeContextType {
  theme: Theme;
  themeColors: ThemeColors;
  fontFamily: string;
  setTheme: (theme: Theme) => void;
  setFontFamily: (font: string) => void;
  availableThemes: ThemeOption[];
  themeCategories: { id: string; name: string }[];
  availableFonts: FontOption[];
  isInitialized: boolean;
  isDarkMode: boolean;
  toggleDarkMode: () => void;
}

const ThemeContext = createContext<ThemeContextType | undefined>(undefined);

// Default theme
const defaultTheme: Theme = 'professional-blue';

export const ThemeProvider: React.FC<{ children: React.ReactNode }> = ({ children }) => {
  const [theme, setThemeState] = useState<Theme>(defaultTheme);
  const [themeColors, setThemeColors] = useState<ThemeColors>(getThemeColors(defaultTheme, false));
  const [isInitialized, setIsInitialized] = useState(false);
  const [isDarkMode, setIsDarkMode] = useState(false);
  const [fontFamily, setFontFamilyState] = useState<string>('system-ui');

  const availableThemes = getAvailableThemes();
  const themeCategories = getThemeCategories();
  const availableFonts = FONT_OPTIONS;

  // Function to apply theme to entire document
  const applyThemeStyles = (colors: ThemeColors, darkMode: boolean, font: string) => {
    if (typeof window === 'undefined') return;
    
    const root = document.documentElement;
    const body = document.body;
    
    // Clear all previous theme classes
    body.classList.remove('light', 'dark');
    root.classList.remove('light', 'dark');
    
    // Apply CSS Variables
    root.style.setProperty('--primary', colors.primary);
    root.style.setProperty('--secondary', colors.secondary);
    root.style.setProperty('--background', colors.background);
    root.style.setProperty('--surface', colors.surface);
    root.style.setProperty('--text-primary', colors.text.primary);
    root.style.setProperty('--text-secondary', colors.text.secondary);
    root.style.setProperty('--text-accent', colors.text.accent);
    root.style.setProperty('--border', colors.border);
    root.style.setProperty('--success', colors.success);
    root.style.setProperty('--warning', colors.warning);
    root.style.setProperty('--error', colors.error);
    root.style.setProperty('--shadow', colors.shadow);
    root.style.setProperty('--font-family', font);

    // Apply font family
    body.style.fontFamily = font;

    // Apply dark/light mode classes
    if (darkMode) {
      body.classList.add('dark');
      root.classList.add('dark');
      body.style.backgroundColor = colors.background;
      root.style.backgroundColor = colors.background;
    } else {
      body.classList.add('light');
      root.classList.add('light');
      body.style.backgroundColor = colors.background;
      root.style.backgroundColor = colors.background;
    }

    // Update meta theme color
    const metaThemeColor = document.querySelector("meta[name=theme-color]");
    if (metaThemeColor) {
      metaThemeColor.setAttribute("content", colors.primary);
    }

    // Force reflow to ensure styles are applied
    document.body.style.display = 'none';
    document.body.offsetHeight; // Trigger reflow
    document.body.style.display = '';
  };

  // Initialize from localStorage
  useEffect(() => {
    const savedTheme = localStorage.getItem('theme') as Theme;
    const savedDarkMode = localStorage.getItem('darkMode') === 'true';
    const savedFontFamily = localStorage.getItem('fontFamily');

    const initialTheme = savedTheme && THEMES_CONFIG[savedTheme] ? savedTheme : defaultTheme;
    const initialDarkMode = savedDarkMode || false;
    const initialFontFamily = savedFontFamily || 'system-ui';
    
    const colors = getThemeColors(initialTheme, initialDarkMode);
    
    setThemeState(initialTheme);
    setThemeColors(colors);
    setIsDarkMode(initialDarkMode);
    setFontFamilyState(initialFontFamily);
    
    // Apply initial styles
    setTimeout(() => {
      applyThemeStyles(colors, initialDarkMode, initialFontFamily);
      setIsInitialized(true);
    }, 10);
  }, []);

  // Apply theme when it changes
  useEffect(() => {
    if (!isInitialized) return;

    const colors = getThemeColors(theme, isDarkMode);
    setThemeColors(colors);
    
    localStorage.setItem('theme', theme);
    localStorage.setItem('darkMode', isDarkMode.toString());
    localStorage.setItem('fontFamily', fontFamily);
    
    applyThemeStyles(colors, isDarkMode, fontFamily);
  }, [theme, isDarkMode, fontFamily, isInitialized]);

  const toggleDarkMode = () => {
    console.log('Toggling dark mode from', isDarkMode, 'to', !isDarkMode);
    setIsDarkMode(prev => !prev);
  };

  const setTheme = (newTheme: Theme) => {
    console.log('Setting theme to:', newTheme);
    setThemeState(newTheme);
  };

  const setFontFamily = (font: string) => {
    console.log('Setting font to:', font);
    setFontFamilyState(font);
  };

  const value: ThemeContextType = {
    theme,
    themeColors,
    fontFamily,
    setTheme,
    setFontFamily,
    availableThemes,
    themeCategories,
    availableFonts,
    isInitialized,
    isDarkMode,
    toggleDarkMode
  };

  return <ThemeContext.Provider value={value}>{children}</ThemeContext.Provider>;
};

export const useTheme = () => {
  const context = useContext(ThemeContext);
  if (!context) throw new Error('useTheme must be used within ThemeProvider');
  return context;
};
EOF

# Create components/ui files
cat > components/ui/DarkModeToggle.tsx << 'EOF'
'use client';

import { useTheme } from '@/components/contexts/ThemeContext';
import { useState, useEffect } from 'react';
import { Sun, Moon } from 'lucide-react';

const DarkModeToggle = () => {
  const { isDarkMode, toggleDarkMode } = useTheme();
  const [isMounted, setIsMounted] = useState(false);

  useEffect(() => {
    setIsMounted(true);
  }, []);

  if (!isMounted) {
    return null;
  }

  return (
    <button
      onClick={toggleDarkMode}
      className="floating-theme-btn dark-mode-toggle"
      title={isDarkMode ? "Switch to Light Mode" : "Switch to Dark Mode"}
    >
      {isDarkMode ? <Sun className="h-5 w-5" /> : <Moon className="h-5 w-5" />}
    </button>
  );
};

export default DarkModeToggle;
EOF

cat > components/ui/FontSelector.tsx << 'EOF'
'use client';

import { useTheme } from '@/components/contexts/ThemeContext';
import { useState, useEffect } from 'react';
import { Type } from 'lucide-react';

const IconClose = () => <span>✕</span>;

const FontSelector = () => {
  const { fontFamily, setFontFamily, availableFonts } = useTheme();
  const [isOpen, setIsOpen] = useState(false);
  const [isMounted, setIsMounted] = useState(false);

  useEffect(() => {
    setIsMounted(true);
  }, []);

  if (!isMounted) {
    return null;
  }

  return (
    <>
      {/* Font Selector Button */}
      <button
        onClick={() => setIsOpen(true)}
        className="floating-theme-btn font-selector-btn"
        title="Change Font"
      >
        <Type className="h-5 w-5" />
      </button>

      {/* Font Modal */}
      {isOpen && (
        <div className="theme-modal-overlay" onClick={() => setIsOpen(false)}>
          <div className="theme-modal font-modal" onClick={(e) => e.stopPropagation()}>
            <div className="theme-modal-header">
              <h3>Select Font Family</h3>
              <button onClick={() => setIsOpen(false)} className="close-btn">
                <IconClose />
              </button>
            </div>

            <div className="font-options">
              {availableFonts.map((font) => (
                <button
                  key={font.value}
                  onClick={() => {
                    setFontFamily(font.value);
                    setIsOpen(false);
                  }}
                  className={`font-option ${fontFamily === font.value ? 'active' : ''}`}
                  style={{ fontFamily: font.value }}
                >
                  {font.label}
                  <div className="font-preview" style={{ fontFamily: font.value }}>
                    The quick brown fox jumps over the lazy dog
                  </div>
                </button>
              ))}
            </div>
          </div>
        </div>
      )}
    </>
  );
};

export default FontSelector;
EOF

cat > components/ui/ThemeInfo.tsx << 'EOF'
'use client';

import { useTheme } from '@/components/contexts/ThemeContext';

export default function ThemeInfo() {
  const { theme, isDarkMode, fontFamily } = useTheme();

  return (
    <div className="fixed top-4 left-4 z-50 bg-white/90 dark:bg-gray-800/90 backdrop-blur-sm px-3 py-2 rounded-lg text-sm shadow-lg">
      <div className="flex items-center gap-2">
        <span className="font-medium">Theme:</span>
        <span className="capitalize">{theme.replace('-', ' ')}</span>
        <span className="mx-1">|</span>
        <span className="font-medium">Mode:</span>
        <span>{isDarkMode ? 'Dark' : 'Light'}</span>
        <span className="mx-1">|</span>
        <span className="font-medium">Font:</span>
        <span style={{ fontFamily }}>{fontFamily}</span>
      </div>
    </div>
  );
}
EOF

cat > components/ui/ThemeSettingsButton.tsx << 'EOF'
'use client';

import { useTheme } from '@/components/contexts/ThemeContext';
import { useState, useEffect } from 'react';
import { 
  Palette, 
  Type, 
  Moon, 
  Sun,
  X,
  Settings,
  ChevronRight,
  Check
} from 'lucide-react';

const ThemeSettingsButton = () => {
  const { 
    theme, 
    setTheme, 
    availableThemes, 
    availableFonts, 
    fontFamily, 
    setFontFamily,
    isDarkMode,
    toggleDarkMode
  } = useTheme();
  
  const [isOpen, setIsOpen] = useState(false);
  const [isMounted, setIsMounted] = useState(false);
  const [activeSection, setActiveSection] = useState<'main' | 'themes' | 'fonts'>('main');

  useEffect(() => {
    setIsMounted(true);
  }, []);

  if (!isMounted) {
    return null;
  }

  return (
    <>
      {/* Main Settings Button */}
      <button
        onClick={() => setIsOpen(true)}
        className="floating-theme-btn"
        title="Theme Settings"
        style={{
          background: `linear-gradient(135deg, var(--primary), var(--secondary))`
        }}
      >
        <Settings className="h-5 w-5" />
      </button>

      {/* Side Menu Modal */}
      {isOpen && (
        <>
          {/* Overlay */}
          <div 
            className="theme-modal-overlay" 
            onClick={() => setIsOpen(false)}
          />
          
          {/* Side Menu */}
          <div 
            className="fixed top-0 right-0 h-full w-80 bg-background border-l border-border shadow-2xl z-1002 transform transition-transform duration-300 ease-out"
            style={{ 
              transform: isOpen ? 'translateX(0)' : 'translateX(100%)',
              backgroundColor: 'var(--background)',
              borderColor: 'var(--border)'
            }}
            onClick={(e) => e.stopPropagation()}
          >
            {/* Header */}
            <div className="p-4 border-b border-border flex items-center justify-between">
              <div className="flex items-center gap-3">
                <Settings className="h-5 w-5 text-primary" />
                <h3 className="text-lg font-bold" style={{ color: 'var(--text-primary)' }}>
                  Theme Settings
                </h3>
              </div>
              <button
                onClick={() => setIsOpen(false)}
                className="p-2 rounded-lg hover:bg-surface transition-colors"
                style={{ color: 'var(--text-secondary)' }}
              >
                <X className="h-5 w-5" />
              </button>
            </div>

            {/* Content */}
            <div className="h-[calc(100vh-64px)] overflow-y-auto">
              {/* Main Menu */}
              {activeSection === 'main' && (
                <div className="p-4 space-y-2">
                  {/* Dark/Light Mode Toggle */}
                  <button
                    onClick={toggleDarkMode}
                    className="w-full p-4 rounded-lg flex items-center justify-between hover:bg-surface transition-colors"
                    style={{ 
                      backgroundColor: 'var(--surface)',
                      color: 'var(--text-primary)'
                    }}
                  >
                    <div className="flex items-center gap-3">
                      <div className="p-2 rounded-lg" style={{ backgroundColor: 'var(--primary)', color: 'var(--text-accent)' }}>
                        {isDarkMode ? <Sun className="h-4 w-4" /> : <Moon className="h-4 w-4" />}
                      </div>
                      <div className="text-left">
                        <div className="font-medium">Dark Mode</div>
                        <div className="text-sm" style={{ color: 'var(--text-secondary)' }}>
                          {isDarkMode ? 'Currently on' : 'Currently off'}
                        </div>
                      </div>
                    </div>
                    <div className="flex items-center gap-2">
                      <div 
                        className={`w-10 h-6 rounded-full flex items-center p-1 ${isDarkMode ? 'justify-end bg-primary' : 'justify-start bg-gray-300'}`}
                      >
                        <div className="w-4 h-4 rounded-full bg-white"></div>
                      </div>
                    </div>
                  </button>

                  {/* Themes Option */}
                  <button
                    onClick={() => setActiveSection('themes')}
                    className="w-full p-4 rounded-lg flex items-center justify-between hover:bg-surface transition-colors"
                    style={{ 
                      backgroundColor: 'var(--surface)',
                      color: 'var(--text-primary)'
                    }}
                  >
                    <div className="flex items-center gap-3">
                      <div className="p-2 rounded-lg" style={{ backgroundColor: 'var(--primary)', color: 'var(--text-accent)' }}>
                        <Palette className="h-4 w-4" />
                      </div>
                      <div className="text-left">
                        <div className="font-medium">Themes</div>
                        <div className="text-sm" style={{ color: 'var(--text-secondary)' }}>
                          {availableThemes.find(t => t.value === theme)?.label || 'Select theme'}
                        </div>
                      </div>
                    </div>
                    <ChevronRight className="h-5 w-5" style={{ color: 'var(--text-secondary)' }} />
                  </button>

                  {/* Fonts Option */}
                  <button
                    onClick={() => setActiveSection('fonts')}
                    className="w-full p-4 rounded-lg flex items-center justify-between hover:bg-surface transition-colors"
                    style={{ 
                      backgroundColor: 'var(--surface)',
                      color: 'var(--text-primary)'
                    }}
                  >
                    <div className="flex items-center gap-3">
                      <div className="p-2 rounded-lg" style={{ backgroundColor: 'var(--success)', color: 'var(--text-accent)' }}>
                        <Type className="h-4 w-4" />
                      </div>
                      <div className="text-left">
                        <div className="font-medium">Fonts</div>
                        <div className="text-sm" style={{ color: 'var(--text-secondary)' }}>
                          {availableFonts.find(f => f.value === fontFamily)?.label || 'Select font'}
                        </div>
                      </div>
                    </div>
                    <ChevronRight className="h-5 w-5" style={{ color: 'var(--text-secondary)' }} />
                  </button>
                </div>
              )}

              {/* Themes Section */}
              {activeSection === 'themes' && (
                <div className="p-4">
                  {/* Back Button */}
                  <button
                    onClick={() => setActiveSection('main')}
                    className="mb-4 flex items-center gap-2 text-sm font-medium hover:opacity-80"
                    style={{ color: 'var(--primary)' }}
                  >
                    ← Back to Settings
                  </button>

                  <h4 className="text-lg font-bold mb-4" style={{ color: 'var(--text-primary)' }}>
                    Select Theme
                  </h4>

                  <div className="space-y-3">
                    {availableThemes.map((themeOption) => (
                      <button
                        key={themeOption.value}
                        onClick={() => {
                          setTheme(themeOption.value);
                          setActiveSection('main');
                        }}
                        className={`w-full p-4 rounded-lg flex items-center justify-between transition-all ${
                          theme === themeOption.value 
                            ? 'border-2 border-primary bg-surface' 
                            : 'border border-border hover:border-primary hover:bg-surface'
                        }`}
                        style={{ 
                          backgroundColor: theme === themeOption.value ? 'var(--surface)' : 'var(--background)',
                          borderColor: theme === themeOption.value ? 'var(--primary)' : 'var(--border)'
                        }}
                      >
                        <div className="flex items-center gap-3">
                          <div 
                            className="w-8 h-8 rounded-full border-2 border-white shadow-md"
                            style={{ 
                              background: `linear-gradient(135deg, ${
                                themeOption.value.includes('blue') ? '#2563EB' : 
                                themeOption.value.includes('green') ? '#059669' : 
                                themeOption.value.includes('purple') ? '#7C3AED' : 
                                themeOption.value.includes('gold') ? '#D97706' : 
                                themeOption.value.includes('gray') ? '#4B5563' : '#06B6D4'
                              }, ${
                                themeOption.value.includes('blue') ? '#1E40AF' : 
                                themeOption.value.includes('green') ? '#047857' : 
                                themeOption.value.includes('purple') ? '#6D28D9' : 
                                themeOption.value.includes('gold') ? '#B45309' : 
                                themeOption.value.includes('gray') ? '#374151' : '#0891B2'
                              })` 
                            }}
                          />
                          <div className="text-left">
                            <div className="font-medium" style={{ color: 'var(--text-primary)' }}>
                              {themeOption.label}
                            </div>
                            <div className="text-xs" style={{ color: 'var(--text-secondary)' }}>
                              {themeOption.category === 'professional' ? 'Professional' : 
                               themeOption.category === 'premium' ? 'Premium' : 
                               themeOption.category === 'minimal' ? 'Minimal' : 'Tech'}
                            </div>
                          </div>
                        </div>
                        {theme === themeOption.value && (
                          <Check className="h-5 w-5" style={{ color: 'var(--primary)' }} />
                        )}
                      </button>
                    ))}
                  </div>
                </div>
              )}

              {/* Fonts Section */}
              {activeSection === 'fonts' && (
                <div className="p-4">
                  {/* Back Button */}
                  <button
                    onClick={() => setActiveSection('main')}
                    className="mb-4 flex items-center gap-2 text-sm font-medium hover:opacity-80"
                    style={{ color: 'var(--primary)' }}
                  >
                    ← Back to Settings
                  </button>

                  <h4 className="text-lg font-bold mb-4" style={{ color: 'var(--text-primary)' }}>
                    Select Font Family
                  </h4>

                  <div className="space-y-3">
                    {availableFonts.map((font) => (
                      <button
                        key={font.value}
                        onClick={() => {
                          setFontFamily(font.value);
                          setActiveSection('main');
                        }}
                        className={`w-full p-4 rounded-lg flex items-center justify-between transition-all ${
                          fontFamily === font.value 
                            ? 'border-2 border-primary bg-surface' 
                            : 'border border-border hover:border-primary hover:bg-surface'
                        }`}
                        style={{ 
                          fontFamily: font.value,
                          backgroundColor: fontFamily === font.value ? 'var(--surface)' : 'var(--background)',
                          borderColor: fontFamily === font.value ? 'var(--primary)' : 'var(--border)'
                        }}
                      >
                        <div className="text-left">
                          <div className="font-medium" style={{ color: 'var(--text-primary)' }}>
                            {font.label}
                          </div>
                          <div 
                            className="text-xs mt-1" 
                            style={{ 
                              color: 'var(--text-secondary)',
                              fontFamily: font.value
                            }}
                          >
                            The quick brown fox jumps over the lazy dog
                          </div>
                        </div>
                        {fontFamily === font.value && (
                          <Check className="h-5 w-5" style={{ color: 'var(--primary)' }} />
                        )}
                      </button>
                    ))}
                  </div>
                </div>
              )}
            </div>
          </div>
        </>
      )}
    </>
  );
};

export default ThemeSettingsButton;
EOF

# Create components/index.ts
cat > components/index.ts << 'EOF'
// Layout Components
export { default as Layout } from '../layout/Layout';
export { default as Header } from '../layout/Header';
export { default as Footer } from '../layout/Footer';

// Section Components
export { default as HeroSection } from '../sections/HeroSection';
export { default as StatsSection } from '../sections/StatsSection';
export { default as FeaturesSection } from '../sections/FeaturesSection';
export { default as CategoriesSection } from '../sections/CategoriesSection';
export { default as CTASection } from '../sections/CTASection';

// UI Components
export { default as AdPlaceholder } from '../ui/AdPlaceholder';
// ToolCard removed as it doesn't exist
EOF

# Create constants files
cat > constants/themeConfig.ts << 'EOF'
import { 
  ThemeConfigWithMetadata, 
  FontOption, 
  ThemeOption, 
  Theme, 
  ThemeWithMetadata,
  ThemeColors 
} from '@/types/theme';

// ========== FONT CONFIGURATION ==========
export const FONT_OPTIONS: FontOption[] = [
  { value: 'system-ui', label: 'System Font' },
  { value: 'Inter', label: 'Inter' },
  { value: 'Roboto', label: 'Roboto' },
  { value: 'Open Sans', label: 'Open Sans' },
  { value: 'Montserrat', label: 'Montserrat' },
  { value: 'Poppins', label: 'Poppins' },
  { value: 'Nunito', label: 'Nunito' },
  { value: 'Lato', label: 'Lato' },
  { value: 'Raleway', label: 'Raleway' },
  { value: 'Merriweather', label: 'Merriweather' }
];

// ========== ALL THEMES CONFIG ==========
export const THEMES_CONFIG: ThemeConfigWithMetadata = {
  // Professional Themes
  'professional-blue': {
    name: 'Professional Blue',
    category: 'professional',
    icon: '💼',
    description: 'Corporate blue theme for professional websites',
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
    shadow: '0 4px 12px rgba(37, 99, 235, 0.15)',
    dark: {
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
    }
  },
  'corporate-green': {
    name: 'Corporate Green',
    category: 'professional',
    icon: '🏢',
    description: 'Green theme for corporate websites',
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
    shadow: '0 4px 12px rgba(5, 150, 105, 0.15)',
    dark: {
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
    }
  },
  'premium-purple': {
    name: 'Premium Purple',
    category: 'premium',
    icon: '🎯',
    description: 'Luxury purple theme',
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
    shadow: '0 4px 12px rgba(124, 58, 237, 0.15)',
    dark: {
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
    }
  },
  'luxury-gold': {
    name: 'Luxury Gold',
    category: 'premium',
    icon: '⭐',
    description: 'Premium gold theme for luxury brands',
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
    shadow: '0 4px 12px rgba(217, 119, 6, 0.2)',
    dark: {
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
    }
  },
  'minimal-gray': {
    name: 'Minimal Gray',
    category: 'minimal',
    icon: '⚫',
    description: 'Minimal and clean gray theme',
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
    shadow: '0 2px 8px rgba(0, 0, 0, 0.08)',
    dark: {
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
    }
  },
  'tech-cyan': {
    name: 'Tech Cyan',
    category: 'tech',
    icon: '🔷',
    description: 'Modern tech theme with cyan colors',
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
    shadow: '0 4px 12px rgba(6, 182, 212, 0.2)',
    dark: {
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
  },
  'nature-green': {
    name: 'Nature Green',
    category: 'nature',
    icon: '🌿',
    description: 'Fresh nature inspired theme',
    primary: '#10B981',
    secondary: '#059669',
    background: '#FFFFFF',
    surface: '#F0FDF4',
    text: {
      primary: '#064E3B',
      secondary: '#047857',
      accent: '#FFFFFF'
    },
    border: '#A7F3D0',
    success: '#10B981',
    warning: '#F59E0B',
    error: '#EF4444',
    shadow: '0 4px 12px rgba(16, 185, 129, 0.15)',
    dark: {
      primary: '#10B981',
      secondary: '#34D399',
      background: '#022C22',
      surface: '#064E3B',
      text: {
        primary: '#D1FAE5',
        secondary: '#A7F3D0',
        accent: '#022C22'
      },
      border: '#047857',
      success: '#10B981',
      warning: '#F59E0B',
      error: '#EF4444',
      shadow: '0 4px 12px rgba(16, 185, 129, 0.2)'
    }
  },
  'ocean-blue': {
    name: 'Ocean Blue',
    category: 'nature',
    icon: '🌊',
    description: 'Deep ocean blue theme',
    primary: '#0EA5E9',
    secondary: '#0284C7',
    background: '#F0F9FF',
    surface: '#E0F2FE',
    text: {
      primary: '#0C4A6E',
      secondary: '#0369A1',
      accent: '#FFFFFF'
    },
    border: '#BAE6FD',
    success: '#10B981',
    warning: '#F59E0B',
    error: '#EF4444',
    shadow: '0 4px 12px rgba(14, 165, 233, 0.15)',
    dark: {
      primary: '#0EA5E9',
      secondary: '#0284C7',
      background: '#082F49',
      surface: '#0C4A6E',
      text: {
        primary: '#E0F2FE',
        secondary: '#BAE6FD',
        accent: '#082F49'
      },
      border: '#0369A1',
      success: '#10B981',
      warning: '#F59E0B',
      error: '#EF4444',
      shadow: '0 4px 12px rgba(14, 165, 233, 0.2)'
    }
  },
  'sunset-orange': {
    name: 'Sunset Orange',
    category: 'creative',
    icon: '🌅',
    description: 'Warm sunset colors',
    primary: '#F97316',
    secondary: '#EA580C',
    background: '#FFF7ED',
    surface: '#FFEDD5',
    text: {
      primary: '#7C2D12',
      secondary: '#9A3412',
      accent: '#FFFFFF'
    },
    border: '#FDBA74',
    success: '#10B981',
    warning: '#F59E0B',
    error: '#EF4444',
    shadow: '0 4px 12px rgba(249, 115, 22, 0.15)',
    dark: {
      primary: '#F97316',
      secondary: '#EA580C',
      background: '#431407',
      surface: '#7C2D12',
      text: {
        primary: '#FFEDD5',
        secondary: '#FDBA74',
        accent: '#431407'
      },
      border: '#9A3412',
      success: '#10B981',
      warning: '#F59E0B',
      error: '#EF4444',
      shadow: '0 4px 12px rgba(249, 115, 22, 0.2)'
    }
  },
  'midnight-purple': {
    name: 'Midnight Purple',
    category: 'creative',
    icon: '🌙',
    description: 'Dark purple theme',
    primary: '#8B5CF6',
    secondary: '#7C3AED',
    background: '#1E1B4B',
    surface: '#2E2B57',
    text: {
      primary: '#E0E7FF',
      secondary: '#C7D2FE',
      accent: '#1E1B4B'
    },
    border: '#4F46E5',
    success: '#10B981',
    warning: '#F59E0B',
    error: '#EF4444',
    shadow: '0 4px 12px rgba(139, 92, 246, 0.2)',
    dark: {
      primary: '#8B5CF6',
      secondary: '#7C3AED',
      background: '#0F0F23',
      surface: '#1E1B4B',
      text: {
        primary: '#E0E7FF',
        secondary: '#C7D2FE',
        accent: '#0F0F23'
      },
      border: '#4F46E5',
      success: '#10B981',
      warning: '#F59E0B',
      error: '#EF4444',
      shadow: '0 4px 12px rgba(139, 92, 246, 0.3)'
    }
  },
  'rose-pink': {
    name: 'Rose Pink',
    category: 'creative',
    icon: '🌹',
    description: 'Soft pink theme',
    primary: '#F472B6',
    secondary: '#EC4899',
    background: '#FFF1F2',
    surface: '#FCE7F3',
    text: {
      primary: '#881337',
      secondary: '#9F1239',
      accent: '#FFFFFF'
    },
    border: '#FBCFE8',
    success: '#10B981',
    warning: '#F59E0B',
    error: '#EF4444',
    shadow: '0 4px 12px rgba(244, 114, 182, 0.15)',
    dark: {
      primary: '#F472B6',
      secondary: '#EC4899',
      background: '#4C0519',
      surface: '#831843',
      text: {
        primary: '#FCE7F3',
        secondary: '#FBCFE8',
        accent: '#4C0519'
      },
      border: '#BE185D',
      success: '#10B981',
      warning: '#F59E0B',
      error: '#EF4444',
      shadow: '0 4px 12px rgba(244, 114, 182, 0.2)'
    }
  },
  'vibrant-red': {
    name: 'Vibrant Red',
    category: 'creative',
    icon: '❤️',
    description: 'Bold and energetic red theme',
    primary: '#DC2626',
    secondary: '#B91C1C',
    background: '#FFFFFF',
    surface: '#FEF2F2',
    text: {
      primary: '#1F2937',
      secondary: '#4B5563',
      accent: '#FFFFFF'
    },
    border: '#FCA5A5',
    success: '#10B981',
    warning: '#F59E0B',
    error: '#DC2626',
    shadow: '0 4px 12px rgba(220, 38, 38, 0.15)',
    dark: {
      primary: '#DC2626',
      secondary: '#B91C1C',
      background: '#1C1917',
      surface: '#292524',
      text: {
        primary: '#F9FAFB',
        secondary: '#E5E7EB',
        accent: '#1C1917'
      },
      border: '#7F1D1D',
      success: '#10B981',
      warning: '#F59E0B',
      error: '#EF4444',
      shadow: '0 4px 12px rgba(220, 38, 38, 0.2)'
    }
  },
  'cool-teal': {
    name: 'Cool Teal',
    category: 'tech',
    icon: '💎',
    description: 'Modern teal theme for tech websites',
    primary: '#0D9488',
    secondary: '#0F766E',
    background: '#FFFFFF',
    surface: '#F0FDFA',
    text: {
      primary: '#134E4A',
      secondary: '#0F766E',
      accent: '#FFFFFF'
    },
    border: '#99F6E4',
    success: '#10B981',
    warning: '#F59E0B',
    error: '#DC2626',
    shadow: '0 4px 12px rgba(13, 148, 136, 0.15)',
    dark: {
      primary: '#0D9488',
      secondary: '#0F766E',
      background: '#042F2E',
      surface: '#0D4C48',
      text: {
        primary: '#CCFBF1',
        secondary: '#99F6E4',
        accent: '#042F2E'
      },
      border: '#115E59',
      success: '#10B981',
      warning: '#F59E0B',
      error: '#EF4444',
      shadow: '0 4px 12px rgba(13, 148, 136, 0.2)'
    }
  }
};

// ========== THEME CATEGORIES ==========
export const THEME_CATEGORIES = {
  professional: 'Professional Themes',
  premium: 'Premium Themes',
  minimal: 'Minimal Themes',
  tech: 'Tech Themes',
  nature: 'Nature Themes',
  creative: 'Creative Themes'
};

// ========== UTILITY FUNCTIONS ==========
export const getThemeList = (): ThemeOption[] => {
  return Object.entries(THEMES_CONFIG).map(([key, config]) => ({
    value: key as Theme,
    label: config.name,
    category: config.category,
    icon: config.icon,
    description: config.description
  }));
};

export const getThemeColors = (theme: Theme, isDarkMode: boolean): ThemeWithMetadata => {
  const themeConfig = THEMES_CONFIG[theme];
  if (!themeConfig) return THEMES_CONFIG['professional-blue'];
  
  if (isDarkMode && themeConfig.dark) {
    return {
      ...themeConfig,
      ...themeConfig.dark
    };
  }
  
  return themeConfig;
};

export const getAvailableThemes = (): ThemeOption[] => {
  return getThemeList();
};

export const getThemeCategories = () => {
  const categories = new Set<string>();
  getThemeList().forEach(theme => categories.add(theme.category));
  return Array.from(categories).map(category => ({
    id: category,
    name: THEMES_CATEGORIES[category as keyof typeof THEME_CATEGORIES] || category
  }));
};

// ========== LEGACY SUPPORT ==========
const getLegacyThemes = () => {
  const legacyThemes: Record<string, ThemeColors> = {};
  const legacyDarkThemes: Record<string, Partial<ThemeColors>> = {};
  
  Object.entries(THEMES_CONFIG).forEach(([key, config]) => {
    const { name, category, icon, description, dark, ...lightColors } = config;
    legacyThemes[key] = lightColors;
    
    if (dark) {
      legacyDarkThemes[key] = dark;
    }
  });
  
  return { themes: legacyThemes, darkThemes: legacyDarkThemes };
};

export const { themes, darkThemes } = getLegacyThemes();
EOF

cat > constants/themes.ts << 'EOF'
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
EOF

# Create types file
cat > types/theme.ts << 'EOF'
// Base color types
export interface ThemeColors {
  primary: string;
  secondary: string;
  background: string;
  surface: string;
  text: {
    primary: string;
    secondary: string;
    accent: string;
  };
  border: string;
  success: string;
  warning: string;
  error: string;
  shadow: string;
}

// Theme with metadata for UI display
export interface ThemeWithMetadata extends ThemeColors {
  name: string;
  category: string;
  icon: string;
  description: string;
  dark?: Partial<ThemeColors>;
}

// Theme configuration types
export type Theme = 
  | 'professional-blue'
  | 'corporate-green'
  | 'premium-purple'
  | 'luxury-gold'
  | 'minimal-gray'
  | 'tech-cyan'
  | 'nature-green'
  | 'ocean-blue'
  | 'sunset-orange'
  | 'midnight-purple'
  | 'rose-pink'
  | 'vibrant-red'
  | 'cool-teal';

export type ThemeConfigWithoutMetadata = Record<Theme, ThemeColors>;
export type ThemeConfigWithMetadata = Record<Theme, ThemeWithMetadata>;

// UI option types
export interface ThemeOption {
  value: Theme;
  label: string;
  category: string;
  icon: string;
  description: string;
}

export interface FontOption {
  value: string;
  label: string;
}
EOF

# Create CSS utilities file
mkdir -p components/css
cat > components/css/global-utilities.css << 'EOF'
/* Theme CSS Variables */
:root {
  --primary: #2563EB;
  --secondary: #1E40AF;
  --background: #FFFFFF;
  --surface: #F0F7FF;
  --text-primary: #1E293B;
  --text-secondary: #475569;
  --text-accent: #FFFFFF;
  --border: #CBD5E1;
  --success: #059669;
  --warning: #D97706;
  --error: #DC2626;
  --shadow: 0 4px 12px rgba(37, 99, 235, 0.15);
  --font-family: system-ui;
}

/* Floating Theme Button */
.floating-theme-btn {
  position: fixed;
  bottom: 24px;
  right: 24px;
  width: 56px;
  height: 56px;
  border-radius: 50%;
  background: linear-gradient(135deg, var(--primary), var(--secondary));
  color: var(--text-accent);
  display: flex;
  align-items: center;
  justify-content: center;
  border: none;
  cursor: pointer;
  box-shadow: var(--shadow);
  z-index: 1000;
  transition: all 0.3s ease;
}

.floating-theme-btn:hover {
  transform: scale(1.1);
  box-shadow: 0 6px 20px rgba(0, 0, 0, 0.2);
}

.floating-theme-btn:active {
  transform: scale(0.95);
}

/* Modal Styles */
.theme-modal-overlay {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background: rgba(0, 0, 0, 0.5);
  backdrop-filter: blur(4px);
  display: flex;
  align-items: center;
  justify-content: center;
  z-index: 1001;
}

.theme-modal {
  background: var(--background);
  border-radius: 16px;
  padding: 24px;
  max-width: 90vw;
  width: 400px;
  max-height: 80vh;
  overflow-y: auto;
  border: 1px solid var(--border);
  box-shadow: var(--shadow);
}

.font-modal {
  width: 500px;
}

.theme-modal-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 20px;
}

.theme-modal-header h3 {
  color: var(--text-primary);
  font-size: 1.5rem;
  font-weight: 600;
  margin: 0;
}

.close-btn {
  background: none;
  border: none;
  color: var(--text-secondary);
  cursor: pointer;
  font-size: 1.5rem;
  padding: 4px;
  border-radius: 4px;
  transition: background-color 0.2s;
}

.close-btn:hover {
  background-color: var(--surface);
}

/* Font Options */
.font-options {
  display: flex;
  flex-direction: column;
  gap: 8px;
}

.font-option {
  padding: 16px;
  border: 2px solid var(--border);
  border-radius: 12px;
  background: var(--surface);
  color: var(--text-primary);
  text-align: left;
  cursor: pointer;
  transition: all 0.2s ease;
  font-size: 1rem;
}

.font-option:hover {
  border-color: var(--primary);
  background: var(--background);
  transform: translateY(-2px);
}

.font-option.active {
  border-color: var(--primary);
  background: var(--primary);
  color: var(--text-accent);
}

.font-preview {
  font-size: 0.875rem;
  color: var(--text-secondary);
  margin-top: 8px;
  opacity: 0.8;
}

/* Z-index utilities */
.z-1002 {
  z-index: 1002;
}
EOF

# Create configuration files
cat > next.config.ts << 'EOF'
import type { NextConfig } from "next";

const nextConfig: NextConfig = {
  /* config options here */
};

export default nextConfig;
EOF

cat > tailwind.config.ts << 'EOF'
import type { Config } from 'tailwindcss'

const config: Config = {
  content: [
    './pages/**/*.{js,ts,jsx,tsx,mdx}',
    './components/**/*.{js,ts,jsx,tsx,mdx}',
    './app/**/*.{js,ts,jsx,tsx,mdx}',
  ],
  theme: {
    extend: {
      colors: {
        primary: 'var(--primary)',
        secondary: 'var(--secondary)',
        background: 'var(--background)',
        surface: 'var(--surface)',
        border: 'var(--border)',
        success: 'var(--success)',
        warning: 'var(--warning)',
        error: 'var(--error)',
      },
      textColor: {
        primary: 'var(--text-primary)',
        secondary: 'var(--text-secondary)',
        accent: 'var(--text-accent)',
      },
      boxShadow: {
        DEFAULT: 'var(--shadow)',
      },
    },
  },
  plugins: [],
}
export default config
EOF

cat > postcss.config.mjs << 'EOF'
/** @type {import('postcss').Postcss} */
export default {
  plugins: {
    '@tailwindcss/postcss': {},
  },
}
EOF

cat > tsconfig.json << 'EOF'
{
  "compilerOptions": {
    "target": "ES2017",
    "lib": ["dom", "dom.iterable", "esnext"],
    "allowJs": true,
    "skipLibCheck": true,
    "strict": true,
    "noEmit": true,
    "esModuleInterop": true,
    "module": "esnext",
    "moduleResolution": "bundler",
    "resolveJsonModule": true,
    "isolatedModules": true,
    "jsx": "preserve",
    "incremental": true,
    "plugins": [
      {
        "name": "next"
      }
    ],
    "paths": {
      "@/*": ["./*"]
    }
  },
  "include": ["next-env.d.ts", "**/*.ts", "**/*.tsx", ".next/types/**/*.ts"],
  "exclude": ["node_modules"]
}
EOF

# Create package.json
cat > package.json << 'EOF'
{
  "name": "english.communiteies.pk",
  "version": "0.1.0",
  "private": true,
  "scripts": {
    "dev": "next dev",
    "build": "next build",
    "start": "next start",
    "lint": "eslint"
  },
  "dependencies": {
    "next": "16.0.10",
    "react": "19.2.1",
    "react-dom": "19.2.1",
    "lucide-react": "^0.469.0"
  },
  "devDependencies": {
    "@tailwindcss/postcss": "^4",
    "@types/node": "^20",
    "@types/react": "^19",
    "@types/react-dom": "^19",
    "eslint": "^9",
    "eslint-config-next": "16.0.10",
    "tailwindcss": "^4",
    "typescript": "^5"
  }
}
EOF

# Create README.md
cat > README.md << 'EOF'
# English Communities PK - Hybrid Theme System

A Next.js 16.0.10 application with a complete hybrid theme system featuring dynamic CSS variables, light/dark mode, font selection, and 12+ pre-built themes.

## Features

- ✅ **Hybrid Theme System**: CSS Variables + JavaScript runtime
- ✅ **12+ Pre-built Themes**: Professional, Premium, Minimal, Tech, Nature, Creative categories
- ✅ **Light/Dark Mode**: Toggle with persistence
- ✅ **Font Selection**: 10+ font families
- ✅ **Floating Settings Panel**: Side menu for theme configuration
- ✅ **LocalStorage Persistence**: Saves user preferences
- ✅ **TypeScript**: Fully typed
- ✅ **Tailwind CSS 4**: With CSS variable integration
- ✅ **Responsive Design**: Mobile-first approach

## Project Structure
