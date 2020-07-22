import React, { useState } from "react";
import { Typography, Link, Breadcrumbs, InputBase, Grid } from "@material-ui/core";
import { fade, makeStyles } from "@material-ui/core/styles";
import SearchIcon from "@material-ui/icons/Search";

import CustomerInfo from "./CustomerInfo";
import AllPayments from "./AllPayments";
import Graph from "../Homepage/mapGraph";

const useStyles = makeStyles((theme) => ({
    root: {
        flexGrow: 1,
    },
    menuButton: {
        marginRight: theme.spacing(2),
    },
    title: {
        flexGrow: 1,
        display: "none",
        [theme.breakpoints.up("sm")]: {
            display: "block",
        },
    },
    search: {
        position: "relative",
        borderRadius: theme.shape.borderRadius,
        backgroundColor: fade(theme.palette.common.black, 0.15),
        "&:hover": {
            backgroundColor: fade(theme.palette.common.black, 0.25),
        },
        marginLeft: 0,
        width: "300px",
        [theme.breakpoints.up("sm")]: {
            marginLeft: theme.spacing(1),
            width: "300px",
        },
    },
    searchIcon: {
        padding: theme.spacing(0, 2),
        height: "100%",
        position: "absolute",
        pointerEvents: "none",
        display: "flex",
        alignItems: "center",
        justifyContent: "center",
    },
    inputRoot: {
        color: "inherit",
    },
    inputInput: {
        padding: theme.spacing(1, 1, 1, 0),
        // vertical padding + font size from searchIcon
        paddingLeft: `calc(1em + ${theme.spacing(4)}px)`,
        transition: theme.transitions.create("width"),
        width: "240px",
        [theme.breakpoints.up("sm")]: {
            width: "240px",
            "&:focus": {
                width: "240px",
            },
        },
    },
}));

export default function Customers(props) {
    const classes = useStyles();

    const [searchID, setSearchID] = useState(null);
    const [value, setValue] = useState(null);

    const onChange = (e) => {
        setValue(e.target.value);
    };

    const keyPress = (e) => {
        if (e.keyCode === 13) {
            setSearchID(value);
        }
    };

    return (
      <div style={{ padding: "10px 20px" }}>
        <Breadcrumbs aria-label="breadcrumb" style={{ marginBottom: "10px" }}>
          <Link color="inherit">Admin Site</Link>
          <Typography color="textPrimary">Customers</Typography>
        </Breadcrumbs>
        <div className={classes.search}>
          <div className={classes.searchIcon}>
            <SearchIcon />
          </div>
          <InputBase
            placeholder="Enter the Customer ID/Name"
            inputProps={{ "aria-label": "search" }}
            classes={{
              root: classes.inputRoot,
              input: classes.inputInput,
            }}
            onChange={onChange}
            value={value || ""}
            onKeyDown={keyPress}
          />
        </div>
        {searchID && (
            <Grid container>
                <Grid item xs="4">
                    <CustomerInfo searchID={searchID} PURCHASE_API_URL={props.PURCHASE_API_URL} />
                </Grid>
                <Grid item xs="4">
                    <AllPayments searchID={searchID} PURCHASE_API_URL={props.PURCHASE_API_URL} />
                </Grid>
                <Grid item xs="4">
                    Latest Activity stuff
                </Grid>
            </Grid>
        )}
     </div>
    );
}
