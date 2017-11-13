import React from 'react';
import ReactCSSTransitionGroup from 'react-addons-css-transition-group'
import PropTypes from 'prop-types';

const GameRowConfirmation = (props) => {
  if (props.visible) {
    return (
      <ReactCSSTransitionGroup>
        <div className="confirmation">
          <div className="confirmation__header">
            <p className="confirmation__header-text">
              Are you sure you want to join this game?
            </p>
          </div>

          <div className="confirmation__options">
            <button className="btn btn-primary confirmation__options-action">
              Yes, let's go!
            </button>

            <button className="btn btn-primary confirmation__options-action">
              Not quite yet.
            </button>
          </div>

        </div>
      </ReactCSSTransitionGroup>
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
