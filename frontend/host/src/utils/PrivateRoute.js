import React from 'react';
import { Navigate } from 'react-router-dom';
import { useSelector } from 'react-redux';

import history from './history';
import { selectAccount } from '../app/store/authSlice';

function PrivateRoute({ children })
{
    const account = useSelector(selectAccount)

    if (!account)
        return (<Navigate to="/login" state={{ from: history.location }} />);
    return children
}

export default PrivateRoute;

