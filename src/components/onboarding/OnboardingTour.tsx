import { Badge } from '@/components/ui/badge';
import { Button } from '@/components/ui/button';
import { Card, CardContent } from '@/components/ui/card';
import { Dialog, DialogContent, DialogHeader, DialogTitle } from '@/components/ui/dialog';
import { AnimatePresence, motion } from 'framer-motion';
import {
    AlertTriangle,
    CheckCircle,
    ChevronLeft,
    ChevronRight,
    Coins,
    ExternalLink,
    Shield,
    Trophy,
    Zap
} from 'lucide-react';
import React, { useEffect, useState } from 'react';

interface TourStep {
  id: number;
  title: string;
  content: string;
  icon: React.ReactNode;
  highlight?: string;
  warning?: string;
}

const TOUR_STEPS: TourStep[] = [
  {
    id: 1,
    title: 'Welcome to AutoPrize Vault!',
    content: 'AutoPrize Vault is a revolutionary prize savings system on Massa blockchain. Deposit MAS, earn tickets, and win prizes funded by yield generation!',
    icon: <Trophy className="text-yellow-500" size={32} />,
    highlight: 'Your principal is always safe and withdrawable',
  },
  {
    id: 2,
    title: 'How Deposits Work',
    content: 'When you deposit MAS, you receive shares (tickets) for prize draws. Your original deposit stays safe as principal - you can withdraw it anytime.',
    icon: <Coins className="text-green-500" size={32} />,
    highlight: '1 MAS deposited = 1 ticket + 1 MAS principal',
  },
  {
    id: 3,
    title: 'Prize Mechanism',
    content: 'Yield generated from the vault funds periodic prize draws. The more tickets you have, the higher your chances of winning!',
    icon: <Zap className="text-blue-500" size={32} />,
    highlight: 'Prizes come from yield, not your principal',
  },
  {
    id: 4,
    title: 'Autonomous & Fair',
    content: 'Draws happen automatically using Massa\'s Autonomous Smart Contracts (ASC) with provably fair on-chain randomness. No human intervention needed!',
    icon: <Shield className="text-purple-500" size={32} />,
    highlight: 'Fully decentralized and transparent',
  },
  {
    id: 5,
    title: 'Network & Fees',
    content: 'AutoPrize Vault runs on Massa BuildNet. Transaction fees are minimal (~0.01 MAS). Always verify you\'re on the correct network.',
    icon: <AlertTriangle className="text-orange-500" size={32} />,
    warning: 'Only use BuildNet addresses starting with "AS"',
  },
];

interface OnboardingTourProps {
  isOpen: boolean;
  onClose: () => void;
  onComplete: () => void;
}

export function OnboardingTour({ isOpen, onClose, onComplete }: OnboardingTourProps) {
  const [currentStep, setCurrentStep] = useState(0);
  const [direction, setDirection] = useState(0);

  const step = TOUR_STEPS[currentStep];

  const nextStep = () => {
    if (currentStep < TOUR_STEPS.length - 1) {
      setDirection(1);
      setCurrentStep(currentStep + 1);
    } else {
      handleComplete();
    }
  };

  const prevStep = () => {
    if (currentStep > 0) {
      setDirection(-1);
      setCurrentStep(currentStep - 1);
    }
  };

  const goToStep = (stepIndex: number) => {
    setDirection(stepIndex > currentStep ? 1 : -1);
    setCurrentStep(stepIndex);
  };

  const handleComplete = () => {
    onComplete();
    onClose();
  };

  const handleSkip = () => {
    onClose();
  };

  return (
    <Dialog open={isOpen} onOpenChange={onClose}>
      <DialogContent className="max-w-2xl">
        <DialogHeader>
          <DialogTitle className="flex items-center justify-between">
            <span>Getting Started</span>
            <Button variant="ghost" size="sm" onClick={handleSkip}>
              Skip Tour
            </Button>
          </DialogTitle>
        </DialogHeader>

        <div className="space-y-6">
          {/* Progress indicator */}
          <div className="flex items-center justify-center space-x-2">
            {TOUR_STEPS.map((_, index) => (
              <button
                key={index}
                onClick={() => goToStep(index)}
                className={`h-2 rounded-full transition-all ${
                  index === currentStep
                    ? 'w-8 bg-primary'
                    : index < currentStep
                    ? 'w-2 bg-primary/60'
                    : 'w-2 bg-muted'
                }`}
              />
            ))}
          </div>

          {/* Step content */}
          <div className="min-h-[300px] flex items-center justify-center">
            <AnimatePresence mode="wait" custom={direction}>
              <motion.div
                key={currentStep}
                custom={direction}
                initial={{ opacity: 0, x: direction > 0 ? 300 : -300 }}
                animate={{ opacity: 1, x: 0 }}
                exit={{ opacity: 0, x: direction > 0 ? -300 : 300 }}
                transition={{ duration: 0.3, ease: 'easeInOut' }}
                className="w-full"
              >
                <Card>
                  <CardContent className="p-8 text-center space-y-4">
                    <div className="flex justify-center mb-4">
                      {step.icon}
                    </div>
                    
                    <h2 className="text-2xl font-bold">{step.title}</h2>
                    
                    <p className="text-muted-foreground text-lg leading-relaxed">
                      {step.content}
                    </p>

                    {step.highlight && (
                      <Badge variant="secondary" className="bg-green-100 text-green-800 px-4 py-2">
                        <CheckCircle size={16} className="mr-2" />
                        {step.highlight}
                      </Badge>
                    )}

                    {step.warning && (
                      <Badge variant="destructive" className="bg-orange-100 text-orange-800 px-4 py-2">
                        <AlertTriangle size={16} className="mr-2" />
                        {step.warning}
                      </Badge>
                    )}
                  </CardContent>
                </Card>
              </motion.div>
            </AnimatePresence>
          </div>

          {/* Navigation */}
          <div className="flex items-center justify-between">
            <Button
              variant="outline"
              onClick={prevStep}
              disabled={currentStep === 0}
              className="flex items-center gap-2"
            >
              <ChevronLeft size={16} />
              Previous
            </Button>

            <div className="text-sm text-muted-foreground">
              {currentStep + 1} of {TOUR_STEPS.length}
            </div>

            <Button
              onClick={nextStep}
              className="flex items-center gap-2"
            >
              {currentStep === TOUR_STEPS.length - 1 ? (
                <>
                  Get Started
                  <CheckCircle size={16} />
                </>
              ) : (
                <>
                  Next
                  <ChevronRight size={16} />
                </>
              )}
            </Button>
          </div>

          {/* Additional resources */}
          {currentStep === TOUR_STEPS.length - 1 && (
            <div className="border-t pt-4">
              <p className="text-sm text-muted-foreground mb-3 text-center">
                Need more information?
              </p>
              <div className="flex justify-center space-x-4">
                <Button
                  variant="ghost"
                  size="sm"
                  onClick={() => window.open('https://docs.massa.net', '_blank')}
                  className="flex items-center gap-1"
                >
                  <ExternalLink size={14} />
                  Massa Docs
                </Button>
                <Button
                  variant="ghost"
                  size="sm"
                  onClick={() => window.open('/how-it-works', '_blank')}
                  className="flex items-center gap-1"
                >
                  <ExternalLink size={14} />
                  How It Works
                </Button>
              </div>
            </div>
          )}
        </div>
      </DialogContent>
    </Dialog>
  );
}

// Hook to manage tour state
export function useOnboardingTour() {
  const [showTour, setShowTour] = useState(false);
  const [hasSeenTour, setHasSeenTour] = useState(false);

  useEffect(() => {
    const tourCompleted = localStorage.getItem('autoprize-tour-completed');
    const hasSeenIt = tourCompleted === 'true';
    setHasSeenTour(hasSeenIt);
    
    // Show tour if not completed and user has wallet connected
    if (!hasSeenIt) {
      // Delay to let the wallet connect
      const timer = setTimeout(() => {
        setShowTour(true);
      }, 2000);
      return () => clearTimeout(timer);
    }
  }, []);

  const completeTour = () => {
    localStorage.setItem('autoprize-tour-completed', 'true');
    setHasSeenTour(true);
    setShowTour(false);
  };

  const startTour = () => {
    setShowTour(true);
  };

  return {
    showTour,
    hasSeenTour,
    setShowTour,
    completeTour,
    startTour,
  };
}