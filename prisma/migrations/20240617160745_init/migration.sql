/*
  Warnings:

  - The primary key for the `SongsInPlaylists` table will be changed. If it partially fails, the table could be left without primary key constraint.

*/
-- AlterTable
ALTER TABLE "SongsInPlaylists" DROP CONSTRAINT "SongsInPlaylists_pkey",
ADD COLUMN     "id" SERIAL NOT NULL,
ADD CONSTRAINT "SongsInPlaylists_pkey" PRIMARY KEY ("id");
