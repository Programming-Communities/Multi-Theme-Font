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
// Ensure Theme type has all your themes:
export type Theme = 
  | 'professional-blue'
  | 'corporate-green'
  | 'premium-purple'
  | 'luxury-gold'
  | 'minimal-gray'
  | 'tech-cyan'
  | 'nature-green'      // ✅ Added
  | 'ocean-blue'        // ✅ Added
  | 'sunset-orange'     // ✅ Added
  | 'midnight-purple'   // ✅ Added
  | 'rose-pink'         // ✅ Added
  | 'vibrant-red'       // ✅ Added
  | 'cool-teal';        // ✅ Added

export type ThemeConfigWithoutMetadata = Record<string, ThemeColors>;

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
