var FilterMenu = React.createClass({

  handleUpdate(position){
    this.props.updatePlayers(position.target.value)
  },


  render(){
    return(
      <div>
        <h2>Filters</h2>
        <input type="radio" name="position" value="QB" onChange={this.handleUpdate}/><label>QB</label>
        <input type="radio" name="position" value="RB" onChange={this.handleUpdate}/><label>RB</label>
        <input type="radio" name="position" value="WR" onChange={this.handleUpdate}/><label>WR</label>
        <input type="radio" name="position" value="TE" onChange={this.handleUpdate}/><label>TE</label>
        <input type="radio" name="position" value="K" onChange={this.handleUpdate}/><label>K</label>
        <input type="radio" name="position" value="D" onChange={this.handleUpdate}/><label>DEF</label>
      </div>
    )
  }
});
