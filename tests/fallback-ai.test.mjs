import test from "node:test";
import assert from "node:assert/strict";
import fs from "node:fs";
import { buildFallbackInsights, FALLBACK_KINDS } from "../src/lib/fallback-ai.mjs";
test("fallback kinds are 2-3 and labelled aiGenerated:false", () => {
  assert.ok(FALLBACK_KINDS.length >= 2 && FALLBACK_KINDS.length <= 3);
  for (const k of FALLBACK_KINDS) { const r = buildFallbackInsights(k.id, [{ status: "Open", caseNumber: "C-1" }]); assert.equal(r.aiGenerated, false); assert.equal(r.recordsConsidered, 1); assert.ok(r.sections.length >= 2); }
});
test("empty records preserve 0/false", () => { const r = buildFallbackInsights("document-gap", []); assert.equal(r.recordsConsidered, 0); assert.equal(r.metrics.find(m => m.label.includes("Has records")).value, false); assert.equal(buildFallbackInsights("nope", []), null); });
test("route is authenticated and tasks/search/export already exist", () => {
  assert.ok(fs.readFileSync("src/app/api/ai-fallback/[kind]/route.ts", "utf8").includes("requireUser"));
  assert.ok(fs.existsSync("src/app/api/tasks/route.ts")); assert.ok(fs.existsSync("src/app/api/export/[entity]/route.ts"));
});
