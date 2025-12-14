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
