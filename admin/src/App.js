import React, { Component } from 'react';
import { BrowserRouter as Router, Route, Switch } from 'react-router-dom';
import { Home } from './Home';
import { About } from './About';
import { Contact } from './Contact';
import { NoMatch } from './NoMatch';
import { Layout } from './components/Layout';
import { NavigationBar }  from './components/NavigationBar';
import { Jumbotron } from './components/Jumbotron';
import { UpcomingMeals } from './components/UpcomingMeals';

const DEV_URL = "http://localhost:2000/api/";

class App extends Component{

  render(){
    return(
      <React.Fragment>
        <NavigationBar />
        <Jumbotron/>
        <Layout>
          <Router>
            <Switch>
              <Route exact path="/UpcomingMeals" component = {UpcomingMeals}/>
              <Route exact path="/about" component = {About}/>
              <Route exact path="/contact" component = {Contact}/>
              <Route component = {NoMatch}/>
            </Switch>
          </Router>
        </Layout>
      </React.Fragment>
     );
    }
  }

export default App;

