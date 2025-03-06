-- CreateEnum
CREATE TYPE "TicketPhase" AS ENUM ('IN_PROGRESS', 'UNDER_PROGRESS', 'CREATED');

-- CreateTable
CREATE TABLE "Boards" (
    "id" SERIAL NOT NULL,
    "title" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Boards_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Ticket" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "discreption" TEXT NOT NULL,
    "ticketPhase" "TicketPhase" NOT NULL DEFAULT 'CREATED',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "boardsId" INTEGER,

    CONSTRAINT "Ticket_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "Ticket" ADD CONSTRAINT "Ticket_boardsId_fkey" FOREIGN KEY ("boardsId") REFERENCES "Boards"("id") ON DELETE SET NULL ON UPDATE CASCADE;
