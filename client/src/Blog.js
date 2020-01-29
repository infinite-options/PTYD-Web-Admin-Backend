import React, {useEffect, useContext} from 'react';

import axios from "axios";
import {Context} from './Store'
import { render } from 'react-dom';


const Blog = () => {

    const [state, dispatch] = useContext(Context);

    useEffect(() => {
        axios.get('/posts.json')
            .then(response => {
                const postsData = response.data;
                dispatch({type: 'SET_POSTS', payload: postsData});
            })
            .catch(error => {
                dispatch({type: 'SET_ERROR', payload: error});
            });
    }, []);

    let posts = <p>Loading...</p>;

    if (state.error) {
        posts = <p>Something went wrong: <span>{state.error}</span></p>;
    }

    if (!state.error && state.posts) {
        posts = <p>yay {state.test} </p>;
    }

    return <p>hey hey</p>;
}


export default Blog;