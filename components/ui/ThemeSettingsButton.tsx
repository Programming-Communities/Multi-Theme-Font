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
