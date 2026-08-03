"use client";

import { useEffect, useState } from "react";

/**
 * Returns whether the current viewport matches the given media query.
 *
 * The initial value is `undefined` because the media query can only
 * be evaluated safely after the component mounts in the browser.
 */
export const useMediaQuery = (query: string): boolean | undefined => {
  // `undefined` means the media query has not been evaluated yet.
  const [matches, setMatches] = useState<boolean | undefined>(undefined);

  useEffect(() => {
    // Create a MediaQueryList for the provided CSS media query.
    const mediaQuery = window.matchMedia(query);

    // Update React state whenever the media query matches/unmatches.
    const handleChange = () => {
      setMatches(mediaQuery.matches);
    };

    // Get the initial value immediately after mounting.
    handleChange();

    // Listen for viewport changes so the value stays up to date.
    mediaQuery.addEventListener("change", handleChange);

    // Remove the listener when the component unmounts or query changes.
    return () => {
      mediaQuery.removeEventListener("change", handleChange);
    };
  }, [query]);

  return matches;
};
