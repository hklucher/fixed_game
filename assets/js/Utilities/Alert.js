import React, { Component } from "react"
import PropTypes from "prop-types"

export default class Alert extends Component {
  constructor(props) {
    super(props) 
    this.state = {
      hidden: false
    }
  }

  componentDidMount() {
    const self = this;
    setTimeout(function() {
      self.setState({ hidden: true })
    }, 10000);
  }

  render() {
    if (this.state.hidden) {
      return null 
    } else {
      return (
        <div className={`alert alert-${this.props.type}`}>
          {this.props.content}
        </div>
      )
    }
  }
}

Alert.propTypes = {
  content: PropTypes.string.isRequired,
  type: PropTypes.string.isRequired
}
