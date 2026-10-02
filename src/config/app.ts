export interface PageConfig {
  label: string;
  href: string;
  description: string;
  entities: string[];
  workflows: string[];
}

export interface EntityConfig {
  name: string;
  label: string;
  fields: Array<{ name: string; kind: "string" | "number" | "boolean" | "date" }>;
}

export interface WorkflowConfig {
  slug: string;
  title: string;
  description: string;
  prompt: string;
  fields: string[];
}

export const appConfig = {
  "slug": "ai-international-funeral-repatriation-coordinator",
  "title": "International Funeral Repatriation Coordinator",
  "tagline": "Coordinate consular documents, destination requirements, airline cargo bookings, receiving directors and custody handoffs.",
  "accent": "rose"
};
export const pages: PageConfig[] = [
  {
    "label": "Intake & registers",
    "href": "/registers",
    "description": "Coordinate consular documents, destination requirements, airline cargo bookings, receiving directors and custody handoffs.",
    "entities": [
      "RepatriationCase",
      "DeceasedRecord",
      "ConsularDocument"
    ],
    "workflows": [
      "consular-document-extraction",
      "destination-packet-gap-analysis"
    ]
  },
  {
    "label": "Operational records",
    "href": "/workflow",
    "description": "Coordinate consular documents, destination requirements, airline cargo bookings, receiving directors and custody handoffs.",
    "entities": [
      "DestinationRequirement",
      "FuneralProvider",
      "PreparationRecord"
    ],
    "workflows": [
      "document-translation-draft",
      "cargo-booking-consistency-review"
    ]
  },
  {
    "label": "Review & delivery",
    "href": "/delivery",
    "description": "Coordinate consular documents, destination requirements, airline cargo bookings, receiving directors and custody handoffs.",
    "entities": [
      "CargoBooking",
      "RepatriationHandoff",
      "CaseExpense"
    ],
    "workflows": [
      "receiving-director-handoff-draft",
      "family-coordination-update"
    ]
  },
  {
    "label": "Tasks & requirements",
    "href": "/operations",
    "description": "Assignments, versioned rules and document requirements.",
    "entities": [
      "OperationalTask",
      "RuleVersion",
      "DocumentRequirement"
    ],
    "workflows": [
      "evidence-completeness-review",
      "operations-handoff-draft"
    ]
  }
];
export const entities: Record<string, EntityConfig> = {
  "RepatriationCase": {
    "name": "RepatriationCase",
    "label": "Repatriation Case",
    "fields": [
      {
        "name": "name",
        "kind": "string"
      },
      {
        "name": "caseNumber",
        "kind": "string"
      },
      {
        "name": "familyReference",
        "kind": "string"
      },
      {
        "name": "origin",
        "kind": "string"
      },
      {
        "name": "destination",
        "kind": "string"
      },
      {
        "name": "coordinator",
        "kind": "string"
      },
      {
        "name": "openedAt",
        "kind": "date"
      },
      {
        "name": "status",
        "kind": "string"
      }
    ]
  },
  "DeceasedRecord": {
    "name": "DeceasedRecord",
    "label": "Deceased Record",
    "fields": [
      {
        "name": "name",
        "kind": "string"
      },
      {
        "name": "identityReference",
        "kind": "string"
      },
      {
        "name": "dateOfDeath",
        "kind": "date"
      },
      {
        "name": "placeOfDeath",
        "kind": "string"
      },
      {
        "name": "nationality",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "repatriationCaseId",
        "kind": "string"
      }
    ]
  },
  "ConsularDocument": {
    "name": "ConsularDocument",
    "label": "Consular Document",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "documentType",
        "kind": "string"
      },
      {
        "name": "issuedAt",
        "kind": "date"
      },
      {
        "name": "expiresAt",
        "kind": "date"
      },
      {
        "name": "authority",
        "kind": "string"
      },
      {
        "name": "sourceReference",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "repatriationCaseId",
        "kind": "string"
      }
    ]
  },
  "DestinationRequirement": {
    "name": "DestinationRequirement",
    "label": "Destination Requirement",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "jurisdiction",
        "kind": "string"
      },
      {
        "name": "version",
        "kind": "string"
      },
      {
        "name": "effectiveAt",
        "kind": "date"
      },
      {
        "name": "requirementText",
        "kind": "string"
      },
      {
        "name": "sourceUrl",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "repatriationCaseId",
        "kind": "string"
      }
    ]
  },
  "FuneralProvider": {
    "name": "FuneralProvider",
    "label": "Funeral Provider",
    "fields": [
      {
        "name": "name",
        "kind": "string"
      },
      {
        "name": "country",
        "kind": "string"
      },
      {
        "name": "director",
        "kind": "string"
      },
      {
        "name": "contact",
        "kind": "string"
      },
      {
        "name": "licenseReference",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "repatriationCaseId",
        "kind": "string"
      }
    ]
  },
  "PreparationRecord": {
    "name": "PreparationRecord",
    "label": "Preparation Record",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "preparedAt",
        "kind": "date"
      },
      {
        "name": "preparer",
        "kind": "string"
      },
      {
        "name": "method",
        "kind": "string"
      },
      {
        "name": "certificateReference",
        "kind": "string"
      },
      {
        "name": "notes",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "repatriationCaseId",
        "kind": "string"
      }
    ]
  },
  "CargoBooking": {
    "name": "CargoBooking",
    "label": "Cargo Booking",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "airline",
        "kind": "string"
      },
      {
        "name": "airwayBill",
        "kind": "string"
      },
      {
        "name": "origin",
        "kind": "string"
      },
      {
        "name": "destination",
        "kind": "string"
      },
      {
        "name": "departureAt",
        "kind": "date"
      },
      {
        "name": "arrivalAt",
        "kind": "date"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "repatriationCaseId",
        "kind": "string"
      }
    ]
  },
  "RepatriationHandoff": {
    "name": "RepatriationHandoff",
    "label": "Repatriation Handoff",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "handedAt",
        "kind": "date"
      },
      {
        "name": "sender",
        "kind": "string"
      },
      {
        "name": "receiver",
        "kind": "string"
      },
      {
        "name": "location",
        "kind": "string"
      },
      {
        "name": "sealReference",
        "kind": "string"
      },
      {
        "name": "receipt",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "repatriationCaseId",
        "kind": "string"
      }
    ]
  },
  "CaseExpense": {
    "name": "CaseExpense",
    "label": "Case Expense",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "supplier",
        "kind": "string"
      },
      {
        "name": "category",
        "kind": "string"
      },
      {
        "name": "amountCents",
        "kind": "number"
      },
      {
        "name": "currency",
        "kind": "string"
      },
      {
        "name": "incurredAt",
        "kind": "date"
      },
      {
        "name": "receipt",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "repatriationCaseId",
        "kind": "string"
      }
    ]
  },
  "OperationalTask": {
    "name": "OperationalTask",
    "label": "Operational Task",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "owner",
        "kind": "string"
      },
      {
        "name": "priority",
        "kind": "string"
      },
      {
        "name": "startAt",
        "kind": "date"
      },
      {
        "name": "dueAt",
        "kind": "date"
      },
      {
        "name": "done",
        "kind": "boolean"
      },
      {
        "name": "notes",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "repatriationCaseId",
        "kind": "string"
      }
    ]
  },
  "RuleVersion": {
    "name": "RuleVersion",
    "label": "Rule Version",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "jurisdiction",
        "kind": "string"
      },
      {
        "name": "version",
        "kind": "string"
      },
      {
        "name": "effectiveAt",
        "kind": "date"
      },
      {
        "name": "expiresAt",
        "kind": "date"
      },
      {
        "name": "sourceUrl",
        "kind": "string"
      },
      {
        "name": "requirementText",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "repatriationCaseId",
        "kind": "string"
      }
    ]
  },
  "DocumentRequirement": {
    "name": "DocumentRequirement",
    "label": "Document Requirement",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "category",
        "kind": "string"
      },
      {
        "name": "requiredBy",
        "kind": "date"
      },
      {
        "name": "sourceReference",
        "kind": "string"
      },
      {
        "name": "evidenceReference",
        "kind": "string"
      },
      {
        "name": "reviewNotes",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "repatriationCaseId",
        "kind": "string"
      }
    ]
  }
};
export const workflows: WorkflowConfig[] = [
  {
    "slug": "consular-document-extraction",
    "title": "Consular document extraction",
    "description": "Consular document extraction using selected repatriation case records and supplied evidence.",
    "prompt": "Consular document extraction for International Funeral Repatriation Coordinator. Operational scope: Coordinate consular documents, destination requirements, airline cargo bookings, receiving directors and custody handoffs. Specific AI scope: Translate/extract document requirements and flag packet inconsistencies for professional review. Produce an editable, source-linked draft for the responsible professional. Distinguish observations, missing evidence and proposed next actions. Do not invent facts, decide legal eligibility, authorize clinical release, profile individuals, submit externally or invent calibrated probabilities. Use supplied rule versions only. For translation preserve identifiers, dates, names and numbers and mark uncertain terms.",
    "fields": [
      "objective",
      "sourceContext",
      "applicableRules",
      "knownDiscrepancies",
      "constraints",
      "requestedOutput",
      "optionalReviewerNotes",
      "optionalAdditionalEvidence"
    ]
  },
  {
    "slug": "destination-packet-gap-analysis",
    "title": "Destination packet gap analysis",
    "description": "Destination packet gap analysis using selected repatriation case records and supplied evidence.",
    "prompt": "Destination packet gap analysis for International Funeral Repatriation Coordinator. Operational scope: Coordinate consular documents, destination requirements, airline cargo bookings, receiving directors and custody handoffs. Specific AI scope: Translate/extract document requirements and flag packet inconsistencies for professional review. Produce an editable, source-linked draft for the responsible professional. Distinguish observations, missing evidence and proposed next actions. Do not invent facts, decide legal eligibility, authorize clinical release, profile individuals, submit externally or invent calibrated probabilities. Use supplied rule versions only. For translation preserve identifiers, dates, names and numbers and mark uncertain terms.",
    "fields": [
      "objective",
      "sourceContext",
      "applicableRules",
      "knownDiscrepancies",
      "constraints",
      "requestedOutput",
      "optionalReviewerNotes",
      "optionalAdditionalEvidence"
    ]
  },
  {
    "slug": "document-translation-draft",
    "title": "Document translation draft",
    "description": "Document translation draft using selected repatriation case records and supplied evidence.",
    "prompt": "Document translation draft for International Funeral Repatriation Coordinator. Operational scope: Coordinate consular documents, destination requirements, airline cargo bookings, receiving directors and custody handoffs. Specific AI scope: Translate/extract document requirements and flag packet inconsistencies for professional review. Produce an editable, source-linked draft for the responsible professional. Distinguish observations, missing evidence and proposed next actions. Do not invent facts, decide legal eligibility, authorize clinical release, profile individuals, submit externally or invent calibrated probabilities. Use supplied rule versions only. For translation preserve identifiers, dates, names and numbers and mark uncertain terms.",
    "fields": [
      "objective",
      "sourceContext",
      "applicableRules",
      "knownDiscrepancies",
      "constraints",
      "requestedOutput",
      "optionalReviewerNotes",
      "optionalAdditionalEvidence"
    ]
  },
  {
    "slug": "cargo-booking-consistency-review",
    "title": "Cargo booking consistency review",
    "description": "Cargo booking consistency review using selected repatriation case records and supplied evidence.",
    "prompt": "Cargo booking consistency review for International Funeral Repatriation Coordinator. Operational scope: Coordinate consular documents, destination requirements, airline cargo bookings, receiving directors and custody handoffs. Specific AI scope: Translate/extract document requirements and flag packet inconsistencies for professional review. Produce an editable, source-linked draft for the responsible professional. Distinguish observations, missing evidence and proposed next actions. Do not invent facts, decide legal eligibility, authorize clinical release, profile individuals, submit externally or invent calibrated probabilities. Use supplied rule versions only. For translation preserve identifiers, dates, names and numbers and mark uncertain terms.",
    "fields": [
      "objective",
      "sourceContext",
      "applicableRules",
      "knownDiscrepancies",
      "constraints",
      "requestedOutput",
      "optionalReviewerNotes",
      "optionalAdditionalEvidence"
    ]
  },
  {
    "slug": "receiving-director-handoff-draft",
    "title": "Receiving director handoff draft",
    "description": "Receiving director handoff draft using selected repatriation case records and supplied evidence.",
    "prompt": "Receiving director handoff draft for International Funeral Repatriation Coordinator. Operational scope: Coordinate consular documents, destination requirements, airline cargo bookings, receiving directors and custody handoffs. Specific AI scope: Translate/extract document requirements and flag packet inconsistencies for professional review. Produce an editable, source-linked draft for the responsible professional. Distinguish observations, missing evidence and proposed next actions. Do not invent facts, decide legal eligibility, authorize clinical release, profile individuals, submit externally or invent calibrated probabilities. Use supplied rule versions only. For translation preserve identifiers, dates, names and numbers and mark uncertain terms.",
    "fields": [
      "objective",
      "sourceContext",
      "applicableRules",
      "knownDiscrepancies",
      "constraints",
      "requestedOutput",
      "optionalReviewerNotes",
      "optionalAdditionalEvidence"
    ]
  },
  {
    "slug": "family-coordination-update",
    "title": "Family coordination update",
    "description": "Family coordination update using selected repatriation case records and supplied evidence.",
    "prompt": "Family coordination update for International Funeral Repatriation Coordinator. Operational scope: Coordinate consular documents, destination requirements, airline cargo bookings, receiving directors and custody handoffs. Specific AI scope: Translate/extract document requirements and flag packet inconsistencies for professional review. Produce an editable, source-linked draft for the responsible professional. Distinguish observations, missing evidence and proposed next actions. Do not invent facts, decide legal eligibility, authorize clinical release, profile individuals, submit externally or invent calibrated probabilities. Use supplied rule versions only. For translation preserve identifiers, dates, names and numbers and mark uncertain terms.",
    "fields": [
      "objective",
      "sourceContext",
      "applicableRules",
      "knownDiscrepancies",
      "constraints",
      "requestedOutput",
      "optionalReviewerNotes",
      "optionalAdditionalEvidence"
    ]
  },
  {
    "slug": "evidence-completeness-review",
    "title": "Evidence completeness review",
    "description": "Evidence completeness review using selected repatriation case records and supplied evidence.",
    "prompt": "Evidence completeness review for International Funeral Repatriation Coordinator. Operational scope: Coordinate consular documents, destination requirements, airline cargo bookings, receiving directors and custody handoffs. Specific AI scope: Translate/extract document requirements and flag packet inconsistencies for professional review. Produce an editable, source-linked draft for the responsible professional. Distinguish observations, missing evidence and proposed next actions. Do not invent facts, decide legal eligibility, authorize clinical release, profile individuals, submit externally or invent calibrated probabilities. Use supplied rule versions only. For translation preserve identifiers, dates, names and numbers and mark uncertain terms.",
    "fields": [
      "objective",
      "sourceContext",
      "applicableRules",
      "knownDiscrepancies",
      "constraints",
      "requestedOutput",
      "optionalReviewerNotes",
      "optionalAdditionalEvidence"
    ]
  },
  {
    "slug": "operations-handoff-draft",
    "title": "Operations handoff draft",
    "description": "Operations handoff draft using selected repatriation case records and supplied evidence.",
    "prompt": "Operations handoff draft for International Funeral Repatriation Coordinator. Operational scope: Coordinate consular documents, destination requirements, airline cargo bookings, receiving directors and custody handoffs. Specific AI scope: Translate/extract document requirements and flag packet inconsistencies for professional review. Produce an editable, source-linked draft for the responsible professional. Distinguish observations, missing evidence and proposed next actions. Do not invent facts, decide legal eligibility, authorize clinical release, profile individuals, submit externally or invent calibrated probabilities. Use supplied rule versions only. For translation preserve identifiers, dates, names and numbers and mark uncertain terms.",
    "fields": [
      "objective",
      "sourceContext",
      "applicableRules",
      "knownDiscrepancies",
      "constraints",
      "requestedOutput",
      "optionalReviewerNotes",
      "optionalAdditionalEvidence"
    ]
  }
];
export function findPage(href:string){return pages.find(p=>p.href===href);}
