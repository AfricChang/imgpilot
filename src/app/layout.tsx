import type { Metadata, Viewport } from "next";
import "./globals.css";
import { Analytics } from "@vercel/analytics/react";
import { ReactNode } from "react";

export const metadata: Metadata = {
  title: "ImgPilot ｜ Turn the draft into an amazing artwork",
  description: "Turn the draft into an amazing artwork",
};
const viewport: Viewport = {
  width: "device-width",
  initialScale: 1,
  userScalable: false,
  maximumScale: 1,
  minimumScale: 1,
};

export default function RootLayout({ children }: { children: ReactNode }) {
  return (
    <html lang="en">
      <body className="font-['Inter']">{children}</body>
      <Analytics></Analytics>
    </html>
  );
}

export { viewport };
