'use client';

import { useState, useEffect } from 'react';

// Sanitize image URL - returns safe URL or null
function getSafeImageUrl(url: string): string | null {
  if (url.startsWith('/')) {
    return '/' + url.slice(1).replace(/[^a-zA-Z0-9._\-/]/g, '');
  }
  if (url.startsWith('https://')) {
    try {
      const parsed = new URL(url);
      if (parsed.protocol === 'https:') {
        return parsed.href;
      }
    } catch {
      return null;
    }
  }
  return null;
}

interface ImageCandidate {
  id: number;
  image_url: string;
  source_url: string | null;
  page_title: string | null;
  is_selected: number;
}

interface ImageCandidatesGalleryProps {
  postId: string;
  currentImage: string | null;
  onSelected: (imagePath: string) => void;
}

export function ImageCandidatesGallery({ postId, currentImage, onSelected }: ImageCandidatesGalleryProps) {
  const [candidates, setCandidates] = useState<ImageCandidate[]>([]);
  const [loading, setLoading] = useState(true);
  const [selecting, setSelecting] = useState<number | null>(null);

  useEffect(() => {
    fetch(`/api/admin/posts/${postId}/image-candidates`)
      .then(res => res.ok ? res.json() : [])
      .then(setCandidates)
      .catch(() => setCandidates([]))
      .finally(() => setLoading(false));
  }, [postId]);

  if (loading) return null;
  if (candidates.length === 0) return null;

  const handleSelect = async (candidate: ImageCandidate) => {
    setSelecting(candidate.id);
    try {
      const res = await fetch(`/api/admin/posts/${postId}/image-candidates`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ candidateId: candidate.id }),
      });
      if (res.ok) {
        const { image_path } = await res.json();
        onSelected(image_path);
        setCandidates(prev => prev.map(c => ({
          ...c,
          is_selected: c.id === candidate.id ? 1 : 0,
        })));
      }
    } finally {
      setSelecting(null);
    }
  };

  return (
    <div className="space-y-3">
      <label className="block text-sm font-medium text-brand-300">
        Image Candidates ({candidates.length})
      </label>
      <div className="grid grid-cols-2 sm:grid-cols-3 gap-3">
        {candidates.map((c) => {
          const safeUrl = getSafeImageUrl(c.image_url);
          if (!safeUrl) return null;
          const isActive = c.is_selected === 1 || c.image_url === currentImage;
          return (
            <button
              key={c.id}
              type="button"
              onClick={() => handleSelect(c)}
              disabled={selecting !== null}
              className={`relative group rounded-lg overflow-hidden border-2 transition-colors ${
                isActive
                  ? 'border-green-500'
                  : 'border-brand-700/50 hover:border-brand-500/50'
              }`}
            >
              <img
                src={safeUrl}
                alt={c.page_title || 'Candidate image'}
                className="w-full h-24 object-cover"
              />
              {isActive && (
                <span className="absolute top-1 right-1 px-1.5 py-0.5 text-[10px] font-medium bg-green-500 text-white rounded">
                  Selected
                </span>
              )}
              {selecting === c.id && (
                <div className="absolute inset-0 flex items-center justify-center bg-black/50">
                  <span className="text-xs text-white">Selecting...</span>
                </div>
              )}
              {c.page_title && (
                <div className="absolute bottom-0 left-0 right-0 px-1.5 py-1 bg-black/70 text-[10px] text-brand-300 truncate opacity-0 group-hover:opacity-100 transition-opacity">
                  {c.page_title}
                </div>
              )}
            </button>
          );
        })}
      </div>
    </div>
  );
}
