import { Router, Request, Response } from 'express';

const router = Router();

router.get('/v1/status', (req: Request, res: Response) => {
  res.json({
    timestamp: Date.now(),
    node_version: process.version,
    submodules: ['Mona', 'Cyber10n1', 'Cyber-Stack', 'REDTEAM-ENV', 'Cybersecurity-1']
  });
});

export default router;
