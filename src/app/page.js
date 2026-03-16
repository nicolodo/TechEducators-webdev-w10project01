// import Image from "next/image";
// import React from "react";
import { getUser } from "../utils/getUser";

export default async function Home() {
  const userDetails = await getUser()
  return (
    <div>
      <h1>Super Amazing Home Page!!!!</h1>
      <p>Click below to get some more info</p>
    </div>
  )
}
