export default function Header() {
    return (
        <header>
            <a className="logo">Playlist App!</a>
            <nav className="flex items-center space-x-4">
                <a>Browse</a>
                <a>Search bar</a>
                <a>Advanced Search</a>
                <a>Log In</a>
                <a>Sign Up</a>
            </nav>
        </header>
    )
}