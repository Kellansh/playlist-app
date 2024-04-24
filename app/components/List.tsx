import playlist from '../data/playlist.json'

export default function List() {
    return (
        <ol>
            {playlist.song.map(({id, name, artist}) => (
                <li key={id}>{name} - {artist}</li>
            ))}
        </ol>
    )
}