'use client';

import { useState } from 'react';
import { clsx } from 'clsx';

interface DeleteConfirmProps {
  title: string;
  message: string;
  onConfirm: () => Promise<void>;
  onCancel: () => void;
}

export function DeleteConfirm({ title, message, onConfirm, onCancel }: DeleteConfirmProps) {
  const [isDeleting, setIsDeleting] = useState(false);

  const handleConfirm = async () => {
    setIsDeleting(true);
    try {
      await onConfirm();
    } finally {
      setIsDeleting(false);
    }
  };

  return (
    <div className="fixed inset-0 z-50 flex items-center justify-center">
      <div className="absolute inset-0 bg-brand-950/80 backdrop-blur-sm" onClick={onCancel} />
      <div className="relative bg-brand-900 border border-brand-700/50 rounded-lg shadow-xl max-w-md w-full mx-4 p-6">
        <h3 className="text-lg font-semibold text-white mb-2">{title}</h3>
        <p className="text-brand-300 text-sm mb-6">{message}</p>
        <div className="flex justify-end gap-3">
          <button
            type="button"
            onClick={onCancel}
            disabled={isDeleting}
            className="px-4 py-2 text-sm font-medium text-brand-300 hover:text-white border border-brand-600/50 hover:border-brand-400/50 rounded-lg transition-colors"
          >
            Cancel
          </button>
          <button
            type="button"
            onClick={handleConfirm}
            disabled={isDeleting}
            className={clsx(
              'px-4 py-2 text-sm font-medium text-white bg-red-600 hover:bg-red-500 rounded-lg transition-colors',
              isDeleting && 'opacity-50 cursor-not-allowed'
            )}
          >
            {isDeleting ? 'Deleting...' : 'Delete'}
          </button>
        </div>
      </div>
    </div>
  );
}

interface DeleteButtonProps {
  itemName: string;
  onDelete: () => Promise<void>;
  className?: string;
}

export function DeleteButton({ itemName, onDelete, className }: DeleteButtonProps) {
  const [showConfirm, setShowConfirm] = useState(false);

  return (
    <>
      <button
        type="button"
        onClick={() => setShowConfirm(true)}
        className={clsx(
          'px-4 py-2 text-sm font-medium text-red-400 hover:text-red-300 border border-red-600/50 hover:border-red-400/50 rounded-lg transition-colors',
          className
        )}
      >
        Delete
      </button>
      {showConfirm && (
        <DeleteConfirm
          title={`Delete ${itemName}?`}
          message="This action cannot be undone. All associated data and translations will be permanently removed."
          onConfirm={onDelete}
          onCancel={() => setShowConfirm(false)}
        />
      )}
    </>
  );
}
