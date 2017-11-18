import React, { Component } from 'react';
import Button from '../Shared/Button';
import PropTypes from 'prop-types';

const GameRowConfirmation = (props) => {
  if (props.visible) {
    return (
      <div className="confirmation">
        <div className="confirmation__header">
          <p className="confirmation__header-text">
            Are you sure you want to join this game?
          </p>
        </div>

        <div className="confirmation__options">
          <Button onPress={() => {}}>
            Yes, let's go!
          </Button>

          <Button onPress={() => {}}>
            Not quite yet.
          </Button>
        </div>

      </div>
    );
  }

  return null;
};

GameRowConfirmation.propTypes = {
  visible: PropTypes.bool,
};

GameRowConfirmation.defaultProps = {
  visible: false,
};

export default GameRowConfirmation;
