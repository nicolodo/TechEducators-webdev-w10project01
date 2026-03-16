
import Link from "next/link";

export default function NavBar() {
    return (
        <nav className="flex justify-center gap-6 p-4">
            <Link href="/" className="hover:opacity-60 transition-opacity">Home</Link>
            <Link href="/users" className="hover:opacity-60 transition-opacity">users</Link>
            <Link href="/profile" className="hover:opacity-60 transition-opacity">profile</Link>
        </nav>
    )
}
