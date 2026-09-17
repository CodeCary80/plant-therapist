ALTER TABLE "subscribers" ALTER COLUMN "email_address" SET NOT NULL;--> statement-breakpoint
ALTER TABLE "subscribers" ADD CONSTRAINT "subscribers_email_address_unique" UNIQUE("email_address");