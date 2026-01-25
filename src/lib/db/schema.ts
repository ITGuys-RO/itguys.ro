import type { Locale } from '@/i18n/config';

// Base types for database rows
export interface TeamMember {
  id: number;
  slug: string;
  email: string | null;
  gravatar_email: string | null;
  linkedin_url: string | null;
  image_path: string | null;
  sort_order: number;
  is_active: number;
  created_at: string;
  updated_at: string;
}

export interface TeamMemberTranslation {
  id: number;
  team_member_id: number;
  locale: string;
  name: string;
  role: string;
  bio: string;
}

export interface Project {
  id: number;
  slug: string;
  image_path: string | null;
  external_url: string | null;
  sort_order: number;
  is_active: number;
  created_at: string;
  updated_at: string;
}

export interface ProjectTranslation {
  id: number;
  project_id: number;
  locale: string;
  name: string;
  client_type: string | null;
  industry: string | null;
  challenge: string | null;
  solution: string | null;
  result: string | null;
}

export interface ProjectTechnology {
  id: number;
  project_id: number;
  technology: string;
  sort_order: number;
}

export interface Company {
  id: number;
  slug: string;
  logo_path: string | null;
  external_url: string | null;
  sort_order: number;
  is_active: number;
  created_at: string;
  updated_at: string;
}

export interface CompanyTranslation {
  id: number;
  company_id: number;
  locale: string;
  name: string;
  description: string | null;
}

export interface Service {
  id: number;
  slug: string;
  icon: string | null;
  category: string;
  sort_order: number;
  is_active: number;
  created_at: string;
  updated_at: string;
}

export interface ServiceTranslation {
  id: number;
  service_id: number;
  locale: string;
  title: string;
  description: string | null;
  details: string | null;
  note: string | null;
}

export interface ServiceTechnology {
  id: number;
  service_id: number;
  technology: string;
  sort_order: number;
}

export interface Subservice {
  id: number;
  service_id: number;
  slug: string;
  sort_order: number;
}

export interface SubserviceTranslation {
  id: number;
  subservice_id: number;
  locale: string;
  title: string;
  description: string | null;
}

export interface FaqItem {
  id: number;
  slug: string;
  category: string | null;
  sort_order: number;
  is_active: number;
  created_at: string;
  updated_at: string;
}

export interface FaqTranslation {
  id: number;
  faq_id: number;
  locale: string;
  question: string;
  answer: string;
}

export interface Post {
  id: number;
  slug: string;
  image_path: string | null;
  author_id: number | null;
  published_at: string | null;
  is_published: number;
  created_at: string;
  updated_at: string;
}

export interface PostTranslation {
  id: number;
  post_id: number;
  locale: string;
  title: string;
  excerpt: string | null;
  content: string;
  meta_title: string | null;
  meta_description: string | null;
}

export interface PostTag {
  id: number;
  post_id: number;
  tag: string;
}

export interface Translation {
  id: number;
  key: string;
  namespace: string;
  locale: string;
  value: string;
  updated_at: string;
}

export interface Setting {
  id: number;
  key: string;
  value: string;
  locale: string | null;
}

// Composite types for API responses
export interface TeamMemberWithTranslations extends TeamMember {
  translations: Record<Locale, TeamMemberTranslation | undefined>;
}

export interface TeamMemberLocalized {
  id: number;
  slug: string;
  email: string | null;
  gravatarEmail: string | null;
  linkedIn: string | null;
  imagePath: string | null;
  name: string;
  role: string;
  bio: string;
}

export interface ProjectWithTranslations extends Project {
  translations: Record<Locale, ProjectTranslation | undefined>;
  technologies: string[];
}

export interface ProjectLocalized {
  id: number;
  slug: string;
  name: string;
  clientType: string | null;
  industry: string | null;
  challenge: string | null;
  solution: string | null;
  result: string | null;
  tech: string[];
  image: string | null;
  url: string | null;
}

export interface CompanyWithTranslations extends Company {
  translations: Record<Locale, CompanyTranslation | undefined>;
}

export interface CompanyLocalized {
  id: number;
  slug: string;
  name: string;
  description: string | null;
  logo: string | null;
  url: string | null;
}

export interface SubserviceLocalized {
  title: string;
  description: string | null;
}

export interface ServiceWithTranslations extends Service {
  translations: Record<Locale, ServiceTranslation | undefined>;
  technologies: string[];
  subservices: Array<Subservice & { translations: Record<Locale, SubserviceTranslation | undefined> }>;
}

export interface ServiceLocalized {
  id: string;
  slug: string;
  title: string;
  description: string | null;
  details: string | null;
  note: string | null;
  technologies: string[];
  subservices: SubserviceLocalized[];
}

export interface FaqWithTranslations extends FaqItem {
  translations: Record<Locale, FaqTranslation | undefined>;
}

export interface FaqLocalized {
  id: number;
  slug: string;
  category: string | null;
  question: string;
  answer: string;
}

export interface PostWithTranslations extends Post {
  translations: Record<Locale, PostTranslation | undefined>;
  tags: string[];
  author?: TeamMemberLocalized;
}

export interface PostLocalized {
  id: number;
  slug: string;
  title: string;
  excerpt: string | null;
  content: string;
  imagePath: string | null;
  publishedAt: string | null;
  metaTitle: string | null;
  metaDescription: string | null;
  tags: string[];
  author?: TeamMemberLocalized;
}

// Input types for creating/updating
export interface TeamMemberInput {
  slug: string;
  email?: string | null;
  gravatar_email?: string | null;
  linkedin_url?: string | null;
  image_path?: string | null;
  sort_order?: number;
  is_active?: number;
  translations: Partial<Record<Locale, {
    name: string;
    role: string;
    bio: string;
  }>>;
}

export interface ProjectInput {
  slug: string;
  image_path?: string | null;
  external_url?: string | null;
  sort_order?: number;
  is_active?: number;
  technologies: string[];
  translations: Partial<Record<Locale, {
    name: string;
    client_type?: string | null;
    industry?: string | null;
    challenge?: string | null;
    solution?: string | null;
    result?: string | null;
  }>>;
}

export interface CompanyInput {
  slug: string;
  logo_path?: string | null;
  external_url?: string | null;
  sort_order?: number;
  is_active?: number;
  translations: Partial<Record<Locale, {
    name: string;
    description?: string | null;
  }>>;
}

export interface SubserviceInput {
  slug: string;
  sort_order?: number;
  translations: Partial<Record<Locale, {
    title: string;
    description?: string | null;
  }>>;
}

export interface ServiceInput {
  slug: string;
  icon?: string | null;
  category: string;
  sort_order?: number;
  is_active?: number;
  technologies: string[];
  subservices: SubserviceInput[];
  translations: Partial<Record<Locale, {
    title: string;
    description?: string | null;
    details?: string | null;
    note?: string | null;
  }>>;
}

export interface FaqInput {
  slug: string;
  category?: string | null;
  sort_order?: number;
  is_active?: number;
  translations: Partial<Record<Locale, {
    question: string;
    answer: string;
  }>>;
}

export interface PostInput {
  slug: string;
  image_path?: string | null;
  author_id?: number | null;
  published_at?: string | null;
  is_published?: number;
  tags: string[];
  translations: Partial<Record<Locale, {
    title: string;
    excerpt?: string | null;
    content: string;
    meta_title?: string | null;
    meta_description?: string | null;
  }>>;
}

export interface TranslationInput {
  key: string;
  namespace: string;
  locale: Locale;
  value: string;
}
