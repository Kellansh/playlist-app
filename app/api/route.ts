import {NextRequest, NextResponse} from "next/server";
import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

export async function GET (request: NextRequest){
    const json = await prisma.song.findMany();
    
    return NextResponse.json(json);
}