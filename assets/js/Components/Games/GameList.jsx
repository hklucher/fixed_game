import React, { Component } from 'react';
import GameRow from './GameRow';

export default class GameList extends Component {
  constructor(props) {
    super(props);

    this.state = {
      games: [],
    };
  }

  componentWillMount() {
    window.fetch('/api/games').then(response =>
      response.json()).then((json) => {
      this.setState({ games: json.games });
    });
  }


  render() {
    const { games } = this.state;

    return (
      <div className="container">
        {games.map(game => <GameRow key={game.id} game={game} />)}
      </div>
    );
  }
}
