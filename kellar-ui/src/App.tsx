import React, { useState, useEffect } from 'react';
import { KellarAvatar } from './components/KellarAvatar';
import { ThreatAlert } from './types';
import axios from 'axios';

export default function App() {
  const [systemStatus, setSystemStatus] = useState<'idle' | 'analyzing' | 'alert'>('idle');
  const [alerts, setAlerts] = useState<ThreatAlert[]>([]);

  // Polling S3lf-c0n8ci0us / Aquarius for status (mocked interval for structure)
  useEffect(() => {
    const checkStatus = async () => {
      try {
        const response = await axios.get('http://localhost:8000/health');
        if (response.data.status === 'online' && systemStatus === 'idle') {
          // System is nominal
        }
      } catch (err) {
        console.error("Aquarius connection failed", err);
      }
    };
    
    const interval = setInterval(checkStatus, 5000);
    return () => clearInterval(interval);
  }, [systemStatus]);

  return (
    <div className="min-h-screen bg-slate-900 text-white flex flex-col items-center justify-center p-8">
      <header className="mb-12 text-center">
        <h1 className="text-4xl font-bold tracking-widest text-cyan-400">KELLAR OS</h1>
        <p className="text-slate-400 mt-2">S3lf-c0n8ci0us Core Active</p>
      </header>

      <main className="flex w-full max-w-6xl gap-12 items-center">
        <div className="flex-1 flex justify-center">
          <KellarAvatar status={systemStatus} />
        </div>
        
        <div className="flex-1 bg-slate-800 p-6 rounded-xl border border-slate-700 h-96 overflow-y-auto">
          <h2 className="text-xl mb-4 border-b border-slate-600 pb-2">Sandbox Telemetry</h2>
          {alerts.length === 0 ? (
            <p className="text-emerald-400 animate-pulse">Monitoring... No active threats.</p>
          ) : (
            <ul>
              {alerts.map((alert, i) => (
                <li key={i} className="mb-3 text-red-400 text-sm bg-red-900/20 p-3 rounded">
                  <strong>{alert.timestamp}:</strong> {alert.details}
                </li>
              ))}
            </ul>
          )}
        </div>
      </main>
    </div>
  );
}
