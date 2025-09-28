import { useEffect, useState } from 'react';

export function useMediaQuery(query: string): boolean {
  const [matches, setMatches] = useState(false);

  useEffect(() => {
    const media = window.matchMedia(query);
    
    // Set initial value
    setMatches(media.matches);

    // Define the listener
    const listener = (event: MediaQueryListEvent) => {
      setMatches(event.matches);
    };

    // Add the listener
    if (media.addEventListener) {
      media.addEventListener('change', listener);
    } else {
      // Fallback for older browsers
      media.addListener(listener);
    }

    // Clean up
    return () => {
      if (media.removeEventListener) {
        media.removeEventListener('change', listener);
      } else {
        media.removeListener(listener);
      }
    };
  }, [query]);

  return matches;
}

export function useBreakpoint() {
  const isSm = useMediaQuery('(min-width: 640px)');
  const isMd = useMediaQuery('(min-width: 768px)');
  const isLg = useMediaQuery('(min-width: 1024px)');
  const isXl = useMediaQuery('(min-width: 1280px)');
  const is2Xl = useMediaQuery('(min-width: 1536px)');

  return {
    isSm,
    isMd,
    isLg,
    isXl,
    is2Xl,
    isMobile: !isSm,
    isTablet: isSm && !isLg,
    isDesktop: isLg
  };
}

export function useIsMobile(): boolean {
  return useMediaQuery('(max-width: 767px)');
}

// Responsive grid utilities
export const responsiveGridClasses = {
  // Standard responsive grid for cards
  cards: 'grid gap-4 grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4',
  
  // Two column layout for forms
  form: 'grid gap-4 grid-cols-1 md:grid-cols-2',
  
  // Three column layout for stats
  stats: 'grid gap-4 grid-cols-2 md:grid-cols-3 lg:grid-cols-4',
  
  // Main layout (sidebar + content)
  main: 'grid gap-8 grid-cols-1 lg:grid-cols-3',
  
  // Table responsive breakpoints
  table: {
    hideOnMobile: 'hidden sm:table-cell',
    hideOnTablet: 'hidden lg:table-cell',
    showOnMobile: 'sm:hidden',
  }
};

// Spacing utilities for different screen sizes
export const responsiveSpacing = {
  container: 'px-4 sm:px-6 lg:px-8',
  section: 'py-8 sm:py-12 lg:py-16',
  card: 'p-4 sm:p-6',
  button: 'px-4 py-2 sm:px-6 sm:py-3',
};

// Typography responsive classes
export const responsiveText = {
  heading: 'text-2xl sm:text-3xl lg:text-4xl',
  subheading: 'text-lg sm:text-xl lg:text-2xl', 
  body: 'text-sm sm:text-base',
  caption: 'text-xs sm:text-sm',
};