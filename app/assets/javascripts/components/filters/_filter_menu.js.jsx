var FilterMenu = React.createClass({
  handleFilter(event){
//     console.log($('form').serializeArray());
    this.props.updatePlayers($('form').serializeArray());
  },


  render(){
    var positionFilters;
    console.log(this.props.position)
    if(this.props.position == "QB"){
      var positionFilters = <QuarterBacksFilter filter={ this.handleFilter }/> ;
    }

    return(
      <div>
      <form>
        <div>
          <h2>Filters</h2>

          <label>Salary</label>
          <select onChange={ this.handleFilter } name="position">
            <option value="*">ALL</option>
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
          <select onChange={ this.handleFilter } name="saloption">
            <option value=">=">Greater Than</option>
            <option value="<="> Less Than </option>
            <option value="="> Equals </option>
          </select>
          <input type="text" name="salary" defaultValue="0" onChange={ this.handleFilter }/>
        </div>

        { positionFilters }

        {/* <QuarterBacksFilter filter={ this.handleFilter }/> */}
        {/* <button>press</button> */}
        </form>
      </div>
    )
  }
});
