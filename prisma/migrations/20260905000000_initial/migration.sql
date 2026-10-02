-- CreateEnum
CREATE TYPE "Role" AS ENUM ('ADMIN', 'MANAGER', 'ANALYST');

-- CreateTable
CREATE TABLE "User" (
    "active" BOOLEAN NOT NULL DEFAULT true,
    "id" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "passwordHash" TEXT NOT NULL,
    "role" "Role" NOT NULL DEFAULT 'ANALYST',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "AuditLog" (
    "id" TEXT NOT NULL,
    "actorId" TEXT,
    "actorName" TEXT,
    "action" TEXT NOT NULL,
    "entity" TEXT NOT NULL,
    "entityId" TEXT,
    "detail" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "AuditLog_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "WorkflowAnalysis" (
    "id" TEXT NOT NULL,
    "actorId" TEXT NOT NULL,
    "workflow" TEXT NOT NULL,
    "subjectEntity" TEXT NOT NULL,
    "subjectId" TEXT NOT NULL,
    "input" JSONB NOT NULL,
    "evidence" JSONB NOT NULL,
    "evidenceHash" TEXT NOT NULL,
    "result" JSONB NOT NULL,
    "model" TEXT NOT NULL,
    "receipt" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "WorkflowAnalysis_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RecordReview" (
    "id" TEXT NOT NULL,
    "actorId" TEXT NOT NULL,
    "entity" TEXT NOT NULL,
    "entityId" TEXT NOT NULL,
    "version" TEXT NOT NULL,
    "reason" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "RecordReview_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "UsageBucket" (
    "id" TEXT NOT NULL,
    "calls" INTEGER NOT NULL,

    CONSTRAINT "UsageBucket_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "IssuedCredential" (
    "token" TEXT NOT NULL,
    "entity" TEXT NOT NULL,
    "entityId" TEXT NOT NULL,
    "version" TEXT NOT NULL,
    "assertion" JSONB NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "revokedAt" TIMESTAMP(3),

    CONSTRAINT "IssuedCredential_pkey" PRIMARY KEY ("token")
);

-- CreateTable
CREATE TABLE "DomainArtifact" (
    "id" TEXT NOT NULL,
    "subjectEntity" TEXT NOT NULL,
    "subjectId" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "content" TEXT NOT NULL,
    "contentHash" TEXT NOT NULL,
    "actorId" TEXT NOT NULL,
    "approvedBy" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "DomainArtifact_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RecordApproval" (
    "id" TEXT NOT NULL,
    "version" TEXT NOT NULL,

    CONSTRAINT "RecordApproval_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "DomainExecution" (
    "id" TEXT NOT NULL,
    "actorId" TEXT NOT NULL,
    "connectorId" TEXT NOT NULL,
    "action" TEXT NOT NULL,
    "subjectEntity" TEXT NOT NULL,
    "subjectId" TEXT NOT NULL,
    "version" TEXT NOT NULL,
    "status" TEXT NOT NULL,
    "result" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "DomainExecution_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "WorkSession" (
    "id" TEXT NOT NULL,
    "actorId" TEXT NOT NULL,
    "respondentId" TEXT NOT NULL,
    "subjectEntity" TEXT NOT NULL,
    "subjectId" TEXT NOT NULL,
    "questions" JSONB NOT NULL,
    "answers" JSONB NOT NULL,
    "currentQuestion" TEXT,
    "status" TEXT NOT NULL,
    "deadline" TIMESTAMP(3) NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "WorkSession_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SessionMedia" (
    "id" TEXT NOT NULL,
    "sessionId" TEXT NOT NULL,
    "questionId" TEXT NOT NULL,
    "actorId" TEXT NOT NULL,
    "contentType" TEXT NOT NULL,
    "bytes" BYTEA NOT NULL,
    "contentHash" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "SessionMedia_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "AppSetting" (
    "id" TEXT NOT NULL,
    "value" JSONB NOT NULL,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "AppSetting_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RepatriationCase" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "caseNumber" TEXT NOT NULL,
    "familyReference" TEXT NOT NULL,
    "origin" TEXT NOT NULL,
    "destination" TEXT NOT NULL,
    "coordinator" TEXT NOT NULL,
    "openedAt" TIMESTAMP(3) NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "RepatriationCase_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "DeceasedRecord" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "identityReference" TEXT NOT NULL,
    "dateOfDeath" TIMESTAMP(3) NOT NULL,
    "placeOfDeath" TEXT NOT NULL,
    "nationality" TEXT NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "repatriationCaseId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "DeceasedRecord_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ConsularDocument" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "documentType" TEXT NOT NULL,
    "issuedAt" TIMESTAMP(3) NOT NULL,
    "expiresAt" TIMESTAMP(3),
    "authority" TEXT NOT NULL,
    "sourceReference" TEXT NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "repatriationCaseId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "ConsularDocument_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "DestinationRequirement" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "jurisdiction" TEXT NOT NULL,
    "version" TEXT NOT NULL,
    "effectiveAt" TIMESTAMP(3) NOT NULL,
    "requirementText" TEXT NOT NULL,
    "sourceUrl" TEXT NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "repatriationCaseId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "DestinationRequirement_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "FuneralProvider" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "country" TEXT NOT NULL,
    "director" TEXT NOT NULL,
    "contact" TEXT NOT NULL,
    "licenseReference" TEXT NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "repatriationCaseId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "FuneralProvider_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PreparationRecord" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "preparedAt" TIMESTAMP(3) NOT NULL,
    "preparer" TEXT NOT NULL,
    "method" TEXT NOT NULL,
    "certificateReference" TEXT NOT NULL,
    "notes" TEXT NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "repatriationCaseId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "PreparationRecord_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CargoBooking" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "airline" TEXT NOT NULL,
    "airwayBill" TEXT NOT NULL,
    "origin" TEXT NOT NULL,
    "destination" TEXT NOT NULL,
    "departureAt" TIMESTAMP(3) NOT NULL,
    "arrivalAt" TIMESTAMP(3) NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "repatriationCaseId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "CargoBooking_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RepatriationHandoff" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "handedAt" TIMESTAMP(3) NOT NULL,
    "sender" TEXT NOT NULL,
    "receiver" TEXT NOT NULL,
    "location" TEXT NOT NULL,
    "sealReference" TEXT NOT NULL,
    "receipt" TEXT NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "repatriationCaseId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "RepatriationHandoff_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CaseExpense" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "supplier" TEXT NOT NULL,
    "category" TEXT NOT NULL,
    "amountCents" INTEGER NOT NULL,
    "currency" TEXT NOT NULL,
    "incurredAt" TIMESTAMP(3) NOT NULL,
    "receipt" TEXT,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "repatriationCaseId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "CaseExpense_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "OperationalTask" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "owner" TEXT NOT NULL,
    "priority" TEXT NOT NULL,
    "startAt" TIMESTAMP(3) NOT NULL,
    "dueAt" TIMESTAMP(3) NOT NULL,
    "done" BOOLEAN NOT NULL,
    "notes" TEXT,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "repatriationCaseId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "OperationalTask_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RuleVersion" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "jurisdiction" TEXT NOT NULL,
    "version" TEXT NOT NULL,
    "effectiveAt" TIMESTAMP(3) NOT NULL,
    "expiresAt" TIMESTAMP(3),
    "sourceUrl" TEXT NOT NULL,
    "requirementText" TEXT NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "repatriationCaseId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "RuleVersion_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "DocumentRequirement" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "category" TEXT NOT NULL,
    "requiredBy" TIMESTAMP(3) NOT NULL,
    "sourceReference" TEXT NOT NULL,
    "evidenceReference" TEXT,
    "reviewNotes" TEXT,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "repatriationCaseId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "DocumentRequirement_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- CreateIndex
CREATE INDEX "WorkflowAnalysis_workflow_createdAt_idx" ON "WorkflowAnalysis"("workflow", "createdAt");

-- CreateIndex
CREATE UNIQUE INDEX "RecordReview_entity_entityId_version_actorId_key" ON "RecordReview"("entity", "entityId", "version", "actorId");

-- CreateIndex
CREATE INDEX "IssuedCredential_entity_entityId_createdAt_idx" ON "IssuedCredential"("entity", "entityId", "createdAt");

-- CreateIndex
CREATE INDEX "DomainArtifact_subjectEntity_subjectId_idx" ON "DomainArtifact"("subjectEntity", "subjectId");

-- CreateIndex
CREATE INDEX "WorkSession_respondentId_createdAt_idx" ON "WorkSession"("respondentId", "createdAt");

-- CreateIndex
CREATE INDEX "SessionMedia_sessionId_idx" ON "SessionMedia"("sessionId");

-- CreateIndex
CREATE INDEX "RepatriationCase_createdAt_idx" ON "RepatriationCase"("createdAt");

-- CreateIndex
CREATE INDEX "DeceasedRecord_createdAt_idx" ON "DeceasedRecord"("createdAt");

-- CreateIndex
CREATE INDEX "DeceasedRecord_repatriationCaseId_idx" ON "DeceasedRecord"("repatriationCaseId");

-- CreateIndex
CREATE INDEX "ConsularDocument_createdAt_idx" ON "ConsularDocument"("createdAt");

-- CreateIndex
CREATE INDEX "ConsularDocument_repatriationCaseId_idx" ON "ConsularDocument"("repatriationCaseId");

-- CreateIndex
CREATE INDEX "DestinationRequirement_createdAt_idx" ON "DestinationRequirement"("createdAt");

-- CreateIndex
CREATE INDEX "DestinationRequirement_repatriationCaseId_idx" ON "DestinationRequirement"("repatriationCaseId");

-- CreateIndex
CREATE INDEX "FuneralProvider_createdAt_idx" ON "FuneralProvider"("createdAt");

-- CreateIndex
CREATE INDEX "FuneralProvider_repatriationCaseId_idx" ON "FuneralProvider"("repatriationCaseId");

-- CreateIndex
CREATE INDEX "PreparationRecord_createdAt_idx" ON "PreparationRecord"("createdAt");

-- CreateIndex
CREATE INDEX "PreparationRecord_repatriationCaseId_idx" ON "PreparationRecord"("repatriationCaseId");

-- CreateIndex
CREATE INDEX "CargoBooking_createdAt_idx" ON "CargoBooking"("createdAt");

-- CreateIndex
CREATE INDEX "CargoBooking_repatriationCaseId_idx" ON "CargoBooking"("repatriationCaseId");

-- CreateIndex
CREATE INDEX "RepatriationHandoff_createdAt_idx" ON "RepatriationHandoff"("createdAt");

-- CreateIndex
CREATE INDEX "RepatriationHandoff_repatriationCaseId_idx" ON "RepatriationHandoff"("repatriationCaseId");

-- CreateIndex
CREATE INDEX "CaseExpense_createdAt_idx" ON "CaseExpense"("createdAt");

-- CreateIndex
CREATE INDEX "CaseExpense_repatriationCaseId_idx" ON "CaseExpense"("repatriationCaseId");

-- CreateIndex
CREATE INDEX "OperationalTask_createdAt_idx" ON "OperationalTask"("createdAt");

-- CreateIndex
CREATE INDEX "OperationalTask_repatriationCaseId_idx" ON "OperationalTask"("repatriationCaseId");

-- CreateIndex
CREATE INDEX "RuleVersion_createdAt_idx" ON "RuleVersion"("createdAt");

-- CreateIndex
CREATE INDEX "RuleVersion_repatriationCaseId_idx" ON "RuleVersion"("repatriationCaseId");

-- CreateIndex
CREATE INDEX "DocumentRequirement_createdAt_idx" ON "DocumentRequirement"("createdAt");

-- CreateIndex
CREATE INDEX "DocumentRequirement_repatriationCaseId_idx" ON "DocumentRequirement"("repatriationCaseId");

-- AddForeignKey
ALTER TABLE "DeceasedRecord" ADD CONSTRAINT "DeceasedRecord_repatriationCaseId_fkey" FOREIGN KEY ("repatriationCaseId") REFERENCES "RepatriationCase"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ConsularDocument" ADD CONSTRAINT "ConsularDocument_repatriationCaseId_fkey" FOREIGN KEY ("repatriationCaseId") REFERENCES "RepatriationCase"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DestinationRequirement" ADD CONSTRAINT "DestinationRequirement_repatriationCaseId_fkey" FOREIGN KEY ("repatriationCaseId") REFERENCES "RepatriationCase"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "FuneralProvider" ADD CONSTRAINT "FuneralProvider_repatriationCaseId_fkey" FOREIGN KEY ("repatriationCaseId") REFERENCES "RepatriationCase"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PreparationRecord" ADD CONSTRAINT "PreparationRecord_repatriationCaseId_fkey" FOREIGN KEY ("repatriationCaseId") REFERENCES "RepatriationCase"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CargoBooking" ADD CONSTRAINT "CargoBooking_repatriationCaseId_fkey" FOREIGN KEY ("repatriationCaseId") REFERENCES "RepatriationCase"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RepatriationHandoff" ADD CONSTRAINT "RepatriationHandoff_repatriationCaseId_fkey" FOREIGN KEY ("repatriationCaseId") REFERENCES "RepatriationCase"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CaseExpense" ADD CONSTRAINT "CaseExpense_repatriationCaseId_fkey" FOREIGN KEY ("repatriationCaseId") REFERENCES "RepatriationCase"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "OperationalTask" ADD CONSTRAINT "OperationalTask_repatriationCaseId_fkey" FOREIGN KEY ("repatriationCaseId") REFERENCES "RepatriationCase"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RuleVersion" ADD CONSTRAINT "RuleVersion_repatriationCaseId_fkey" FOREIGN KEY ("repatriationCaseId") REFERENCES "RepatriationCase"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DocumentRequirement" ADD CONSTRAINT "DocumentRequirement_repatriationCaseId_fkey" FOREIGN KEY ("repatriationCaseId") REFERENCES "RepatriationCase"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

