// app/posts/[id]/page.js
import Image from "next/image";
import { db } from "@/utils/connect"
import { notFound } from "next/navigation";

export default async function PostPage({ params }) {
  const slug = await params;
  const profile = (await db.query(
    `SELECT * FROM w10profiles WHERE id = $1`,[`${slug.id}`])).rows;

  // if there is no profile, run the notFound function to show the not-found.js page.
  if (!profile) {
    notFound();
  }

  // otherwise, get on with rendering the page.
  return (
    <div>
      <h2>{profile.username}</h2>
      <p>{profile.bio}</p>
    </div>
  );
}