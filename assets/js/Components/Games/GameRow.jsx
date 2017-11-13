import React, { Component } from 'react';
import PropTypes from 'prop-types';
import GameRowConfirmation from './GameRowConfirmation';

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

  render() {
    return (
      <div>
        <div className="row list-item" onClick={::this.toggleExtension}>
          <div className="col-sm-4">
            {this.props.game.title}
          </div>

          <div className="col-sm-4">
            Last active!
          </div>
        </div>
        
        <GameRowConfirmation visible={this.state.showConfirmationExtension} />
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
