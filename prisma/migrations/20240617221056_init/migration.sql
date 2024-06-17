/*
  Warnings:

  - You are about to drop the `SongsInPlaylists` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "SongsInPlaylists" DROP CONSTRAINT "SongsInPlaylists_playlistId_fkey";

-- DropForeignKey
ALTER TABLE "SongsInPlaylists" DROP CONSTRAINT "SongsInPlaylists_songId_fkey";

-- DropTable
DROP TABLE "SongsInPlaylists";

-- CreateTable
CREATE TABLE "_PlaylistToSong" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_PlaylistToSong_AB_unique" ON "_PlaylistToSong"("A", "B");

-- CreateIndex
CREATE INDEX "_PlaylistToSong_B_index" ON "_PlaylistToSong"("B");

-- AddForeignKey
ALTER TABLE "_PlaylistToSong" ADD CONSTRAINT "_PlaylistToSong_A_fkey" FOREIGN KEY ("A") REFERENCES "Playlist"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_PlaylistToSong" ADD CONSTRAINT "_PlaylistToSong_B_fkey" FOREIGN KEY ("B") REFERENCES "Song"("id") ON DELETE CASCADE ON UPDATE CASCADE;
