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

          <label>Salary</label>
          <select onChange={ this.handleUpdate } name="position">
            <option value="QB">QB</option>
            <option value="RB">RB</option>
            <option value="WR">WR</option>
            <option value="TE">TE</option>
            <option value="K">K</option>
            <option value="D">DEF</option>
          </select>
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
