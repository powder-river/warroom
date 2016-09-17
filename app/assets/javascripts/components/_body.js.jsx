var Body = React.createClass({
  getInitialState(){
    return {players: []}
  },

  componentDidMount(){
    $.getJSON('api/v1/players.json', response => {this.setState({players: response})})
  },

  updatePlayers(){
    console.log("Running FIlter")
    $.ajax({
      url: `api/v1/filter.json`,
      method: "GET",
      success: (response) => {
        console.log(response)
        this.filterPlayers({players: response});
      }
    });
  },

  filterPlayers(players){
    console.log("replacingState")
    this.replaceState({players: players})
    console.log("done")
  },


  render(){
    return(

      <div>
        <AllPlayers players={ this.state.players } updatePlayers={ this.updatePlayers } />
      </div>
    )
  }
});
