/** @type {import('tailwindcss').Config} */
export default {
  content: [
    "./index.html",
    "./src/**/*.{js,ts,jsx,tsx}",
  ],
  theme: {
    extend: {
      fontFamily: {
        mono: ['"Fira Code"', 'ui-monospace', 'SFMono-Regular', 'monospace'],
      },
      colors: {
        kellar: {
          cyan: '#06b6d4',
          purple: '#8b5cf6',
          red: '#ef4444',
          dark: '#0f172a'
        }
      }
    },
  },
  plugins: [],
}
