import type { Metadata } from "next";
import "./globals.css";
import Providers from "@/components/Providers";

export const metadata: Metadata = {
  title: "International Funeral Repatriation Coordinator",
  description: "Coordinate consular documents, destination requirements, airline cargo bookings, receiving directors and custody handoffs.",
};

export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <html lang="en">
      <body>
<script src="/feature-pack/feature-pack.js" defer />
        <Providers>{children}</Providers>
      </body>
    </html>
  );
}
