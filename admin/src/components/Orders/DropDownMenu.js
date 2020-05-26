import React from "react";
import { makeStyles } from "@material-ui/core/styles";
import InputLabel from "@material-ui/core/InputLabel";
import FormControl from "@material-ui/core/FormControl";
import Select from "@material-ui/core/Select";

const useStyles = makeStyles((theme) => ({
  formControl: {
    margin: theme.spacing(1),
    minWidth: 120,
  },
  selectEmpty: {
    marginTop: theme.spacing(2),
  },
}));

export default function DropDownMenu(props) {
  const classes = useStyles();

  return (
    <div>
      <FormControl className={classes.formControl}>
        <InputLabel htmlFor="date-native-simple">Date</InputLabel>
        <Select
          native
          value={props.date}
          onChange={props.handleChange}
          id="date-native-simple"
        >
          <option aria-label="None" value="" />
          <option value={10}>May 24, 2020</option>
          <option value={20}>May 25, 2020</option>
          <option value={30}>May 26, 2020</option>
        </Select>
      </FormControl>
    </div>
  );
}
