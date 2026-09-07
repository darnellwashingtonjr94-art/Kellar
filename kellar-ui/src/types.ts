export interface ThreatAlert {
  id: string;
  timestamp: string;
  severity: 'low' | 'medium' | 'high' | 'critical';
  source: 'sandbox' | 's3lf-c0n8ci0us';
  details: string;
  llm_mitigation_advice?: string;
}

export interface SystemHealth {
  status: string;
  subsystems: {
    aquarius: boolean;
    fast_brain: boolean;
    sandbox: boolean;
  };
}
