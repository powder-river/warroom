var Body = React.createClass({
  getInitialState(){
    return {players: [], position: ""}
  },

  componentDidMount(){
    $.getJSON('api/v1/players.json', response => {this.setState({players: response, position: "ALL"})})
  },

  updatePlayers(filters){
    $.ajax({
      url: `api/v1/filter.json`,
      method: "GET",
      data: filters,
      success: (response) => {
        this.filterPlayers(response,filters[0].value);
      }
    });
  },

  filterPlayers(players,position){
    console.log(position);
    this.setState({players: players, position: position})
  },





  render(){
    var filteredTable;
      if(this.state.position === "QB"){
        var filteredTable = <Passers players={ this.state.players } />;
      }else{
        var filteredTable= <AllPlayers players={ this.state.players }/>;
      }
    return(

      <div>
        <FilterMenu updatePlayers={ this.updatePlayers }/>
        { filteredTable }
      </div>
    )
  }
});
