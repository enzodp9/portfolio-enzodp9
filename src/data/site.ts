export type Lang = 'es' | 'en';

export const site = {
  name: 'Enzo David Prediger Hamnn',
  mark: 'EP',
  location: 'Concepción del Uruguay, Entre Ríos, Argentina',
  tagline: {
    es: 'Ingeniero en Sistemas de Información.',
    en: 'Information Systems Engineer.',
  },
  description: {
    es: 'Enzo Prediger, ingeniero en Sistemas que lleva software e IA a contextos industriales y mineros. Low-code con Power Platform, full-stack e IA aplicada. Desarrollo y mantengo en producción MIGA Software, un SaaS propio.',
    en: 'Enzo Prediger, a Systems Engineer bringing software and AI to industrial and mining contexts. Low-code with Power Platform, full-stack, and applied AI. I build and maintain MIGA Software, my own SaaS product, in production.',
  },
};

export const links = {
  email: 'enzodprediger@gmail.com',
  linkedin: 'https://www.linkedin.com/in/enzo-prediger',
  github: 'https://github.com/enzodp9',
  cv: '#', // TODO(Enzo): linkear el PDF del CV cuando esté subido
};

export const nav = {
  es: [
    { label: 'Formación', href: '#formacion' },
    { label: 'Experiencia', href: '#experiencia' },
    { label: 'Proyectos', href: '#proyectos' },
    { label: 'Sobre mí', href: '#sobre-mi' },
  ],
  en: [
    { label: 'Education', href: '#formacion' },
    { label: 'Experience', href: '#experiencia' },
    { label: 'Projects', href: '#proyectos' },
    { label: 'About', href: '#sobre-mi' },
  ],
};
