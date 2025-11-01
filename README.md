# NomadHub

A modern Next.js application built with TypeScript, Tailwind CSS, and shadcn/ui.

## Tech Stack

- **Framework:** Next.js 15 (App Router)
- **Language:** TypeScript
- **Styling:** Tailwind CSS
- **UI Components:** shadcn/ui
- **Code Quality:** ESLint + Prettier

## Getting Started

### Prerequisites

- Node.js 20.x or higher
- npm 10.x or higher

### Installation

1. Install dependencies:

```bash
npm install
```

2. Copy environment variables:

```bash
cp .env.local.example .env.local
```

3. Run the development server:

```bash
npm run dev
```

Open [http://localhost:3000](http://localhost:3000) with your browser to see the result.

## Available Scripts

- `npm run dev` - Start development server
- `npm run build` - Build for production
- `npm start` - Start production server
- `npm run lint` - Run ESLint
- `npm run format` - Format code with Prettier
- `npm run format:check` - Check code formatting

## Project Structure

```
src/
├── app/              # App Router pages and layouts
├── components/       # React components
│   ├── ui/          # shadcn/ui components
│   ├── features/    # Feature-specific components
│   └── layouts/     # Layout components
├── lib/             # Utility functions and helpers
├── hooks/           # Custom React hooks
├── types/           # TypeScript type definitions
└── styles/          # Global styles
```

## Adding shadcn/ui Components

To add new shadcn/ui components:

```bash
npx shadcn@latest add [component-name]
```

Example:

```bash
npx shadcn@latest add button
npx shadcn@latest add card
```

## Learn More

- [Next.js Documentation](https://nextjs.org/docs)
- [Tailwind CSS Documentation](https://tailwindcss.com/docs)
- [shadcn/ui Documentation](https://ui.shadcn.com)
- [TypeScript Documentation](https://www.typescriptlang.org/docs)
