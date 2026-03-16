
// This is using w09 03-error-pages as a template
import Link from "next/link" // to link to their user page
import Image from "next/image" // to show their pfp
import pg from "pg"

export default async function Page() {
    const db = new pg.Pool({connectionString: process.env.DB_CONN})

    const result = await db.query(`select * from w10profiles`)
    const profiles = result.rows
    console.log(profiles)

    return (
        <div>
            <h1>This is the users page</h1>
            <h2>Listing all our wonderful users</h2>
            {profiles.map(profile => (
                <Link href={`/profiles/${profile.id}`} key={profile.id}>
                    {profile.name}
                </Link>
            ))}
        </div>
    )
}