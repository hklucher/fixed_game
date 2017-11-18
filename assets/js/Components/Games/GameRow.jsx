import React, { Component } from 'react';
import PropTypes from 'prop-types';
import GameRowConfirmation from './GameRowConfirmation';
import Transition from 'react-transition-group/Transition'

export default class GameRow extends Component {
  constructor(props) {
    super(props);

    this.state = {
      showConfirmationExtension: false,
    };
  }

  toggleExtension() {
    this.setState({ showConfirmationExtension: !this.state.showConfirmationExtension });
  }

  goToGame() {
    const { game } = this.props;

    window.fetch('/api/user_games', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({
        user_id: USER_ID,
        game_id: game.id,
      })
      }).then(response => {
        if (response.ok) {
          window.location = `/games/${game.id}`
        }
    });
  }

  render() {
    return (
      <div className="container">
        <div className="row list-item" onClick={::this.toggleExtension}>
          <div className="col-sm-4">
            {this.props.game.title}
          </div>

          <div className="col-sm-4">
            Last active!
          </div>
        </div>

        <GameRowConfirmation
          cancel={::this.toggleExtension}
          confirm={::this.goToGame}
          visible={this.state.showConfirmationExtension}
        />
      </div>
    );
  }
}

GameRow.propTypes = {
  game: PropTypes.shape({
    id: PropTypes.number.isRequired,
    title: PropTypes.string.isRequired,
  }).isRequired,
};
