-- Add password reset functionality
-- This migration adds fields for password reset tokens

-- Add password reset fields to User table
ALTER TABLE "User" ADD COLUMN IF NOT EXISTS "password_reset_token" TEXT;
ALTER TABLE "User" ADD COLUMN IF NOT EXISTS "password_reset_expires" TIMESTAMP(3);

-- Create index for faster lookups
CREATE INDEX IF NOT EXISTS "User_password_reset_token_idx" ON "User"("password_reset_token");