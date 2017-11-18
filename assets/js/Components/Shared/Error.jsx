import React from 'react';
import PropTypes from 'prop-types';

const Error = (props) => (props.visible ? <div className="err-container">{props.message}</div> : null)

Error.propTypes = {
  message: PropTypes.string.isRequired,
  visible: PropTypes.bool,
};

Error.defaultProps = {
  visible: false,
};

export default Error;
