var QuarterBacksFilter = React.createClass({
  render(){
    return(
      <div>
        <label>Yards Per Game</label>
        <select onChange={ this.props.filter } name="qbYardsOption">
          <option value=">=">Greater Than</option>
          <option value="<="> Less Than </option>
          <option value="="> Equals </option>
        </select>
        <input type="text" name="qbYards" defaultValue="0" onChange={ this.props.filter }/>
      </div>
    )
  }
});
