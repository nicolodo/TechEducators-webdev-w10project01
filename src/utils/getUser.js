import { db } from "./connect"; // db for some reason I thought the other util handled that
import { auth } from "@clerk/nextjs/server" 
import { redirect } from "next/navigation"; // This component can do an auto redirect


export async function getUser() {
    const { userId } = await auth() // get users clerk id

    // if there is no userId, we'll the ask the user to sign in 
    // (as they're not logged in via clerk)
    if (!userId) redirect('/sign-in')
    
    // check database to see if it has that user in it
    const userDetails = (await db.query(
        `select * from w10profiles where id = $1`, [userId])).rows

    // if nothing came back for that user
    if (userDetails.length === 0) redirect('/users/onboarding')
    
    return userDetails
}