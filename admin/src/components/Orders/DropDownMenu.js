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
          <option value={"2020-05-16"}>2020-05-16</option>
          <option value={"2020-05-23"}>2020-05-23</option>
          <option value={"2020-05-30"}>2020-05-30</option>
        </Select>
      </FormControl>
    </div>
  );
}
