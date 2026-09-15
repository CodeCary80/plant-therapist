ALTER TABLE "subscribers" DROP CONSTRAINT "subscribers_email_address_unique";--> statement-breakpoint
ALTER TABLE "subscribers" ALTER COLUMN "email_address" DROP NOT NULL;--> statement-breakpoint
ALTER TABLE "subscribers" ADD COLUMN "email" varchar(254) NOT NULL;--> statement-breakpoint
ALTER TABLE "subscribers" ADD CONSTRAINT "subscribers_email_unique" UNIQUE("email");