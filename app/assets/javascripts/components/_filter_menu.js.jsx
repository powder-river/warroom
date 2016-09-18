var FilterMenu = React.createClass({

  handleUpdate(event){
    console.log($('form').serializeArray());
    // this.props.updatePlayers(event.target.value)
    this.props.updatePlayers($('form').serializeArray());

  },

  corgi(event){
    console.log($('form').serializeArray());
  },


  render(){
    return(
      <div>
      <form>
        <div>
          <h2>Filters</h2>

          <label>QB</label><input type="radio" name="position" value="QB" onChange={this.handleUpdate}/>
          <label>RB</label><input type="radio" name="position" value="RB" onChange={this.handleUpdate}/>
          <label>WR</label><input type="radio" name="position" value="WR" onChange={this.handleUpdate}/>
          <label>TE</label><input type="radio" name="position" value="TE" onChange={this.handleUpdate}/>
          <label>K</label><input type="radio" name="position" value="K" onChange={this.handleUpdate}/>
          <label>DEF</label><input type="radio" name="position" value="D" onChange={this.handleUpdate}/>
        </div>

        <div>
          <label>Salary</label>
          <select onChange={ this.handleUpdate } name="saloption">
            <option value=">=">Greater Than</option>
            <option value="<="> Less Than </option>
            <option value="="> Equals </option>
          </select>

          <input type="text" name="salary" defaultValue="0" onChange={ this.handleUpdate }/>
        </div>
        {/* <button>press</button> */}
        </form>
      </div>
    )
  }
});
