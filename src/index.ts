import express, { Request, Response } from 'express';

const app = express();
const PORT = process.env.PORT || 3000;

app.use(express.json());

app.get('/health', (req: Request, res: Response) => {
  res.json({ status: 'online', engine: 'Kellar-TS' });
});

app.listen(PORT, () => {
  console.log(`[+] Kellar API Gateway running on port ${PORT}`);
});
