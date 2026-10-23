// Deterministic fallback insights over own records. No provider calls.
export const FALLBACK_KINDS = [
  { id: "document-gap", title: "Consular document gap summary", focus: "Document gaps", action: "Collect missing consular documents and confirm expiry dates before booking cargo." },
  { id: "cargo-consistency", title: "Cargo booking consistency brief", focus: "Cargo consistency", action: "Reconcile airway bill, origin/destination and departure times across bookings." },
  { id: "handoff-readiness", title: "Receiving handoff readiness check", focus: "Handoff readiness", action: "Confirm receiving director, seal reference and receipt for pending handoffs." },
];
export function buildFallbackInsights(kind, rows) {
  const def = FALLBACK_KINDS.find((k) => k.id === kind); if (!def) return null;
  const list = rows || [];
  const open = list.filter((r) => !["Closed", "Completed", "Done"].includes(String(r.status || ""))).length;
  const missingRef = list.filter((r) => !(r.caseNumber || r.reference || r.airwayBill || r.title)).length;
  return { aiGenerated: false, source: "deterministic-fallback", label: "Deterministic fallback — no provider call", kind, title: def.title, recordsConsidered: list.length,
    metrics: [{ label: "Records considered", value: list.length }, { label: "Open records", value: open }, { label: "Records without reference", value: missingRef }, { label: "Has records (false when empty)", value: list.length > 0 }],
    sections: [{ title: "Record coverage", detail: `${list.length} own record(s) read; ${open} open, ${missingRef} without reference (false/0 preserved).` }, { title: def.focus, detail: def.action }, { title: "Next actions", detail: "Validate source evidence with the accountable coordinator before any external step." }],
    actions: [def.action, "Retain this labelled fallback with the case audit history."] };
}
