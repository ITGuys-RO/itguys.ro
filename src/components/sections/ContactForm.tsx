"use client";

import { useState, useRef } from "react";
import { Turnstile, TurnstileInstance } from "@marsidev/react-turnstile";
import { Button, Input, Textarea, Select } from "@/components/ui";
import { PaperAirplaneIcon } from "@heroicons/react/24/outline";
import { type Locale } from "@/i18n/config";

const projectTypes = {
  en: [
    { value: "web", label: "Web Application" },
    { value: "mobile", label: "Mobile Application" },
    { value: "both", label: "Both Web and Mobile" },
    { value: "security", label: "Security Services" },
    { value: "other", label: "Other" },
  ],
  ro: [
    { value: "web", label: "Aplicație web" },
    { value: "mobile", label: "Aplicație mobilă" },
    { value: "both", label: "Web și mobile" },
    { value: "security", label: "Servicii de securitate" },
    { value: "other", label: "Altele" },
  ],
  fr: [
    { value: "web", label: "Application Web" },
    { value: "mobile", label: "Application Mobile" },
    { value: "both", label: "Web et Mobile" },
    { value: "security", label: "Services de Sécurité" },
    { value: "other", label: "Autre" },
  ],
  de: [
    { value: "web", label: "Web-Anwendung" },
    { value: "mobile", label: "Mobile Anwendung" },
    { value: "both", label: "Web und Mobile" },
    { value: "security", label: "Sicherheitsdienste" },
    { value: "other", label: "Andere" },
  ],
  it: [
    { value: "web", label: "Applicazione Web" },
    { value: "mobile", label: "Applicazione Mobile" },
    { value: "both", label: "Web e Mobile" },
    { value: "security", label: "Servizi di Sicurezza" },
    { value: "other", label: "Altro" },
  ],
  es: [
    { value: "web", label: "Aplicacion Web" },
    { value: "mobile", label: "Aplicacion Movil" },
    { value: "both", label: "Web y Movil" },
    { value: "security", label: "Servicios de Seguridad" },
    { value: "other", label: "Otro" },
  ],
};

const labels = {
  en: {
    name: "Name",
    namePlaceholder: "Your name",
    email: "Email",
    emailPlaceholder: "name@domain.tld",
    company: "Company",
    companyPlaceholder: "Your company (optional)",
    projectType: "Project Type",
    selectPlaceholder: "Select an option",
    description: "Project Description",
    descriptionPlaceholder: "What are you building? What problem does it solve?",
    securityCheck: "Please complete the security check.",
    submitLoading: "Sending...",
    submit: "Send Message",
    successTitle: "Message sent!",
    successMessage: "We'll get back to you within 1-2 business days.",
    sendAnother: "Send another message",
    genericError: "Something went wrong. Please try again or email us directly.",
  },
  ro: {
    name: "Nume",
    namePlaceholder: "Numele tău",
    email: "Email",
    emailPlaceholder: "nume@domeniu.tld",
    company: "Companie",
    companyPlaceholder: "Compania ta (opțional)",
    projectType: "Tip Proiect",
    selectPlaceholder: "Selectează o opțiune",
    description: "Descriere Proiect",
    descriptionPlaceholder: "Ce construiești? Ce problemă vrei să rezolvi?",
    securityCheck: "Te rugăm completează verificarea de securitate.",
    submitLoading: "Se trimite...",
    submit: "Trimite mesaj",
    successTitle: "Mesaj trimis!",
    successMessage: "Te vom contacta în 1-2 zile lucrătoare.",
    sendAnother: "Trimite alt mesaj",
    genericError: "Ceva nu a mers bine. Te rugăm încearcă din nou sau trimite-ne email direct.",
  },
  fr: {
    name: "Nom",
    namePlaceholder: "Votre nom",
    email: "Email",
    emailPlaceholder: "nom@domaine.tld",
    company: "Entreprise",
    companyPlaceholder: "Votre entreprise (optionnel)",
    projectType: "Type de Projet",
    selectPlaceholder: "Sélectionnez une option",
    description: "Description du Projet",
    descriptionPlaceholder: "Que construisez-vous ? Quel problème résout-il ?",
    securityCheck: "Veuillez compléter la vérification de sécurité.",
    submitLoading: "Envoi en cours...",
    submit: "Envoyer le Message",
    successTitle: "Message envoyé !",
    successMessage: "Nous vous répondrons sous 1-2 jours ouvrables.",
    sendAnother: "Envoyer un autre message",
    genericError: "Une erreur s'est produite. Veuillez réessayer ou nous contacter directement par email.",
  },
  de: {
    name: "Name",
    namePlaceholder: "Ihr Name",
    email: "E-Mail",
    emailPlaceholder: "name@domain.tld",
    company: "Unternehmen",
    companyPlaceholder: "Ihr Unternehmen (optional)",
    projectType: "Projekttyp",
    selectPlaceholder: "Option auswählen",
    description: "Projektbeschreibung",
    descriptionPlaceholder: "Was bauen Sie? Welches Problem löst es?",
    securityCheck: "Bitte führen Sie die Sicherheitsprüfung durch.",
    submitLoading: "Wird gesendet...",
    submit: "Nachricht Senden",
    successTitle: "Nachricht gesendet!",
    successMessage: "Wir melden uns innerhalb von 1-2 Werktagen bei Ihnen.",
    sendAnother: "Weitere Nachricht senden",
    genericError: "Etwas ist schiefgelaufen. Bitte versuchen Sie es erneut oder kontaktieren Sie uns direkt per E-Mail.",
  },
  it: {
    name: "Nome",
    namePlaceholder: "Il tuo nome",
    email: "Email",
    emailPlaceholder: "nome@dominio.tld",
    company: "Azienda",
    companyPlaceholder: "La tua azienda (opzionale)",
    projectType: "Tipo di Progetto",
    selectPlaceholder: "Seleziona un'opzione",
    description: "Descrizione del Progetto",
    descriptionPlaceholder: "Cosa stai costruendo? Quale problema risolve?",
    securityCheck: "Per favore completa il controllo di sicurezza.",
    submitLoading: "Invio in corso...",
    submit: "Invia Messaggio",
    successTitle: "Messaggio inviato!",
    successMessage: "Ti risponderemo entro 1-2 giorni lavorativi.",
    sendAnother: "Invia un altro messaggio",
    genericError: "Qualcosa e andato storto. Per favore riprova o contattaci direttamente via email.",
  },
  es: {
    name: "Nombre",
    namePlaceholder: "Tu nombre",
    email: "Email",
    emailPlaceholder: "nombre@dominio.tld",
    company: "Empresa",
    companyPlaceholder: "Tu empresa (opcional)",
    projectType: "Tipo de Proyecto",
    selectPlaceholder: "Selecciona una opción",
    description: "Descripcion del Proyecto",
    descriptionPlaceholder: "Que estas construyendo? Que problema resuelve?",
    securityCheck: "Por favor completa la verificacion de seguridad.",
    submitLoading: "Enviando...",
    submit: "Enviar Mensaje",
    successTitle: "Mensaje enviado!",
    successMessage: "Te responderemos en 1-2 dias habiles.",
    sendAnother: "Enviar otro mensaje",
    genericError: "Algo salio mal. Por favor intenta de nuevo o envianos un email directamente.",
  },
};

type Props = {
  locale?: Locale;
};

export function ContactForm({ locale = "en" }: Props) {
  const [status, setStatus] = useState<"idle" | "loading" | "success" | "error">("idle");
  const [errorMessage, setErrorMessage] = useState("");
  const [turnstileToken, setTurnstileToken] = useState<string | null>(null);
  const turnstileRef = useRef<TurnstileInstance>(null);

  const t = labels[locale];
  const types = projectTypes[locale];

  async function handleSubmit(e: React.FormEvent<HTMLFormElement>) {
    e.preventDefault();
    setStatus("loading");
    setErrorMessage("");

    if (!turnstileToken) {
      setStatus("error");
      setErrorMessage(t.securityCheck);
      return;
    }

    const formData = new FormData(e.currentTarget);
    const data = {
      name: formData.get("name") as string,
      email: formData.get("email") as string,
      company: formData.get("company") as string,
      projectType: formData.get("projectType") as string,
      description: formData.get("description") as string,
      turnstileToken,
    };

    try {
      const response = await fetch("/api/contact", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(data),
      });

      if (!response.ok) {
        const result = await response.json();
        throw new Error(result.error || "Failed to send message");
      }

      setStatus("success");
      setTurnstileToken(null);
      turnstileRef.current?.reset();
      (e.target as HTMLFormElement).reset();
    } catch (err) {
      setStatus("error");
      setErrorMessage(err instanceof Error ? err.message : t.genericError);
      turnstileRef.current?.reset();
      setTurnstileToken(null);
    }
  }

  if (status === "success") {
    return (
      <div className="p-8 rounded-xl bg-green-50 dark:bg-green-900/20 border border-green-200 dark:border-green-800 text-center">
        <h3 className="text-xl font-semibold text-green-800 dark:text-green-200">
          {t.successTitle}
        </h3>
        <p className="mt-2 text-green-700 dark:text-green-300">
          {t.successMessage}
        </p>
        <Button
          variant="secondary"
          className="mt-4"
          onClick={() => setStatus("idle")}
        >
          {t.sendAnother}
        </Button>
      </div>
    );
  }

  return (
    <form onSubmit={handleSubmit} className="space-y-6">
      <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
        <Input
          label={t.name}
          name="name"
          placeholder={t.namePlaceholder}
          required
        />
        <Input
          label={t.email}
          name="email"
          type="email"
          placeholder={t.emailPlaceholder}
          required
        />
      </div>

      <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
        <Input
          label={t.company}
          name="company"
          placeholder={t.companyPlaceholder}
        />
        <Select
          label={t.projectType}
          name="projectType"
          options={types}
          placeholder={t.selectPlaceholder}
        />
      </div>

      <Textarea
        label={t.description}
        name="description"
        placeholder={t.descriptionPlaceholder}
        required
        rows={5}
      />

      <Turnstile
        ref={turnstileRef}
        siteKey={process.env.NEXT_PUBLIC_TURNSTILE_SITE_KEY!}
        onSuccess={setTurnstileToken}
        onError={() => setTurnstileToken(null)}
        onExpire={() => setTurnstileToken(null)}
      />

      {status === "error" && (
        <div className="p-4 rounded-lg bg-red-50 dark:bg-red-900/20 border border-red-200 dark:border-red-800">
          <p className="text-sm text-red-700 dark:text-red-300">{errorMessage}</p>
        </div>
      )}

      <Button
        type="submit"
        variant="primary"
        disabled={status === "loading"}
        className="w-full md:w-auto flex items-center justify-center gap-2"
      >
        {status === "loading" ? t.submitLoading : t.submit}
        <PaperAirplaneIcon className="w-4 h-4" />
      </Button>
    </form>
  );
}
