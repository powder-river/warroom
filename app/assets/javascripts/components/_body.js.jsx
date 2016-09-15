var Body = React.createClass({
  getInitialState(){
    return {players: []}
  },

  componentDidMount(){
    $.getJSON('api/v1/players.json', response => {this.setState({players: response})})
  },


  render(){
    return(
      <div>
        <AllPlayers players={ this.state.players }/>
      </div>
    )
  }
});
