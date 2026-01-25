'use client';

import Link from 'next/link';
import { clsx } from 'clsx';

interface Column<T> {
  key: string;
  header: string;
  render?: (item: T) => React.ReactNode;
  className?: string;
}

interface DataTableProps<T> {
  columns: Column<T>[];
  data: T[];
  keyField: keyof T;
  editPath?: (item: T) => string;
  onDelete?: (item: T) => void;
  emptyMessage?: string;
}

export function DataTable<T>({
  columns,
  data,
  keyField,
  editPath,
  onDelete,
  emptyMessage = 'No items found',
}: DataTableProps<T>) {
  if (data.length === 0) {
    return (
      <div className="bg-brand-900/60 rounded-lg border border-brand-700/50 p-8 text-center">
        <p className="text-brand-400">{emptyMessage}</p>
      </div>
    );
  }

  return (
    <div className="bg-brand-900/60 rounded-lg border border-brand-700/50 overflow-hidden">
      <div className="overflow-x-auto">
        <table className="w-full">
          <thead>
            <tr className="border-b border-brand-700/50">
              {columns.map((column) => (
                <th
                  key={column.key}
                  className={clsx(
                    'px-4 py-3 text-left text-xs font-medium text-brand-400 uppercase tracking-wider',
                    column.className
                  )}
                >
                  {column.header}
                </th>
              ))}
              {(editPath || onDelete) && (
                <th className="px-4 py-3 text-right text-xs font-medium text-brand-400 uppercase tracking-wider">
                  Actions
                </th>
              )}
            </tr>
          </thead>
          <tbody className="divide-y divide-brand-700/30">
            {data.map((item) => (
              <tr
                key={String(item[keyField])}
                className="hover:bg-brand-800/30 transition-colors"
              >
                {columns.map((column) => (
                  <td
                    key={column.key}
                    className={clsx('px-4 py-3 text-sm text-white', column.className)}
                  >
                    {column.render
                      ? column.render(item)
                      : String((item as Record<string, unknown>)[column.key] ?? '')}
                  </td>
                ))}
                {(editPath || onDelete) && (
                  <td className="px-4 py-3 text-sm text-right">
                    <div className="flex items-center justify-end gap-2">
                      {editPath && (
                        <Link
                          href={editPath(item)}
                          className="px-3 py-1 text-xs font-medium text-brand-300 hover:text-white border border-brand-600/50 hover:border-brand-400/50 rounded transition-colors"
                        >
                          Edit
                        </Link>
                      )}
                      {onDelete && (
                        <button
                          onClick={() => onDelete(item)}
                          className="px-3 py-1 text-xs font-medium text-red-400 hover:text-red-300 border border-red-600/50 hover:border-red-400/50 rounded transition-colors"
                        >
                          Delete
                        </button>
                      )}
                    </div>
                  </td>
                )}
              </tr>
            ))}
          </tbody>
        </table>
      </div>
    </div>
  );
}

interface StatusBadgeProps {
  active: boolean;
}

export function StatusBadge({ active }: StatusBadgeProps) {
  return (
    <span
      className={clsx(
        'inline-flex items-center px-2 py-0.5 rounded text-xs font-medium',
        active
          ? 'bg-green-500/20 text-green-400 border border-green-500/30'
          : 'bg-brand-700/50 text-brand-400 border border-brand-600/50'
      )}
    >
      {active ? 'Active' : 'Inactive'}
    </span>
  );
}
