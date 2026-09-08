import { StrictMode } from 'react'
import { createRoot } from 'react-dom/client'
import App from './App.tsx' // Ensure this matches your root component filename
import './index.css' // Remove this if you do not have a global stylesheet

createRoot(document.getElementById('root')!).render(
  <StrictMode>
    <App />
  </StrictMode>,
)
