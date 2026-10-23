import { NextRequest, NextResponse } from "next/server";
import { prisma } from "@/lib/prisma";
import { requireUser } from "@/lib/api-auth";
import { buildFallbackInsights, FALLBACK_KINDS } from "@/lib/fallback-ai.mjs";
export const dynamic = "force-dynamic";
export async function GET(_req: NextRequest, ctx: { params: Promise<{ kind: string }> }) {
  const user = await requireUser();
  if (!user) return NextResponse.json({ error: "Unauthorized" }, { status: 401 });
  const { kind } = await ctx.params;
  if (!FALLBACK_KINDS.some((k: { id: string }) => k.id === kind)) return NextResponse.json({ error: "Unknown insight kind" }, { status: 404 });
  const rows = kind === "cargo-consistency" ? await prisma.cargoBooking.findMany({ take: 500, orderBy: { createdAt: "desc" } })
    : kind === "handoff-readiness" ? await prisma.repatriationHandoff.findMany({ take: 500, orderBy: { createdAt: "desc" } })
    : await prisma.consularDocument.findMany({ take: 500, orderBy: { createdAt: "desc" } });
  return NextResponse.json({ result: buildFallbackInsights(kind, rows) });
}
