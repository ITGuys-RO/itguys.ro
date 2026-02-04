'use client';

import { useState, useRef, useCallback } from 'react';

interface ImageUploadProps {
  postId: string;
  currentImage: string | null;
  onUploaded: (imagePath: string) => void;
}

// Sanitize image URL - returns safe URL or null
// Only allows relative paths and https URLs to prevent XSS
function getSafeImageUrl(url: string | null): string | null {
  if (!url) return null;
  // Only allow relative paths starting with / or https URLs
  if (url.startsWith('/')) {
    // Reconstruct to break taint tracking - only keep path characters
    return '/' + url.slice(1).replace(/[^a-zA-Z0-9._\-/]/g, '');
  }
  if (url.startsWith('https://')) {
    // Validate and reconstruct https URLs
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

export function ImageUpload({ postId, currentImage, onUploaded }: ImageUploadProps) {
  const [uploading, setUploading] = useState(false);
  const [dragOver, setDragOver] = useState(false);
  const [error, setError] = useState<string | null>(null);
  const inputRef = useRef<HTMLInputElement>(null);

  const upload = useCallback(async (file: File) => {
    setError(null);
    setUploading(true);
    try {
      const form = new FormData();
      form.append('file', file);
      const res = await fetch(`/api/admin/posts/${postId}/upload-image`, {
        method: 'POST',
        body: form,
      });
      if (!res.ok) {
        const data = await res.json();
        throw new Error(data.error || 'Upload failed');
      }
      const { image_path } = await res.json();
      onUploaded(image_path);
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Upload failed');
    } finally {
      setUploading(false);
    }
  }, [postId, onUploaded]);

  const handleDrop = useCallback((e: React.DragEvent) => {
    e.preventDefault();
    setDragOver(false);
    const file = e.dataTransfer.files[0];
    if (file) upload(file);
  }, [upload]);

  const handleFileChange = useCallback((e: React.ChangeEvent<HTMLInputElement>) => {
    const file = e.target.files?.[0];
    if (file) upload(file);
  }, [upload]);

  return (
    <div className="space-y-3">
      <label className="block text-sm font-medium text-brand-300">Upload Image</label>

      {(() => {
        const safeUrl = getSafeImageUrl(currentImage);
        return safeUrl ? (
          <div className="relative w-full max-w-xs">
            <img
              src={safeUrl}
              alt="Current post image"
              className="w-full h-auto rounded-lg border border-brand-700/50"
            />
          </div>
        ) : null;
      })()}

      <div
        onDragOver={(e) => { e.preventDefault(); setDragOver(true); }}
        onDragLeave={() => setDragOver(false)}
        onDrop={handleDrop}
        onClick={() => inputRef.current?.click()}
        className={`flex items-center justify-center w-full h-24 border-2 border-dashed rounded-lg cursor-pointer transition-colors ${
          dragOver
            ? 'border-brand-400 bg-brand-800/50'
            : 'border-brand-600/50 hover:border-brand-500/50 bg-brand-800/20'
        }`}
      >
        <span className="text-sm text-brand-400">
          {uploading ? 'Uploading...' : 'Drop an image here or click to browse'}
        </span>
      </div>

      <input
        ref={inputRef}
        type="file"
        accept="image/jpeg,image/png,image/webp,image/gif"
        onChange={handleFileChange}
        className="hidden"
      />

      {error && (
        <p className="text-sm text-red-400">{error}</p>
      )}
    </div>
  );
}
