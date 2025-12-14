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
