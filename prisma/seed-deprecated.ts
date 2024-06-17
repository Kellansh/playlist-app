const { PrismaClient } = require('@prisma/client');

const prisma = new PrismaClient()

async function main() {
  const makeSongs = await prisma.Song.createMany({
    data: [
      { name: "Victory" },
      { name: "Comeback" },
      { name: "Utopia" }
    ]
  });
  const makePlaylists = await prisma.Playlist.createMany({
    data: [
      { name: "Blue" },
      { name: "orange" },
    ]
  });
  const putSongsInPlaylist = await prisma.SongsInPlaylists.createMany({
    data: [
      { playlistId: 1, songId: 1, assignedBy: "staff" },
      { playlistId: 1, songId: 2, assignedBy: "staff" },
      { playlistId: 1, songId: 3, assignedBy: "staff" },
      { playlistId: 2, songId: 3, assignedBy: "staff" },
      { playlistId: 2, songId: 2, assignedBy: "staff" },
      { playlistId: 2, songId: 3, assignedBy: "staff" }
    ]
  });
  const playlist1 = await prisma.Playlist.update({
    where: { id: 1 },
    data: {
      SongsInPlaylists: {
        connect: [{id: 1}, {id: 2}, {id: 3}]
      }
    }
  });
}

main()
  .then(async () => {
    await prisma.$disconnect()
  })
  .catch(async (e) => {
    console.error(e)
    await prisma.$disconnect()
    process.exit(1)
  })