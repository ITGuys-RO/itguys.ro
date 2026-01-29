import { clsx, type ClassValue } from "clsx";

export function cn(...inputs: ClassValue[]) {
  return clsx(inputs);
}

// Combined team experience base year (Catalin ~2010 + Cristian ~2015 = effective start 2000 for 25+ combined by 2025)
const COMBINED_EXPERIENCE_BASE_YEAR = 2000;

export function getCombinedYears(): number {
  return new Date().getFullYear() - COMBINED_EXPERIENCE_BASE_YEAR;
}

export function getCombinedYearsText(): string {
  return `${getCombinedYears()}+`;
}

export function generateSlug(title: string): string {
  return title
    .toLowerCase()
    .normalize('NFD')
    .replace(/[\u0300-\u036f]/g, '') // Remove diacritics
    .replace(/[^a-z0-9\s-]/g, '') // Remove special characters
    .trim()
    .replace(/\s+/g, '-') // Replace spaces with hyphens
    .replace(/-+/g, '-'); // Remove consecutive hyphens
}
