import { FC } from 'react';
import { motion } from 'framer-motion';

interface KellarAvatarProps {
  status: 'idle' | 'analyzing' | 'alert';
}

export const KellarAvatar: FC<KellarAvatarProps> = ({ status }) => {
  const animations = {
    idle: { scale: 1, opacity: 0.8, filter: "drop-shadow(0px 0px 10px #06b6d4)" },
    analyzing: { scale: [1, 1.05, 1], opacity: 1, filter: "drop-shadow(0px 0px 20px #8b5cf6)", transition: { repeat: Infinity, duration: 1.5 } },
    alert: { scale: 1.1, opacity: 1, filter: "drop-shadow(0px 0px 30px #ef4444)" }
  };

  return (
    <motion.div 
      animate={animations[status]}
      className="relative w-64 h-64 rounded-full overflow-hidden border-4 border-slate-700 bg-slate-800 flex items-center justify-center"
    >
      <img 
        src="/image_4.png" 
        alt="Kellar AI Avatar" 
        className="w-full h-full object-cover mix-blend-screen"
      />
      {status === 'analyzing' && (
        <div className="absolute inset-0 bg-purple-500/20 mix-blend-overlay"></div>
      )}
    </motion.div>
  );
};
