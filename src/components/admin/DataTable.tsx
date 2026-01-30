'use client';

import { useState, useRef, useEffect, useCallback } from 'react';
import Link from 'next/link';
import { clsx } from 'clsx';

interface Column<T> {
  key: string;
  header: string;
  render?: (item: T) => React.ReactNode;
  className?: string;
}

interface ExportColumn<T> {
  key: string;
  header: string;
  value: (item: T) => string | number;
}

function ExportDropdown<T>({
  data,
  exportColumns,
  filename,
}: {
  data: T[];
  exportColumns: ExportColumn<T>[];
  filename: string;
}) {
  const [open, setOpen] = useState(false);
  const ref = useRef<HTMLDivElement>(null);

  useEffect(() => {
    if (!open) return;
    const handler = (e: MouseEvent) => {
      if (ref.current && !ref.current.contains(e.target as Node)) setOpen(false);
    };
    document.addEventListener('mousedown', handler);
    return () => document.removeEventListener('mousedown', handler);
  }, [open]);

  const download = useCallback(
    (type: 'csv' | 'json') => {
      const rows = data.map((item) =>
        Object.fromEntries(exportColumns.map((col) => [col.header, col.value(item)]))
      );

      let blob: Blob;
      let ext: string;
      if (type === 'json') {
        blob = new Blob([JSON.stringify(rows, null, 2)], { type: 'application/json' });
        ext = 'json';
      } else {
        const headers = exportColumns.map((c) => c.header);
        const csvRows = [
          headers.map((h) => `"${h.replace(/"/g, '""')}"`).join(','),
          ...data.map((item) =>
            exportColumns
              .map((col) => {
                const v = col.value(item);
                return typeof v === 'number' ? String(v) : `"${String(v).replace(/"/g, '""')}"`;
              })
              .join(',')
          ),
        ];
        blob = new Blob([csvRows.join('\n')], { type: 'text/csv' });
        ext = 'csv';
      }

      const url = URL.createObjectURL(blob);
      const a = document.createElement('a');
      a.href = url;
      a.download = `${filename}.${ext}`;
      a.click();
      URL.revokeObjectURL(url);
      setOpen(false);
    },
    [data, exportColumns, filename]
  );

  return (
    <div ref={ref} className="relative">
      <button
        onClick={() => setOpen((o) => !o)}
        className="px-3 py-1.5 text-xs font-medium text-brand-300 hover:text-white border border-brand-600/50 hover:border-brand-400/50 rounded transition-colors"
      >
        Export
      </button>
      {open && (
        <div className="absolute right-0 mt-1 w-36 bg-brand-800 border border-brand-600/50 rounded shadow-lg z-10">
          <button
            onClick={() => download('csv')}
            className="block w-full text-left px-3 py-2 text-sm text-brand-300 hover:text-white hover:bg-brand-700/50 transition-colors"
          >
            Export CSV
          </button>
          <button
            onClick={() => download('json')}
            className="block w-full text-left px-3 py-2 text-sm text-brand-300 hover:text-white hover:bg-brand-700/50 transition-colors"
          >
            Export JSON
          </button>
        </div>
      )}
    </div>
  );
}

interface DataTableProps<T> {
  columns: Column<T>[];
  data: T[];
  keyField: keyof T;
  editPath?: (item: T) => string;
  onDelete?: (item: T) => void;
  emptyMessage?: string;
  exportColumns?: ExportColumn<T>[];
  exportFilename?: string;
}

export function DataTable<T>({
  columns,
  data,
  keyField,
  editPath,
  onDelete,
  emptyMessage = 'No items found',
  exportColumns,
  exportFilename = 'export',
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
      {exportColumns && (
        <div className="flex justify-end px-4 py-2 border-b border-brand-700/30">
          <ExportDropdown data={data} exportColumns={exportColumns} filename={exportFilename} />
        </div>
      )}
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
