'use client';

import { forwardRef } from 'react';
import DatePicker from 'react-datepicker';
import { clsx } from 'clsx';
import 'react-datepicker/dist/react-datepicker.css';

interface DateTimePickerProps {
  label: string;
  name: string;
  value: string | null;
  onChange: (value: string | null) => void;
  required?: boolean;
  disabled?: boolean;
  className?: string;
  helpText?: string;
  showTime?: boolean;
}

interface CustomInputProps {
  value?: string;
  onClick?: () => void;
  disabled?: boolean;
}

const CustomInput = forwardRef<HTMLButtonElement, CustomInputProps>(
  ({ value, onClick, disabled }, ref) => (
    <button
      type="button"
      onClick={onClick}
      ref={ref}
      disabled={disabled}
      className={clsx(
        'datepicker-input w-full px-4 py-2.5 rounded-lg border backdrop-blur-sm text-left',
        'focus:outline-none focus:ring-2 transition-all duration-200 flex items-center justify-between',
        disabled && 'datepicker-input--disabled'
      )}
    >
      <span className={clsx('datepicker-input__text', !value && 'datepicker-input__text--placeholder')}>
        {value || 'Select date and time...'}
      </span>
      <svg className="datepicker-input__icon w-5 h-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
        <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={1.5} d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z" />
      </svg>
    </button>
  )
);
CustomInput.displayName = 'CustomInput';

export function DateTimePicker({
  label,
  name,
  value,
  onChange,
  required = false,
  disabled = false,
  className,
  helpText,
  showTime = true,
}: DateTimePickerProps) {
  // Convert ISO string to Date object
  const toDate = (isoString: string | null): Date | null => {
    if (!isoString) return null;
    const date = new Date(isoString);
    return isNaN(date.getTime()) ? null : date;
  };

  // Convert Date object back to ISO string
  const fromDate = (date: Date | null): string | null => {
    if (!date) return null;
    return date.toISOString();
  };

  return (
    <div className={clsx('flex flex-col gap-1.5', className)}>
      <label htmlFor={name} className="datepicker-label text-sm font-medium">
        {label}
        {required && <span className="text-neon-pink ml-1">*</span>}
      </label>
      <DatePicker
        selected={toDate(value)}
        onChange={(date: Date | null) => onChange(fromDate(date))}
        showTimeSelect={showTime}
        timeFormat="HH:mm"
        timeIntervals={15}
        dateFormat={showTime ? "MMM d, yyyy 'at' HH:mm" : "MMM d, yyyy"}
        customInput={<CustomInput disabled={disabled} />}
        disabled={disabled}
        calendarClassName="admin-datepicker"
        popperClassName="admin-datepicker-popper"
        wrapperClassName="w-full"
        showPopperArrow={false}
      />
      {helpText && <p className="datepicker-help text-xs">{helpText}</p>}
      <style jsx global>{`
        /* ========== INPUT BUTTON STYLES ========== */

        /* Dark theme (default) */
        .datepicker-label {
          color: #9eb8d6;
        }

        .datepicker-help {
          color: #5174a1;
        }

        .datepicker-input {
          background: rgba(17, 25, 33, 0.6);
          border-color: rgba(35, 53, 73, 0.5);
          color: white;
        }

        .datepicker-input:hover:not(.datepicker-input--disabled) {
          border-color: rgba(46, 69, 99, 0.5);
        }

        .datepicker-input:focus {
          --tw-ring-color: rgba(81, 116, 161, 0.3);
          border-color: rgba(81, 116, 161, 0.5);
        }

        .datepicker-input--disabled {
          opacity: 0.5;
          cursor: not-allowed;
          border-color: rgba(35, 53, 73, 0.3);
        }

        .datepicker-input__text {
          color: white;
        }

        .datepicker-input__text--placeholder {
          color: #5174a1;
        }

        .datepicker-input__icon {
          color: #5174a1;
        }

        /* Light theme */
        html.light .datepicker-label {
          color: #374151;
        }

        html.light .datepicker-help {
          color: #6b7280;
        }

        html.light .datepicker-input {
          background: white;
          border-color: #d1d5db;
          color: #111827;
        }

        html.light .datepicker-input:hover:not(.datepicker-input--disabled) {
          border-color: #9ca3af;
        }

        html.light .datepicker-input:focus {
          --tw-ring-color: rgba(79, 70, 229, 0.3);
          border-color: rgba(79, 70, 229, 0.5);
        }

        html.light .datepicker-input--disabled {
          opacity: 0.5;
          border-color: #e5e7eb;
        }

        html.light .datepicker-input__text {
          color: #111827;
        }

        html.light .datepicker-input__text--placeholder {
          color: #9ca3af;
        }

        html.light .datepicker-input__icon {
          color: #9ca3af;
        }

        /* ========== CALENDAR POPUP STYLES ========== */

        .admin-datepicker-popper {
          z-index: 50 !important;
        }

        /* Dark theme (default) */
        .admin-datepicker {
          background: rgba(15, 23, 42, 0.95) !important;
          backdrop-filter: blur(12px);
          border: 1px solid rgba(51, 65, 85, 0.5) !important;
          border-radius: 0.75rem !important;
          font-family: inherit !important;
          box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.5) !important;
        }

        .admin-datepicker .react-datepicker__header {
          background: transparent !important;
          border-bottom: 1px solid rgba(51, 65, 85, 0.5) !important;
          padding-top: 1rem !important;
        }

        .admin-datepicker .react-datepicker__current-month,
        .admin-datepicker .react-datepicker-time__header {
          color: white !important;
          font-weight: 600 !important;
          font-size: 0.95rem !important;
        }

        .admin-datepicker .react-datepicker__day-names {
          margin-top: 0.5rem !important;
        }

        .admin-datepicker .react-datepicker__day-name {
          color: rgb(148 163 184) !important;
          font-weight: 500 !important;
          font-size: 0.75rem !important;
          width: 2.25rem !important;
          line-height: 2.25rem !important;
          margin: 0.125rem !important;
        }

        .admin-datepicker .react-datepicker__month {
          margin: 0.5rem !important;
        }

        .admin-datepicker .react-datepicker__day {
          color: rgb(226 232 240) !important;
          width: 2.25rem !important;
          line-height: 2.25rem !important;
          margin: 0.125rem !important;
          border-radius: 0.5rem !important;
          transition: all 0.15s ease !important;
        }

        .admin-datepicker .react-datepicker__day:hover {
          background: rgba(51, 65, 85, 0.8) !important;
          color: white !important;
        }

        .admin-datepicker .react-datepicker__day--selected,
        .admin-datepicker .react-datepicker__day--keyboard-selected {
          background: rgb(99 102 241) !important;
          color: white !important;
          font-weight: 600 !important;
        }

        .admin-datepicker .react-datepicker__day--selected:hover,
        .admin-datepicker .react-datepicker__day--keyboard-selected:hover {
          background: rgb(79 70 229) !important;
        }

        .admin-datepicker .react-datepicker__day--today {
          background: rgba(51, 65, 85, 0.5) !important;
          font-weight: 600 !important;
        }

        .admin-datepicker .react-datepicker__day--outside-month {
          color: rgb(100 116 139) !important;
        }

        .admin-datepicker .react-datepicker__day--disabled {
          color: rgb(71 85 105) !important;
          cursor: not-allowed !important;
        }

        .admin-datepicker .react-datepicker__navigation {
          top: 1rem !important;
        }

        .admin-datepicker .react-datepicker__navigation-icon::before {
          border-color: rgb(148 163 184) !important;
          border-width: 2px 2px 0 0 !important;
        }

        .admin-datepicker .react-datepicker__navigation:hover .react-datepicker__navigation-icon::before {
          border-color: white !important;
        }

        .admin-datepicker .react-datepicker__time-container {
          border-left: 1px solid rgba(51, 65, 85, 0.5) !important;
          width: 100px !important;
        }

        .admin-datepicker .react-datepicker__time {
          background: transparent !important;
        }

        .admin-datepicker .react-datepicker__time-box {
          width: 100% !important;
        }

        .admin-datepicker .react-datepicker__time-list {
          height: 200px !important;
        }

        .admin-datepicker .react-datepicker__time-list::-webkit-scrollbar {
          width: 6px;
        }

        .admin-datepicker .react-datepicker__time-list::-webkit-scrollbar-track {
          background: rgb(30 41 59);
          border-radius: 3px;
        }

        .admin-datepicker .react-datepicker__time-list::-webkit-scrollbar-thumb {
          background: rgb(71 85 105);
          border-radius: 3px;
        }

        .admin-datepicker .react-datepicker__time-list::-webkit-scrollbar-thumb:hover {
          background: rgb(100 116 139);
        }

        .admin-datepicker .react-datepicker__time-list-item {
          color: rgb(226 232 240) !important;
          padding: 0.5rem 1rem !important;
          transition: all 0.15s ease !important;
        }

        .admin-datepicker .react-datepicker__time-list-item:hover {
          background: rgba(51, 65, 85, 0.8) !important;
          color: white !important;
        }

        .admin-datepicker .react-datepicker__time-list-item--selected {
          background: rgb(99 102 241) !important;
          color: white !important;
          font-weight: 600 !important;
        }

        .admin-datepicker .react-datepicker__time-list-item--selected:hover {
          background: rgb(79 70 229) !important;
        }

        .admin-datepicker .react-datepicker__triangle {
          display: none !important;
        }

        /* ========== LIGHT THEME CALENDAR ========== */

        html.light .admin-datepicker {
          background: white !important;
          border: 1px solid #e5e7eb !important;
          box-shadow: 0 10px 40px -10px rgba(0, 0, 0, 0.15), 0 4px 6px -2px rgba(0, 0, 0, 0.05) !important;
        }

        html.light .admin-datepicker .react-datepicker__header {
          background: #f9fafb !important;
          border-bottom: 1px solid #e5e7eb !important;
          border-radius: 0.75rem 0.75rem 0 0 !important;
        }

        html.light .admin-datepicker .react-datepicker__current-month,
        html.light .admin-datepicker .react-datepicker-time__header {
          color: #111827 !important;
        }

        html.light .admin-datepicker .react-datepicker__day-name {
          color: #6b7280 !important;
        }

        html.light .admin-datepicker .react-datepicker__day {
          color: #374151 !important;
        }

        html.light .admin-datepicker .react-datepicker__day:hover {
          background: #f3f4f6 !important;
          color: #111827 !important;
        }

        html.light .admin-datepicker .react-datepicker__day--selected,
        html.light .admin-datepicker .react-datepicker__day--keyboard-selected {
          background: rgb(79 70 229) !important;
          color: white !important;
        }

        html.light .admin-datepicker .react-datepicker__day--selected:hover,
        html.light .admin-datepicker .react-datepicker__day--keyboard-selected:hover {
          background: rgb(67 56 202) !important;
        }

        html.light .admin-datepicker .react-datepicker__day--today {
          background: #eef2ff !important;
          color: rgb(79 70 229) !important;
        }

        html.light .admin-datepicker .react-datepicker__day--outside-month {
          color: #9ca3af !important;
        }

        html.light .admin-datepicker .react-datepicker__day--disabled {
          color: #d1d5db !important;
        }

        html.light .admin-datepicker .react-datepicker__navigation-icon::before {
          border-color: #6b7280 !important;
        }

        html.light .admin-datepicker .react-datepicker__navigation:hover .react-datepicker__navigation-icon::before {
          border-color: #111827 !important;
        }

        html.light .admin-datepicker .react-datepicker__time-container {
          border-left: 1px solid #e5e7eb !important;
        }

        html.light .admin-datepicker .react-datepicker__time {
          background: white !important;
        }

        html.light .admin-datepicker .react-datepicker__time-list::-webkit-scrollbar-track {
          background: #f3f4f6;
        }

        html.light .admin-datepicker .react-datepicker__time-list::-webkit-scrollbar-thumb {
          background: #d1d5db;
        }

        html.light .admin-datepicker .react-datepicker__time-list::-webkit-scrollbar-thumb:hover {
          background: #9ca3af;
        }

        html.light .admin-datepicker .react-datepicker__time-list-item {
          color: #374151 !important;
        }

        html.light .admin-datepicker .react-datepicker__time-list-item:hover {
          background: #f3f4f6 !important;
          color: #111827 !important;
        }

        html.light .admin-datepicker .react-datepicker__time-list-item--selected {
          background: rgb(79 70 229) !important;
          color: white !important;
        }

        html.light .admin-datepicker .react-datepicker__time-list-item--selected:hover {
          background: rgb(67 56 202) !important;
        }
      `}</style>
    </div>
  );
}
