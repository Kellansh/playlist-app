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

  const makePlaylist1 = await prisma.Playlist.create({
    data: {
        name: "Blue",
        songs: {
            connect: [{ id: 1 }, { id: 2 }, { id: 3 }]
        }
    }
  });
  const makePlaylist2 = await prisma.Playlist.create({
    data: {
        name: "Orange",
        songs: {
            connect: [{ id: 3 }, { id: 2 }, { id: 3 }]
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