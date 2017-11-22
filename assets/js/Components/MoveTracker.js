import React, { Component } from 'react';
import PropTypes from 'prop-types';
import { calculateNumberOfMoves } from '../helpers/gameHelpers';

export default class MoveTracker extends Component {
  render() {
    return (
      <div>
        {`Move ${calculateNumberOfMoves(this.props.board)}/9`}
      </div>
    )
  }
}

MoveTracker.propTypes = {
  board: PropTypes.object.isRequired,
};