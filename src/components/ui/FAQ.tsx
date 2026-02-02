type FAQItem = {
  question: string;
  answer: string;
};

type FAQProps = {
  items: FAQItem[];
  title?: string;
};

export function FAQ({ items, title = "Frequently Asked Questions" }: FAQProps) {
  if (items.length === 0) return null;

  return (
    <div className="mt-8">
      <h3 className="text-xl font-bold text-white mb-4">{title}</h3>
      <div className="space-y-3">
        {items.map((item) => (
          <details
            key={item.question}
            className="group border border-brand-700/30 rounded-lg bg-brand-800/20"
          >
            <summary className="flex cursor-pointer items-center justify-between p-4 text-white font-medium">
              <span>{item.question}</span>
              <svg
                className="w-5 h-5 text-brand-400 transition-transform group-open:rotate-180 shrink-0 ml-4"
                fill="none"
                viewBox="0 0 24 24"
                stroke="currentColor"
                strokeWidth={2}
              >
                <path strokeLinecap="round" strokeLinejoin="round" d="M19 9l-7 7-7-7" />
              </svg>
            </summary>
            <div className="px-4 pb-4 text-brand-300 leading-relaxed">
              {item.answer}
            </div>
          </details>
        ))}
      </div>
    </div>
  );
}
