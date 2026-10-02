# International Funeral Repatriation Coordinator

Coordinate consular documents, destination requirements, airline cargo bookings, receiving directors and custody handoffs.

## Implemented records

- **Repatriation Case**: name, case Number, family Reference, origin, destination, coordinator, opened At, status.
- **Deceased Record**: name, identity Reference, date Of Death, place Of Death, nationality, status.
- **Consular Document**: title, document Type, issued At, expires At, authority, source Reference, status.
- **Destination Requirement**: title, jurisdiction, version, effective At, requirement Text, source Url, status.
- **Funeral Provider**: name, country, director, contact, license Reference, status.
- **Preparation Record**: title, prepared At, preparer, method, certificate Reference, notes, status.
- **Cargo Booking**: title, airline, airway Bill, origin, destination, departure At, arrival At, status.
- **Repatriation Handoff**: title, handed At, sender, receiver, location, seal Reference, receipt, status.
- **Case Expense**: title, supplier, category, amount Cents, currency, incurred At, receipt, status.
- **Operational Task**: title, owner, priority, start At, due At, done, notes, status.
- **Rule Version**: title, jurisdiction, version, effective At, expires At, source Url, requirement Text, status.
- **Document Requirement**: title, category, required By, source Reference, evidence Reference, review Notes, status.

## AI workflows

- Consular document extraction: source-linked draft, saved history, three real AI input suggestion styles and three complete fictional examples.
- Destination packet gap analysis: source-linked draft, saved history, three real AI input suggestion styles and three complete fictional examples.
- Document translation draft: source-linked draft, saved history, three real AI input suggestion styles and three complete fictional examples.
- Cargo booking consistency review: source-linked draft, saved history, three real AI input suggestion styles and three complete fictional examples.
- Receiving director handoff draft: source-linked draft, saved history, three real AI input suggestion styles and three complete fictional examples.
- Family coordination update: source-linked draft, saved history, three real AI input suggestion styles and three complete fictional examples.
- Evidence completeness review: source-linked draft, saved history, three real AI input suggestion styles and three complete fictional examples.
- Operations handoff draft: source-linked draft, saved history, three real AI input suggestion styles and three complete fictional examples.

## Calculations

- Repatriation transport connection check: Validate supplied cargo itinerary and arrival buffer; consular and destination requirements must be reviewed separately.
- Repatriation Case evidence checklist: Check source presence against an explicitly supplied document list; reviewer assesses adequacy.
- Operational deadline queue: Compute overdue items from entered dates and completed flags; no external notifications.

## Workspace features

Role-based login and account management; validated create/edit/delete; required parent and sibling relationships; search and pagination; atomic JSON imports; CSV/JSON exports; optimistic concurrency; two independent human reviews; immutable source-text uploads with independent review; dated task calendar; aggregate reports; searchable audit trail; model catalog and administrator AI settings; configured HTTPS connectors with approval, idempotency and receipt checks.

## Integration boundaries

A finite working scope, not every conceivable feature. No production regulator, insurer, carrier, court, university or clinical integration is preconfigured. Source uploads support text/CSV/JSON/Markdown, not OCR/PDF parsing. AI produces drafts and cannot authorize clinical handling, adjudicate rights, select recipients or jurors, establish eligibility, certify regulatory compliance or send submissions. Live external execution requires a configured adapter and independent human approval of the current record. Calculations use supplied rules and units; example rules are fictional.
